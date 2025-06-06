colpoOrizzontale(_, _, 0, _, []).
colpoOrizzontale(X, _, _, _, []) :- X < 0.
colpoOrizzontale(X, _, _, M, []) :- X >= M.
colpoOrizzontale(_, Y, _, _, []) :- Y < 0.
colpoOrizzontale(_, Y, _, M, []) :- Y >= M.
colpoOrizzontale(X, Y, N, M, [[X, Y]|T]) :-
    N > 0,
    X >= 0, X < M,
    Y >= 0, Y < M,
    X1 is X + 1,
    N1 is N - 1,
    colpoOrizzontale(X1, Y, N1, M, T).


colpoOrizzontaleR(_, _, 0, _, []).
colpoOrizzontaleR(X, _, _, _, []) :- X < 0.
colpoOrizzontaleR(X, _, _, M, []) :- X >= M.
colpoOrizzontaleR(_, Y, _, _, []) :- Y < 0.
colpoOrizzontaleR(_, Y, _, M, []) :- Y >= M.
colpoOrizzontaleR(X, Y, N, M, [[X, Y]|T]) :-
    N > 0,
    X >= 0, X < M,
    Y >= 0, Y < M,
    X1 is X - 1,
    N1 is N - 1,
    colpoOrizzontaleR(X1, Y, N1, M, T).


colpoVerticale(_, _, 0, _, []).
colpoVerticale(_, Y, _, _, []) :- Y < 0.
colpoVerticale(_, Y, _, M, []) :- Y >= M.
colpoVerticale(X, _, _, _, []) :- X < 0.
colpoVerticale(X, _, _, M, []) :- X >= M.
colpoVerticale(X, Y, N, M, [[X,Y]|T]) :-
    N > 0,
    X >= 0, X < M,
    Y >= 0, Y < M,
    Y1 is Y + 1,
    N1 is N - 1,
    colpoVerticale(X, Y1, N1, M, T).


colpoVerticaleR(_, _, 0, _, []).
colpoVerticaleR(_, Y, _, _, []) :- Y < 0.
colpoVerticaleR(_, Y, _, M, []) :- Y >= M.
colpoVerticaleR(X, _, _, _, []) :- X < 0.
colpoVerticaleR(X, _, _, M, []) :- X >= M.
colpoVerticaleR(X, Y, N, M, [[X,Y]|T]) :-
    N > 0,
    X >= 0, X < M,
    Y >= 0, Y < M,
    Y1 is Y - 1,
    N1 is N - 1,
    colpoVerticaleR(X, Y1, N1, M, T).

colpoObliquoUR(_, _, 0, _, []).
colpoObliquoUR(X, Y, _, _, []) :- X < 0; Y < 0.
colpoObliquoUR(X, Y, _, M, []) :- X >= M; Y >= M.
colpoObliquoUR(X, Y, N, M, [[X, Y]|T]) :-
    N > 0,
    X >= 0, X < M,
    Y >= 0, Y < M,
    X1 is X + 1,
    Y1 is Y + 1,
    N1 is N - 1,
    colpoObliquoUR(X1, Y1, N1, M, T).


colpoObliquoDL(_, _, 0, _, []).
colpoObliquoDL(X, Y, _, _, []) :- X < 0; Y < 0.
colpoObliquoDL(X, Y, _, M, []) :- X >= M; Y >= M.
colpoObliquoDL(X, Y, N, M, [[X, Y]|T]) :-
    N > 0,
    X >= 0, X < M,
    Y >= 0, Y < M,
    X1 is X - 1,
    Y1 is Y - 1,
    N1 is N - 1,
    colpoObliquoDL(X1, Y1, N1, M, T).

colpoObliquoDR(_, _, 0, _, []).
colpoObliquoDR(X, Y, _, _, []) :- X < 0; Y < 0.
colpoObliquoDR(X, Y, _, M, []) :- X >= M; Y >= M.
colpoObliquoDR(X, Y, N, M, [[X, Y]|T]) :-
    N > 0,
    X >= 0, X < M,
    Y >= 0, Y < M,
    X1 is X + 1,
    Y1 is Y - 1,
    N1 is N - 1,
    colpoObliquoDR(X1, Y1, N1, M, T).


colpoObliquoUL(_, _, 0, _, []).
colpoObliquoUL(X, Y, _, _, []) :- X < 0; Y < 0.
colpoObliquoUL(X, Y, _, M, []) :- X >= M; Y >= M.
colpoObliquoUL(X, Y, N, M, [[X, Y]|T]) :-
    N > 0,
    X >= 0, X < M,
    Y >= 0, Y < M,
    X1 is X - 1,
    Y1 is Y + 1,
    N1 is N - 1,
    colpoObliquoUL(X1, Y1, N1, M, T).

appendC(L1, L2, L3, L4, L5, L6, L7, L8, NewL) :-
    append(L1, L2, R1),
    append(R1, L3, R2),
    append(R2, L4, R3),
    append(R3, L5, R4),
    append(R4, L6, R5),
    append(R5, L7, R6),
    append(R6, L8, NewL).

posizioniNonSicure([], []).
posizioniNonSicure([[X,Y]|T],N, M,[NewL|T1]):-
	colpoOrizzontale(X,Y,N,M,L1),
	colpoOrizzontaleR(X,Y,N,M,L2),
	colpoVerticale(X,Y,N,M,L3),
    colpoVerticaleR(X,Y,N,M,L4),
    colpoObliquoUR(X,Y,N,M,L5),
    colpoObliquoDL(X,Y,N,M,L6),
    colpoObliquoDR(X,Y,N,M,L7),
    colpoObliquoUL(X,Y,N,M,L8),
    appendC(L1, L2, L3, L4, L5, L6, L7, L8, NewL),
    posizioniNonSicure(T,N,M,T1).

% sicure verifica che la posizione X,Y non è in NotL e se è cosi la aggiunge in sicure.

posizioniSicure(P ,N, M, L):- posizioniNonSicure(P, N, M, NotL), sicure(NotL,L).









