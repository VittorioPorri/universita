---
connections:
  - "[[Prolog]]"
author: "[[Massimo Zanzotto]]"
---

In prolog una lista si definisce racchiudendo gli elementi tra **parentesi quadre** e separandoli con virgole
```Prolog
[mia, harry, olga, marta]
```

>[!node]
>`[]` é una lista vuota

>[!note]
>Le liste possono contenere valori eterogenei tra loro come atomi, numeri, liste annidate, variabili o termini complessi
>`[mia, 42, [1,2], X, persona(harry, 30)]`

Prolog ha uno speciale operatore built-in `|` che può essere usato per decomporre la lista in Head e Tail

```Prolog
[Head | Tail] = [mia, harry, olga, marta]
``` 

Head è unificato con `mia`
Tail è unificato con `[harry, olga, marta]`

>[!note]
>Posso piu Head dalla lista specificandone quanti ne si vuole
>`[H1,H2,H3 | T]`
>
>H1 è unificato con `mia`
>H2 è unificato con `harry`
>H3 è unificato con `olga`
>T è unificato con `[marta]`


# Member
L'operazione di member ci permette di verificare se un elemento è effettivamente nella lista oppure no

```Prolog
member(X,[X|_]).
member(X,[_|T]):-member(X,T)
```

Facciamo altri esempi utili:

- Definisci un predicato concatena(A,B,C) che concatena due liste in una lista C
```Prolog
concatena([],B,B).
concatena([H|T],B,[H|L]):- concatena(T,B,L).
```

- Definisci un predicato rivolta(L,RL) che restituisce true se RL è la lista inversa di L
```Prolog
last(X,[X|[]]).
last(X,[_|T]):-last(X,T).

delLast([_],[]).
delLast([H1|T1],[H1|T2]):- delLast(T1,T2).

rivoltata([],[]).
rivoltata([H|T],RL):- last(H,RL), delLast(RL,NewRL), rivoltata(T,NewRL).
```

- Definisci un predicato permutazione(A,B) che verifica che tutti gli elementi di A si trovano in B
```Prolog
delElem(X,[X|T],T).
delElem(X,[H|T],[H|L]):-delElem(X,T,L).

permutazione([],[]).
permutazione(L,[H|T]):- member(H,L),delElem(H,L,NewL),permutazione(NewL,T).
```

- Definisci un predicato lunghezza(A,B) che verifica la lughezza della lista
```Prolog
lughezza([],0).
lughezza([_|T],L):- lughezza(T,M), L is M+1.
```
	`is` è un operatore utilizzato per indicare è *equivalente a*

- Definire un predicato numeroDiOccorenze(A,B,C) dove A è la lista, B è l'elemento che cerchiamo e C è il numero di occorenze
```Prolog
numeroDiOccorenze([],_,0).
numeroDiOccorenze([X|T],X,O):- numeroDiOccorenze(T,X,M), O is M+1.
numeroDiOccorenze([_|T],X,O):-numeroDiOccorenze(T,X,O).
```