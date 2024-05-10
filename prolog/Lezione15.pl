/* gli archi sono rapprsentati con edge(A,B)
   vogliamo scrivere un predicato path(X,Y,Path)
*/

%visita DFS

edge(a,b).
edge(a,c).
edge(b,d).
edge(b,e).

pathDFS(X,Y,[X,Y]):-
  edge(X,Y).
  
pathDFS(X,Y,[X|T]):-
    edge(X,Z),
    pathDFS(Z,Y,T).

/*estendere per fare in modo che non percorra dua volta un nodo visitato*/

frontiera([],[]).

frontiera([H|T], PF):-
    setof(Z,edge(H,Z),Figli),
    append(Figli,RF,PF),
    frontiera(T,RF).


pathBFS(X,Y,[X,Y]):-
    edge(X,Y).

pathBFS(X,Y,):-
    
    
