
/*Abbiamo due possibile scelte per implementare un albero
  
  tree(R,C)  R = root and C = children
  R(C) = ..[] con univ

*/
 
/*leaf(T,L) il predicato è vero solo se L è la foglia di un albero T*/

somma(t(N1,N2),S):-
      S is N1+N2.

%Input : t(a,[t(b,[t(a,[]),t(b,[])]),t(c,[]),t(d,[])])
appartiene(L,[L|_]).
appartiene(L,[_|T]):- appartiene(L,T).

%caso base
leaf(t(L,[]),L).

%passo induttivo
leaf(t(_,N2),L):-
  member(A,N2),
  leaf(A,L).

node(t(L,_),L).
node(t(_,N2),L):-
  appartiene(A,N2),
  node(A,L).


