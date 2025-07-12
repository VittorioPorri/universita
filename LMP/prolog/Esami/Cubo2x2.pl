%Una faccia la definisco come una lista lunga 4 [C1,C2,C3,C4] dove i colori rappresentano
%il numero indica la posizione sulla faccia
% \............. \
% \	 C1  \	 C2  \
% \		 \		 \
% \------------- \
% \	 C3  \	C4	 \
% \		 \		 \
% \------------- \

risolto([]).
risolto([[C,C,C,C]|T]):-
    risolto(T).

mossa(cubo(L)):-
    risolto(L).

%faccia F in senso orario
mossa(cubo([[F1,F2,F3,F4],[B1,B2,B3,B4],[U1,U2,U3,U4],[D1,D2,D3,D4],[L1,L2,L3,L4],[R1,R2,R3,R4]])):-
    mossa(cubo([[F3,F1,F4,F2],[B1,B2,B3,B4],[U1,U2,L4,L2],[R3,R1,D3,D4],[L1,D1,L3,D2],[U3,R2,U4,R4]])).
%faccia F in senso antiorario
mossa(cubo([[F1,F2,F3,F4],[B1,B2,B3,B4],[U1,U2,U3,U4],[D1,D2,D3,D4],[L1,L2,L3,L4],[R1,R2,R3,R4]])):-
    mossa(cubo([[F3,F1,F4,F2],[B1,B2,B3,B4],[U1,U2,L4,L2],[R3,R1,D3,D4],[L1,D1,L3,D2],[U3,R2,U4,R4]])).

%faccia B in senso orario
%faccia B in senso antiorario

%faccia R in senso orario
%faccia R in senso antiorario

%faccia L in senso orario
%faccia L in senso antiorario

%faccia U in senso orario
%faccia U in senso antiorario

%faccia D in senso orario
%faccia D in senso antiorario
