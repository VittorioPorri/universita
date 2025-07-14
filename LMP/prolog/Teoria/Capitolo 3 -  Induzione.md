---
connections:
  - "[[Prolog]]"
author: "[[Massimo Zanzotto]]"
---
L' induzione in prolog si manifeste quando nella definizione di un predicato si fa riferimento a sé stesso, per utilizzarla abbiamo bisogno di:
- Clausola Base che è la regola che non contiene riferimenti a se stessa
```Prolog
path(A,B):-edge(A,B) 
```
- Clausola Induttiva che definisce la regola in termini di se stesso
```Prolog
path(A,B):-edge(A,Z), path(Z,B)
```


Esempi:

Scrivi un predicato antenato e uno discendente
```
child(anna,mario).
child(mario,enea).
child(anna,marco).
child(marco,ulisse).


antenato(X,Y):-child(X,Y).
antenato(X,Y):-child(X,Z), avo(Z,Y).

discendente(X,Y):- avo(Y,X).
```