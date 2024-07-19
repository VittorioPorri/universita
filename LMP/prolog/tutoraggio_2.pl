split(L,SX,DX):-
  append(SX,DX,L).


equazione([H|T]):-
  split([H|T],SX,DX),
  eq(SX,N),
  eq(DX,N).

eq([N],N).

eq([H1,H2|T],N):-
  H3 is H1 + H2,
  eq([H3|T],N).

eq([H1,H2|T],N):-
  H3 is H1 - H2,
  eq([H3|T],N).

eq([H1,H2|T],N):-
  H3 is H1 * H2,
  eq([H3|T],N).

eq([H1,H2|T],N):-
  H3 is H1 / H2,
  eq([H3|T],N).

