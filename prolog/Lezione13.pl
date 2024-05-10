/* Torri di Hanoi */

%caso base
ordinata([]).
ordinata([_]).

%caso induttivo
ordinata([H1, H2|T]):-
    H1 > H2,
    ordinata([H2|T]).


%va fatto per ogni caso della torre di Hanoi

edge(node([X|A],[B],[C]),node([A],[X|B],[C]):- 
    ordinata([X|A]),
    ordinata([X|B]),
    ordinata([C]).

edge(node([X|A],[B],[c]),node([A],[B],[X|C])):-
    ordinata([X|A]),
    ordinata([B]),
    ordinata([X|C]).

edge(node([A],[X|B],[C]),node([A],[B],[X|C])):-
    ordinata([A]),
    ordinata([X|B]),
    ordinata([X|C]).

edge(node([A],[X|B],[C]),node([X|A],[B],[C])):-
    ordinata([X|A]),
    ordinata([X|B]),
    ordinata([C]).

edge(node([A],[B],[X|C]),node([X|A],[B],[C])):-
    ordinata([X|A]),
    ordinata([B]),
    ordinata([X|C]).

edge(node([A],[B],[X|C]),node([A],[X|B],[C])):-
    ordinata([A]),
    ordinata([X|B]),
    ordinata([X|C]).


/*Cubo di rubik*/




