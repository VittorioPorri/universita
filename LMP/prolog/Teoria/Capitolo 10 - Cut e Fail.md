---
connections:
  - "[[Prolog]]"
author: "[[Massimo Zanzotto]]"
---
# CUT
Il Prolog il meccanismo per controlare il **backtracking** è detto cut `!` e viene usato per impedire a Prolog di cercare soluzioni alternative una volta raggiunto quel punto della regola

```Prolog
classe(harry, mago).
classe(goku, guerriero).
classe(drStone, dottore).
classe(eugenio, contadino).

aprePorta(X,destrezza):-classe(X,mago),!.
aprePorta(X,forza):-classe(X,guerriero),!.
aprePorta(X,fallisce).

```

Cio che fa il cut `!` è una volta trovata la classe giusta tagli l'albero di ricerca e impedisce di unificare altre possibilità

```Prolog
edge(10, 9).
edge(10, 15).
edge(9, 8).
edge(9, 7).
edge(15, 11).
edge(15, 16).


dfs(X, edge(_, X)) :- !.

dfs(X, edge(Y, Z)) :-
    X =< Y, !,
    edge(Z, Next), % dichiaro che l'arco deve effettivamente esistere nel grafo 
    dfs(X, edge(Z, Next)).

dfs(X, edge(Y, Z)) :-
    X > Y, !,
    edge(Z, Next),
    dfs(X, edge(Z, Next)).

```

In questo codice sfrutto la struttra del grafo, sapendo che i nodi sono ordinati per evitare di cercare in tutti i rami tagliandoli con il cut


# Fail
In Prolog, il **fail** è un meccanismo fondamentale per controllare il flusso di esecuzione e innescare il **backtracking**, esso è un predicato build in che fallisce sempre quando viene eseguito.

>[!note]
>combinando cut e fail so possono ottenere dei comportamenti molto utili

```Prolog
%definiamo che vincent ama tutti i burger ad eccezione del big kahuna
enjoys(vincent,X) :- big_kahuna_burger(X),!,fail.
enjoys(vincent,X) :- burger(X).

burger(X) :- big_mac(X).
burger(X) :- big_kahuna_burger(X).
burger(X) :- whopper(X).

big_mac(a).
big_kahuna_burger(b).
big_mac(c).
whopper(d).
```

Quando eseguiamo la query `enjoys(vincent,b)`, la prima regola si applica, e raggiungiamo il cut (`!`) che taglia i rami di possibili scelte future, **bloccando l’accesso** alla seconda regola, poi incontriamo `fail`, che cerca di forzare il backtracking, ma **viene bloccato dal cut**, e quindi la query **fallisce**.

>[!note]
>La prima regola sembra offire una forma di negazione  definita nel seguente modo `neg(X):- X,!,fail`
>
>Nel prolog odierno pero non è più necessario specifivare `neg` ma è stato introdotto un operatore `\+` che implementa negazione come fallimento

