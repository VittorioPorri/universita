/* 
creare un programma che sia in grado costuire gli incastri di parole
per un cruciverba

il programma deve decidere:
- quali parole usare
- come riempire lo schema


come osserviamo per risolvere questo compito nel modo classico avremmo 
bisogono di un gran numero di linee di codice

l'obbiettivo del corso è quello di esplorare un nuovo mondo fatto di fatti
e regole 

*/

genitore(dario,luca).
genitore(dario,mario).
genitore(mario,pino).

fratello(X,Y):- 
    genitore(Z,X),
    genitore(Z,Y).


/*
  In prolog esitoto:
  - fatti come ad esempio gentire(dario,luca).
  - regole come ad esempio fratello(X,Y):- genitore(Z,X),genitore(Z,Y).
      1. fratello(X,Y) è la testa della regola
      2. :- indica il se
      3. ,  indica l'and
      La regola complessivamente indica che X,Y sono fratelli se hanno lo stesso genitore
      
*/

/*
  esempio di query in prolog ?- fratello(luca,mario) 
  il programma risponderà true or false 
*/

% esercizio definisci il concetto di nonno e di avo

nonno(X,Y):-
  genitore(X,Z),
  genitore(Z,Y).

avo(X,Y):- 
  genitre(X,Y).

avo(X,Y):- 
  genitore(X,Z),
  avo(Z,Y).
