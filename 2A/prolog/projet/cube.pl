/*on indique que les faits concernants on/2 évoluent*/
:-dynamic(on/2).
:-dynamic(move/2).

%situation intiale
on(c,table).
on(a,b).
on(b,c).

/* prédivats intermédiares*/
libre(X,Y):- X\=Y,\+ on(_,Y),\+ on(_,X).


/*put_on(X,Y) d'abord pour les préconditions,on ne peut mettre un objet sur lui même, on ne peut pas mettre la table sur un objet, on(_,X) est faux, ensuite on(_,Y) est faux si Y n'est pas la table, et pour les posts conditions il faut que on(X,Y) soit vrai, et qu'il n'y ai plus de X sur autre chose*/
put_on(table,X):-false.

put_on(X,table):- \+ on(_,X),retractall(on(X,_)), assertz(on(X,table)),assertz(move(X,table)).

put_on(X,Y) :- libre(X,Y) ,retractall(on(X,_)), assertz(on(X,Y)),assertz(move(X,Y)).

clear(X):- X\=table,on(Y,X),clear(Y),put_on(X,Y).