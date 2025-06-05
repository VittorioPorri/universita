split3([],[]).
split3([A,B,C|T],[[A,B,C]|T1]):-split3(T,T1).

delElem(X,[X|T],T).
delElem(X,[H|T],[H|L]):-delElem(X,T,L).

%perm([],[]).
%perm(L,[H|T]):- member(H,L),delElem(H,L,NewL),perm(NewL,T).

%swap(DNAa,DNAb):- split3(DNAa,L),
%    			  split3(DNAb,L1),
%    		      perm(L,L1).

%sost([],[]).
%sost([X,X|T],[Y,Y|T1]):-member(Y,[g,a,c,t]),
%    					sost(T,T1).
%							
%sost([H|T],[H|T1]):-sost(T,T1).

dDiSwap([],[],0).
dDiSwap([H|T],[H|T1],DSwap):-!,dDiSwap(T,T1,DSwap).
dDiSwap([H|T],L,DSwap):- member(H,L),!,
    					 delElem(H,L,NewL),
    					 dDiSwap(T,NewL,N),	
    					 DSwap is N+1.

distanzaDiSwap(A,B,DSwap):- split3(A,L),
    						split3(B,L1),
    						dDiSwap(L,L1,DSwap).
    

distanzaDiSost([],[],0).
distanzaDiSost([X,X|T], [Y,Y|T1], DSost):- X\=Y,!, distanzaDiSost(T,T1,N), DSost is N+1.
distanzaDiSost([_|T], [_|T1], DSost):- distanzaDiSost(T,T1,DSost).
	

vicinanza(DNA_A, DNA_B,V) :-
    distanzaDiSost(DNA_A, DNA_B, DSost),
    distanzaDiSwap(DNA_A, DNA_B, DSwap),
    V is DSwap + DSost.
