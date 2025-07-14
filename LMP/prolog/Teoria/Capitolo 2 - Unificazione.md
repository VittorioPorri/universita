---
connections:
  - "[[Prolog]]"
author: "[[Massimo Zanzotto]]"
---
Esempi
L’unificazione avviene quando due termini possono essere resi identici **applicando una sostituzione di variabili**.


Regole di unificazione:
- Due costanti unificano solo se sono uguali:
    a = a (prolog rispnderà yes)
    a = b (prolog risponderà no)

- Una variabile unifica con qualsiasi termine, vincolandosi a quel termine:
    X = dog (X diventa dog)
    X = f(Y)  (X diventa f(Y))

- Due termini complessi sono unificati se:
    - Hanno lo stesso functor (nome e arità)
    - Tutti i loro argomenti unificano ricorsivamente
		 Esempio: f(X, b) = f(a, Y) ( X diventa a, Y diventa b)

- Una variabile può unificarsi anche con un’altra variabile:
    X = Y (entrambi rappresentano la stessa cosa quindi quando una delle due verrà unificata anche l'altra assumerà lo stesso valore)

# Algoritmo di ricerca del Prolog
L'algoritmo di ricerca del prolog è una strategia sistematica usata per trovare soluzioni a partire da una query, usando le regole e i fatti presenti nella knowledge base

```Prolog
f(a).
f(b).

g(a).
g(b).

h(b).

k(X) :- f(X), g(X), h(X)
```

L'utente propone la seguente query
```
?- k(Y)
```

L'obbiettivo inizale o goal quindi è `k(Y)`

Prolog cerca nella knowledge base una regola o un fatto da unificare con `k(Y)`  e trova
```
k(X) :- f(X), g(X), h(X)
```
e unifica X con Y

>[!note]
>Quando Prolog unifica una variabile presente in una query con una variabile presente in un fatto o in una regola, per sicurezza genera una nuova variabile (ad esempio `_G34`)

Ora deve soddisfare in sequenza i tre sottogoal `f(_G34), g(_G34), h(_G34)` quindi il goal si sposta nel cercare un `f(_G34)`
1. unifica `_G34 = a` e verifica se esiste `f(a)`, `g(a)` e `h(a)` ma fallisce poiche nella knowledge base non esiste alcun `h(a)` 
2. unifica `_G34 = b` e verifca se esiste  `f(b)`, `g(b)` e `h(b)` e risponde b poiche tutti i sottogoal sono soddisfatti 


L'algoritmo risulta più chiaro e semplice se viene rappresentato graficamente
![[prologtreesearch.png]]

>[!note]
>Ogni volta che puo essere fatta più di una scelta si crea un nuovo ramo che va esplorato
>Nel nostro caso l'algoritmo poteva sceglie se unificare `\_G34` con `a` o con `b`



Esempi:

Scrivi un predicato crossword per verificare che esista una soluzione per il cruciverba.
```Prolog
word(astante, a,s,t,a,n,t,e).
word(astoria, a,s,t,o,r,i,a).
word(baratto, b,a,r,a,t,t,o).
word(cobalto, c,o,b,a,l,t,o).
word(pistola, p,i,s,t,o,l,a).
word(statale, s,t,a,t,a,l,e).


crossword(V1,V2,V3,H1,H2,H3):-
    word(V1, _, A2, _, A4, _, A6, _),
    word(V2, _, B2, _, B4, _, _, B7),
    word(V3, _, C2, _, C4, _, C6, _),

    word(H1, _, A2, _, B2, _, C2, _),
    word(H2, _, A4, _, B4, _, C4, _),
    word(H3, _, A6, _, B7, _, C6, _).
```