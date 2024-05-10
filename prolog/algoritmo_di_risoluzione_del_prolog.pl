/* Prolog è un linguaggio di porgrammazione dichiarativo, basato 
 * su una restrizione della logica del primo ordine
 *
 * Termini fondamentali:
 * - Predicato: una proposizione che può essere vera o falsa, concetto di funzione
 * - Predicare: afferma che un predicato è vero
 * - Induzione : concetto di ricorsione
 * - Unificare : trovare un valore comune per duevariabili che le rende uguli, concetto di ugualgianza
 */

/* Esercizio: 
 
  scrivere un programma prolog che rappresenta un grafo tramito
  edge(A,B) per inidcare che A e B sono connesi
  
  Costruire la segunete regola path(A,B) per indicare tutti i nodi
  raggiungibili a partire da A
 
 */

edge(a,b).
edge(a,e).
edge(b,c).
edge(c,d).
edge(d,e).
edge(f,e).

%Insuzione

%caso base
path(A,B):-
  edge(A,B).

%passo induttivo
path(A,B):-
  edge(A,Z),
  path(Z,B).
 
/* Algoritmo di risoluzione del prolog
  
  Prolog anailizza i fatti/regole dall'alto verso il basso cercado 
  di verificare un goal
 
  esempio:
             query ?- path(b,d)
                 /     \
                /       \
               v         v
       1.edge(b,d)   2.edge(b,Z),path(Z,d) 
         fail                |
                             |
                             |
                             v
                    3.edge(b,c),path(c,d)
                             |
                             |
                             |
                             v
                        4.edge(c,d)
                           true.
  Goal --> path(b,d)
  1. fallisce perche non esiste un edge tra b e d
  2. Ci chiediamo se esiste un edge(b,Z) --> nuovo goal quindi l'algoritmo ricominca ad analizzare il codice partendo dall'alto 
  3. L'algoritmo di risoluzione unifica Z con c perche il primo fatto che incotra che è nella forma edge(b,Z) è proprio edge(b,c) 
     poi una volta soddisfatto il goal si chiede se esiste un path(c,d) --> nuovo goal
  4. Si ricomincia ad analizzare il codice partendo da dall'alto e l'algorimo risponde true perche trova il fatto edge(c,d)
 
 * /



