/*definire un predicato che possa riconoscere se data una grammatica la stringa appartiene al linguaggio*/

'A'(L,R1):-
  'B'(L,R),
  'C'(R,R1).

'A'(L,R2):-
  'C'(L,R),
  'B'(R,R1),
  'B'(R1,R2).

'B'([a|A],A).
'C'([b|A],A).
