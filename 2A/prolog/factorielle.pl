fact(0,1).
fact(1,1).

fact(Y,Z) :- Y =:=1, fact(1,1). 
fact(N,Z) :- N1 is N-1, fact(N1,W), Z is W*N.