%definire un predicato numeri(L) che è vero se dentro la lista L ci sono i numeri dei fatti

:-dynamic appoggio/1.

n(11).
n(3).
n(7).
n(11).

appoggio([]).

numeri(L):-
  n(Num),
  %
  appoggio(L),
  append(L,[Num],LN),
  retract(appoggio(L)),
  assert(appoggio(LN)),
  %
  write(Num),nl,
  fail.


numeri(L):-
  appoggio(L),

  %ripristina la situazione originale
  retract(appoggio(L)),
  assert(appoggio([])),
  
  write(fine),nl.

%setoff e bagof


setoff(N,n(N),L).
%fornisce solamente l'insieme degli elementi non ripetuti

bagof(N,n(N),L).
%fornisce gli elementi anche ripetuti


% definire un predicato che conti quante lettere ci sono in seconda posizioni
n(11,a,la).
n(11,b,la).
n(11,c,la).
n(11,d,la).
n(11,e,la).
n(11,f,la).
n(11,g,la).

numero_lettere_diverse(Num):-
  setof(L,(N,S)^n(N,L,S),Lista),
  length(Lista,Num).
