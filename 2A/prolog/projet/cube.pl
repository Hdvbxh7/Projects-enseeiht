/*on indique que les faits concernants on/2 évoluent*/
:-dynamic(on/2).
:-dynamic(move/2).

%situation intiale
on(c,table).
on(a,b).
on(b,c).

/* prédivats intermédiares*/
libre(X,Y):- X\=Y,\+ on(_,Y),\+ on(_,X).
dessus(X,Y):- X\=table,on(Y,X).

/*put_on(X,Y) d'abord pour les préconditions,on ne peut mettre un objet sur lui même, on ne peut pas mettre la table sur un objet, on(_,X) est faux, ensuite on(_,Y) est faux si Y n'est pas la table, et pour les posts conditions il faut que on(X,Y) soit vrai, et qu'il n'y ai plus de X sur autre chose*/
put_on(table,X):-false.

put_on(X,table):- \+ on(_,X),retractall(on(X,_)), assertz(on(X,table)),assertz(move(X,table)).

put_on(X,Y) :- libre(X,Y),retractall(on(X,_)), assertz(on(X,Y)),assertz(move(X,Y)).

clear(X):-dessus(X,Y),clear(Y),put_on(Y,table).
clear(X).

r_put_on(X,Y):-clear(X),clear(Y),put_on(X,Y).

/*si on lui demande de le faire en l'état, comme c n'est plus libre à la fin, on n'obtient pas la bonne configuration à la fin*/
achieven([on(X,Y)]):-r_put_on(X,Y),listing(move),retractall(move(_,_)).
achieven([on(X,Y)|T]):-r_put_on(X,Y),achieven(T).
achievef([on(X,Y)]):-retractall(move(_,_)),r_put_on(X,Y),listing(move),retractall(move(_,_)).
achievef([on(X,Y)|T]):-retractall(move(_,_)),r_put_on(X,Y),achieven(T).



/*version bonne configuation avec sort*/
add([on(X2,Y2)],[],P):-P = [on(X2,Y2)].
add([on(X2,Y2)|T2],[],P):-add(T2,F,Z),P = [on(X2,Y2)|Z].
add(Z,F,P):-add(Z,[],D),P=[F|D].

sort(D,[],P):- P = [D].
sort(on(X,Y),Z,P):-Z=[on(X2,Y2)|T2],X==Y2,add(Z,on(X,Y),P).
sort(on(X,Y),[on(X2,Y2)|T2],P):-sort(on(X,Y),T2,Z),P=[on(X2,Y2)|Z].

sortx([],Z,Y).
sortx([on(X,Y)|T],[],S):-sortx(T,[on(X,Y)],S).
sortx([on(X1,Y1)|T1],Z,S):-sort(on(X1,Y1),Z,E),D=E,F=E,sortx(T1,F,D),S=D.

%je pense que le probléme vient du D=E qui n'est plus vrai quand le programme a fini le sort qui casse tout mais je n'ai pas réussi à le résoudre%

achieve(X):-sortx(X,Z),achievef(Z).