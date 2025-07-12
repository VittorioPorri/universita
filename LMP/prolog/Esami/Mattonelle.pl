edge(a, b).
edge(a, c).
edge(b, d).
edge(b, e).

%i tre pacchi sono nominati nella forma 1 2 e 3 dove 1 è il formato piu piccolo e 3 quello piu grande
ordinata([]).
ordinata([_]).
ordinata([H1, H2 | T]) :-
    H1 =< H2,
    ordinata([H2 | T]).

path(X, Y) :-
    edge(X, Y).

path(X,Y):-
    edge(X,Z),
    path(Z,Y).

sposta(X, Y, Lista) :-
    ordinata(Lista),
    path(X,Y).





