# Union-find
Mantenere una collezione di insiemi disgiunti sui quali è possibile eseguire le seguenti operazioni:
- `makeset(x)` = crea un insieme x ={x} di nome x
- `union(A,B)`= unisce gli insiemi A e B in un unico insieme di nome A
- `find(x)` = restituisce il nome dell'insieme che contiene x

![[MakeUnionFind.png]]

Per implemetara esistono due strategie:
#### 1.Quickfind
Utilizziamo una foresta di alberi disgiunti di altezza 1 per rappresentare gli inisemi disgiunti, ogni albero possiede:
- La **root** rappresenta il nome dell'insieme
- Le **foglie** rappresento gli elemento dell'inseme incluso l'elemento che da il nome all'iniseme

`makeset(elem e)` = crea un nuovo albero composto da due nodi e memorizza `e` in entrambi
`union(name A,name B)` = sostituisce tutti i puntatori dell'albero B con puntatori all'albero A
`find(elem e)`= accede alla foglia `e`segue il puntatore e restituisce il valore memorizzato nel padre

![[operazioniQuickfind.png]]

- Complessità temporale:
	`makeset(elem e)` e `find(elem e)` richiedono tempo costante $O(1)$
	`union(name A,name B)`richede tempo lineare $O(n)$
	
> [!NOTE]
>Ci interessa il tempo di esecuzione di una sequenza di operazioni, ad esempio se eseguiamo n operazioni che cosa succede al costo complessivo
> `makeset(elem e)`e`find(elem e)` hanno costo $O(n+m)$ 
> `union(name A,name B)` può avere per alcune sequenze altamente inefficenti costo $O(n^2)$ 

##### Euristica union by size
Per migliorare l'efficenza della quickfind dobbiamo migliorare l'efficenza delle union, per fare ciò dobbiamo fare in modo che un nodo non cambi padre troppo spesso.

L'Euristica union by size attribuisce ad ogni insieme una size in modo tale che se dovessimo effettuare una union  possiamo considerare la capacità dei due insieme e aggiornare i puntatori dell'insieme di cardinalità minore (in caso fosse necessario modificare la radice aggiornando il nome)


`makeset(elem e)` = crea un nuovo albero composto da due nodi, memorizza `e` in entrambi e inizializza size(e) = 1

`union(name A,name B)` = 
-  se size(A) $\geq$ size(B) sostituisce tutti i puntatori dell'albero B con puntatori all'albero A
- se size(A) $\leq$ size(B) sostituisce tutti i puntatori dell'albero A con puntatori all'albero B e aggiorna il valore della radice ad A

`find(elem e)`= accede alla foglia `e`segue il puntatore e restituisce il valore memorizzato nel padre 

- Complessita temporale 
	le complessita sulle singole operazioni rimangono invariate, ma cerchiamo di capire se abbiamo migliorato l'efficenza di una sequenza di n operaioni
	
	`makeset(elem e)` e `find(elem e)` hanno costo $O(n+m)$
	per analizzare la `union(name A,name B)`cerchiamo di capire quante volte un nodo cambia padre, osserviamo che ogni volta che un nodo cambia padre la cardinalità dell'insieme al quale apparterrà è almeno doppia rispetto a quella dell'iniseme a cui apparteneva:
	1. all'inizio un nodo  è in un insieme di dimensione 1
	2. poi se cambia padre è in un insieme di dimensione almeno 2
	3. all' $i-esimo$ cambio è in un insieme di dimension almeni $2^i$
	il tempo speso in senso ammortizzato per un singolo nodo nella sequenza di n union è $O(logn) \rightarrow$ per spostare n nodi spendiamo	 $O(nlogn)$ 
	
	L'intera sequenza ha costo $O(m+nlogn)$

#### 2.QuickUnion
Usiamo una foresta di alberi di altezza anche maggiore di 1 per rappresentare gli insiemi disgiunti 
-  La **root** è l'elemento rappresentativo dell'insieme
- Le **foglie** rappresento gli elemento dell'inseme escluso l'elemento nella radice

`makeset(elem e)` = crea un nuovo albero composto da un nodo e ci memorizza `e` 
`union(name A,name B)` = imposta un puntatore dalla root di  B alla root di  A
`find(elem e)`= accede alla foglia `e`segue i puntatori e restituisce il valore memorizzato nella root 

![[operazioniquickunion.png]]

- Complessità temporale:
	`makeset(elem e)` e `union(name A,name B)` richiedono costo $O(1)$
	`find(elem e)`richiede tempo lineare $O(n)$
	
> [!NOTE]
>Ci interessa il tempo di esecuzione di una sequenza di operazioni, ad esempio se eseguiamo n operazioni che cosa succede al costo complessivo
> `makeset(elem e)`e`union(name A, name B)` hanno costo $O(n)$ 
> `find(elem e)` può avere per alcune sequenze altamente inefficenti costo $O(nm)$ 

##### Euristica union by size
Per migliorare l'efficenza della quickunion dobbiamo migliorare l'efficenza delle find, per fare ciò dobbiamo fare in modo per ogni insieme  l'altezza degli alberi sia piccola

L'Euristica union by size attribuisce ad ogni insieme una size in modo tale che se dovessimo effettuare una union  possiamo considerare la capacità dei due insieme e rendere la radice dell'albero con size piu piccola figlia della radice dell'albero con size maggiore

`makeset(elem e)` = crea un nuovo albero composto da un nodo in cui memorizza `e`  e inizializza size(e) = 1

`union(name A,name B)` = 
-  se size(A) $\geq$ size(B) rende la radice dell'albero B figlia  dell'albero A
- se size(A) $\leq$ size(B) rende la radice dell'albero A figlia dell'albero B e ricorda all'interno della root A senza aggiornare il valore dell'elemento 

`find(elem e)`= accede alla foglia `e`segue i puntatori e restituisce il valore memorizzato nella root 

- Complessità temporale:
	le complessita sulle singole operazioni rimangono invariate, ma cerchiamo di capire se abbiamo migliorato l'efficenza di una sequenza di n operaioni

	`makeset(elem e)`e`union(name A, name B)` hanno costo $O(n)$
	per analizzare la `find(elem e)` con la union by size sfruttiamo il seguente lemme
	
	Lemma 1:
	 Con la union by size, dato un albero QuickUnion con size (numero di nodi) $s$ e altezza $h$ vale che $s\geq2^h$
	
	Di conseguenza il tempo speso in senso ammortizzato per un singolo find nella sequenza è di $O(logn) \rightarrow$  m find $O(mlogn)$ 
	
	L'intera sequenza ha costo $O(n+mlogn)$
