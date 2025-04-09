crazytaxi(A,B,C,D,N) :- 
    fd_domain([A,B,C,D],1,100),
    fd_domain(N,1,1000000),
    A**3 + B**3 #= N, 
    C**3 + D**3 #= N, 
    A#=<B,
    C#=<D,
    A#<C,
    fd_minimize(fd_labeling([A,B,C,D,N]), N).