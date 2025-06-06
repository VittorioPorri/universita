numero(A,B,C,Num):-
    Num is (A*100)+(B*10)+C.

calcolo(A,B,C,D,E,F,G,H,I):-
    F is C+H,
    H is E-A,
    A is G-F,
    numero(A,B,C,N1),
    numero(0,D,E,N2),
    numero(F,E,G,N3),
    N3 is N1+N2,
    numero(0,D,H,N4),
    numero(0,E,A,N5),
    numero(A,C,F,N6),
    N6 is N4*N5,
    numero(F,D,F,N7),
    numero(0,I,A,N8),
    H =\= 0,
    N8 is N7/H.
    

cifra(X) :- member(X, [0,1,2,3,4,5,6,7,8,9]).

assegna_cifre([]).
assegna_cifre([H|T]) :-
    cifra(H),
    assegna_cifre(T).

sol(L) :-
    length(L, 9),
    assegna_cifre(L),
    L = [A,B,C,D,E,F,G,H,I],
    calcolo(A,B,C,D,E,F,G,H,I).
