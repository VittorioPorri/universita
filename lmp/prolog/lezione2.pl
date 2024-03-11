/* Algoritmo di risoluzione del prolog --> Albero della dimostrazione.
 *  
 * definiamo mediante fatti il grafo
 * arco(Start,End)
 *
 * */

arco(a,b).
arco(a,e).
arco(e,f).
arco(f,c).
arco(f,k).
arco(b,c).
arco(c,d).

%Induzione
path(X,Y):- arco(X,Y).
path(X,Y):- arco(X,Z),path(Z,Y).
