estraiLista(esempio(L),L).

ricercaNellaListaDiEsempio([caratteristica(X,Y)|_], X,Y).
ricercaNellaListaDiEsempio([_|T],X,Y):- ricercaNellaListaDiEsempio(T,X,Y).

%combina estrazione e ricerca
ricercaEsempio(E,X,Y):- estraiLista(E,L), ricercaNellaListaDiEsempio(L,X,Y).

estraiAlbero(albero(_,L),L).

ricercaNeiSottoalberi([sottoalbero(X,Y)|_], X, Y).
ricercaNeiSottoalberi([_|T], X, Y):-ricercaNeiSottoalberi(T, X, Y).

%combino estrazione e ricerca
ricercaAlberi(Tree,X,Y):- estraiAlbero(Tree,L), ricercaNeiSottoalberi(L,X,Y).



classe(Tree, _, Tree):- Tree \=albero(_,_).

classe(albero(X, _), Esempio, Classe) :- ricercaEsempio(Esempio, X, Y),
    									 ricercaAlberi(albero(X, _), Y, NewTree),
    									 classe(NewTree, Esempio, Classe).