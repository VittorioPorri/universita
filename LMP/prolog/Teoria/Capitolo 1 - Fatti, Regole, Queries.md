---
connections:
  - "[[Prolog]]"
author: "[[Massimo Zanzotto]]"
---
In Prolog  esistono:

- **fatti :**  `party.`
- **regole :** `path(A,B):- path(A,Z), edge(Z,B)`
- **queries :** `?-happy(N)

>[!note]
>Una collezione di fatti e regole è chiamata knowledge bases

# Sintassi del Prolog

- *Atomi* : Iniziano con la lettera minuscola e servono per rappresentare oggetti, nomi, concetti ...  ad esempio`party`
- *Numeri* : tipicamente vengono utlizzati solo i numeri interi ad esempio `0, 2, -1`
- *Variabili* : Iniziano con la lettera Maiuscola o con un `_` ad esempio `X` o `_input`
>[!note]
>La variabile `_` è la variabile anonima e non viene mai associata a un valore
- *Termini Complessi* : sono costrutti simbolici che rappresentano un fatto struttrato e sono formati da un functor e un certo numero di argomenti, ad esempio `edge(a,b)` dove `edge` è il functor e `a,b` sono gli argomenti


# Esercizi

1. Butch is a killer
```Prolog
killer('Butch').
```

2. Mia and Marsellus are married
```Prolog
married('Mia','Marsellus').
```

3. Zed is dead
```Prolog
dead('Zed').
```

4. Marsellus kills everyone who gives Mia a footmassage
```Prolog
kills(marsellus,X) :- footmassage(mia,X)
```

5. Mia loves everyone who is a good dancer
```Prolog
loves(mia,X):- goodDancer(X)
```

6. Jules eats anything that is nutritious or tasty
```Prolog
eats(jules, X):-nutritious(X)
eats(jules, X):-tasty(X)
```

>[!note]
>In prolog l'or si scrive `;` quindi avrei potuto scrivere
>`eats(jules, X):-nutritious(X) ; tasty(X)`
