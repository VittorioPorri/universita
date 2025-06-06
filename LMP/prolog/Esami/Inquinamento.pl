:-op(100,xfy,mangia).

inquinata(erba).
inquinata(pecora).

pecora mangia erba.
lupo mangia pecora.
topo mangia erba.
corvo mangia topo.
gatto mangia corvo.



path(X,Y,1):- mangia(X,Y), inquinata(Y),!.
path(X,Y,M):- mangia(X,Z), path(Z,Y,N), M is N+1.


potenza(0, 1).
potenza(B, R) :-
    B > 0,
    B1 is B - 1,
    potenza(B1, R1),
    R is 0.87* R1.

%serve per sapere se una specie è inquinata
inquinato(X,Result):- path(X,_,M), potenza(M,Result).
