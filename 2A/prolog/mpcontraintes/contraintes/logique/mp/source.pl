:- include(taxi).

tab(1,L1,L2,T,[Ts]) :-
    Max is T-Ts,fd_domain(X,0,Max),fd_domain(Y,0,Max),L1 = [X],L2 = [Y].

tab(N,L1,L2,T,[Ts|QT]) :-
    Max is T-Ts,N1 is N-1,tab(N1,Q1,Q2,T,QT),fd_domain(X,0,Max),fd_domain(Y,0,Max),append(Q1,[X],L1),append(Q2,[Y],L2).


different(Xtb,Xte,Ytb,Yte,[],[],[]).

different(Xtb,Xte,Ytb,Yte,[X|Q1],[Y|Q2],[Ts|QT]) :- 
    Xe #= X+Ts,
    Ye #= Y+Ts,
    (Xe #< Xtb #\/ Xte #=< X) #\/ (Ye #< Ytb #\/ Yte #=< Y),
    different(Xtb,Xte,Ytb,Yte,Q1,Q2,QT).

all_different([X],[Y],[Ts]).

all_different([X|Q1],[Y|Q2],[Ts|QT]) :-
    different(X,X+Ts,Y,Y+Ts,Q1,Q2,QT),all_different(Q1,Q2,QT).

solve(Num,Xs,Ys) :-
    data(Num,N,L),
    length(L,Nu),
    Len #= Nu,
    T #= N,
    reverse(L,LR),
    tab(Len,Xs,Ys,T,LR),
    all_different(Xs,Ys,L),
    fd_labeling(Xs),
    fd_labeling(Ys),
    printsol('tiles.txt', Xs, Ys, L).

    
