% va inserita quando si usando gli assert
:- dynamic f/2.

f(1,1):-
  !.
f(2,1):-
  !.

f(N,M):-
  write(in(M,N)),nl,
  N1 is N-1,
  N2 is N-2,
  N1 > 0,
  N2 > 0,
  f(N1,M1),
  f(N2,M2),
  M is M1+M2,
  asserta((f(N,M):-!)).
