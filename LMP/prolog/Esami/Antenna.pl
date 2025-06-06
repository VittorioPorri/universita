
% Angoli per c
copre(_, X, Y, c, [[X,Y],[X,Y1],[X1,Y]]) :- X =:= 1, Y =:= 1, Y1 is Y+1, X1 is X+1.
copre(M, X, Y, c, [[X,Y],[X,Y1],[X1,Y]]) :- X =:= 1, Y =:= M, Y1 is Y-1, X1 is X+1.
copre(M, X, Y, c, [[X,Y],[X,Y1],[X1,Y]]) :- X =:= M, Y =:= 1, Y1 is Y+1, X1 is X-1.
copre(M, X, Y, c, [[X,Y],[X,Y1],[X1,Y]]) :- X =:= M, Y =:= M, Y1 is Y-1, X1 is X-1.

% Bordi per c
copre(M, X, Y, c, [[X,Y],[X1,Y],[X2,Y],[X,Y1]]) :- X =:= 1, Y > 1, Y < M, X1 is X+1, X2 is X+2, Y1 is Y+1.
copre(M, X, Y, c, [[X,Y],[X1,Y],[X2,Y],[X,Y1]]) :- X =:= M, Y > 1, Y < M, X1 is X-1, X2 is X-2, Y1 is Y-1.
copre(M, X, Y, c, [[X,Y],[X,Y1],[X,Y2],[X1,Y]]) :- Y =:= 1, X > 1, X < M, Y1 is Y+1, Y2 is Y+2, X1 is X+1.
copre(M, X, Y, c, [[X,Y],[X,Y1],[X,Y2],[X1,Y]]) :- Y =:= M, X > 1, X < M, Y1 is Y-1, Y2 is Y-2, X1 is X-1.

% Centro per c
copre(M, X, Y, c, [[X,Y],[X,Y1],[X,Y2],[X1,Y],[X2,Y]]) :-
    X > 1, X < M, Y > 1, Y < M,
    Y1 is Y-1, Y2 is Y+1, X1 is X-1, X2 is X+1.

% Angoli per q
copre(_, X, Y, q, [[X,Y],[X,Y1],[X1,Y],[X1,Y1]]) :- X =:= 1, Y =:= 1, Y1 is Y+1, X1 is X+1.
copre(M, X, Y, q, [[X,Y],[X,Y1],[X1,Y],[X1,Y1]]) :- X =:= 1, Y =:= M, Y1 is Y-1, X1 is X+1.
copre(M, X, Y, q, [[X,Y],[X,Y1],[X1,Y],[X1,Y1]]) :- X =:= M, Y =:= 1, Y1 is Y+1, X1 is X-1.
copre(M, X, Y, q, [[X,Y],[X,Y1],[X1,Y],[X1,Y1]]) :- X =:= M, Y =:= M, Y1 is Y-1, X1 is X-1.

% Bordi per q
copre(M, X, Y, q, [[X,Y],[X1,Y],[X2,Y],[X,Y1],[X1,Y1],[X2,Y1]]) :-
    X =:= 1, Y > 1, Y < M, X1 is X+1, X2 is X+2, Y1 is Y+1.
copre(M, X, Y, q, [[X,Y],[X1,Y],[X2,Y],[X,Y1],[X1,Y1],[X2,Y1]]) :-
    X =:= M, Y > 1, Y < M, X1 is X-1, X2 is X-2, Y1 is Y-1.
copre(M, X, Y, q, [[X,Y],[X,Y1],[X,Y2],[X1,Y],[X1,Y1],[X1,Y2]]) :-
    Y =:= 1, X > 1, X < M, Y1 is Y+1, Y2 is Y+2, X1 is X+1.
copre(M, X, Y, q, [[X,Y],[X,Y1],[X,Y2],[X1,Y],[X1,Y1],[X1,Y2]]) :-
    Y =:= M, X > 1, X < M, Y1 is Y-1, Y2 is Y-2, X1 is X-1.

% Centro per q
copre(M, X, Y, q, [[X,Y],[X1,Y],[X2,Y],[X,Y1],[X1,Y1],[X2,Y1],[X,Y2],[X1,Y2],[X2,Y2]]) :-
    X > 1, X < M, Y > 1, Y < M,
    X1 is X-1, X2 is X+1,
    Y1 is Y-1, Y2 is Y+1.



appendCustom([], P, P, 0).

appendCustom([H|T], P, Result, M) :-
    \+ member(H, P),
    append(P, [H], NewP),
    appendCustom(T, NewP, Result, N),
    M is N + 1.

appendCustom([H|T], P, Result, M) :-
    member(H, P),
    appendCustom(T, P, Result, M).



posizioni([], _, _, 0).

posizioni([[Tipo,X,Y]|T], M, Pc, C) :-
    copre(M, X, Y, Tipo, P),
    appendCustom(P, Pc, NewPc, N),
    posizioni(T, M, NewPc, Nn),
    C is N / M + Nn.
