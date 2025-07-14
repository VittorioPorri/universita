---
connections:
  - "[[Prolog]]"
author: "[[Massimo Zanzotto]]"
---
# Operazioni aritmetiche
Prolog fornisce gestisce le 4 operazionie di base con l'operatore `is`
```Prolog
6 + 2  = 8 -> 8 is 6+2
2 * 6 = 12 -> 12 is 6*2
```

Esso viene usato per forzare il prolog ad eseguire espressioni aritmetiche, infatti se si scrive `X = 3+2`, X non sarà uguale a `5` ma rimarrà `3+2` 

Le operazioni aritmetiche possono essere usate per stimare la lunghezza di una lista
```
len([], 0).

len([_|T],X) :- len(T,N), X is N+1.
```


# Comparare gli Interi
Gli operatori che comparano i gli interi in Prolog sono:
- $x < y$  diventa `X < Y`
- $x \leq y$  diventa `X =< Y`
- $x = y$  diventa `X =:= Y`
- $x \neq y$  diventa `X =\= Y`
- $x > y$  diventa `X > Y`
- $x \geq y$  diventa `X >= Y`
