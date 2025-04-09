sum([],0).

sum([T|Q],T+S) :- 
    sum(Q,S).

peinture(Donne,Prix,Rendu) :-
    Rendu = [A,B,C,D,E,F,G,H],
    fd_domain(Rendu,0,3),
    200 * A + 100*B + 50*C + 20*D + 10*E + 5*F + 2*G + H #= Donne - Prix,
    sum(Rendu,S),
    Cost #= S,
    fd_minimize(fd_labeling(Rendu),Cost).
