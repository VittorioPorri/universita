/*problema delle 8 regine*/

controllo_riga([A,B],[A,C]).
contorllo_colonna([A,B],[C,A]).

controllo_diagonale([A,B],[C,D]):-
  X is A-C,
  Y is B-D,
  X =\= Y,
  X =\= -Y.

controllo_coppia([A]).

controllo_coppia([A,B|T]):-
  controllo_riga(A,B),
  controllo_colonna(A,B),
  controllo_diagonale(A,B),
  controllo_coppia([A|T]).

controllo_soluzione([H|T]):-
  \+controllo_coppia([H|T]),
  controllo_soluzione(T).


/*Rompicapo del cavallo  un cavallo deve muoversi su tutte le caselle senza mai passare su una che ha gia visto
 * emanuele.izzo_1998@outlook.it
 * emanuele.izzo@students.uniroma2.eu
 * */

mossa_possibile([X,Y],[X1,Y1]):-
  X1 is X+2,
  Y1 is Y+1.

mossa_possibile([X,Y],[X1,Y1]):-
  X1 is X+2,
  Y1 is Y-1.

mossa_possibile([X,Y],[X1,Y1]):-
  X1 is X-2,
  Y1 is Y+1.

mossa_possibile([X,Y],[X1,Y1]):-
  X1 is X-2,
  Y1 is Y-1.

mossa_possibile([X,Y],[X1,Y1]):-
  X1 is X+1,
  Y1 is Y+2.

mossa_possibile([X,Y],[X1,Y1]):-
  X1 is X+1,
  Y1 is Y-2.

mossa_possibile([X,Y],[X1,Y1]):-
  X1 is X-1,
  Y1 is Y+2.

mossa_possibile([X,Y],[X1,Y1]):-
  X1 is X-1,
  Y1 is Y-2.

/*posso semplificarlo nel seguente modo

  mossa_possibile([X,Y],[X1,Y1]):-
    abs(X-X1,1),
    abs(Y-Y1,2).

  mossa_possibile([X,Y],[X1,Y1]):-
    abs(X-X1,2),
    abs(Y-Y1,1).

*/

controllo([_]).

controllo([H1,H2|T]):-
  mossa_possibile(H1,H2),
  \+member(H1, T),
  controllo([H2|T]).



