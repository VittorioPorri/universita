modL([],[]).
modL([[P,A]|T],[[P,A,4]|T1]):-
    modL(T,T1).

len([], 0).
len([_|T], M) :-
    len(T, N),
    M is N + 1.

%aula 1
gAula1(L, Aula1, L) :-
    len(Aula1, 8).

gAula1([[_, _, 0] | T], Aula1, NewL) :-
    gAula1(T, Aula1, NewL).

gAula1([[P,A,N]|T], [[P,A]|Aula1], [[P,A,N1]|T]) :-
    N > 0,
    N1 is N - 1,
    gAula1([[P,A,N1]|T], Aula1, NewL).

gAula1([_ | T], Aula1, NewL) :-
    gAula1(T, Aula1, NewL).

%aula 2
gAula2(L, _, Aula2, L) :-
    len(Aula2, 8).

gAula2([[_, _, 0] | T], Aula1, Aula2, NewL) :-
    gAula2(T, Aula1, Aula2, NewL).

gAula2([[P,A,N]|T], [[_,A1]|Aula1],[[P,A]|Aula2], [[P,A,N1]|T]) :-
    N > 0,
    A =\= A1,
    N1 is N - 1,
    gAula2([[P,A,N1]|T], Aula1, Aula2, NewL).

gAula2([_ | T], Aula1, Aula2, NewL) :-
    gAula2(T, Aula1, Aula2, NewL).


g(L,X,Y,NewL):-
    gAula1(L,X,O),
    gAula2(O,X,Y,NewL).

orario(L,[giorno(X1,X2), giorno(Y1,Y2),giorno(Z1,Z2)]):-
    modL(L,ModL),
    g(ModL,X1,X2,ModL1),
    g(ModL1,Y1,Y2,ModL2),
    g(ModL2,Z1,Z2,_).
    
    

