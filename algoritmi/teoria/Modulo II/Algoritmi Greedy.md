d# Interval Scheduling
L’algoritmo prende in **input** una collezione di n intervalli, ogni intervallo ha un tempo di inizio (s) e un tempo di fine (f) e restituisce in **output** un sottoinsieme (S) massimo di intervalli compatibili ( cioè per ogni coppia di intervalli essi non si sovrappongono)

Ci sono diverse ordinamenti secondo i quali posso considerare di ordinare i jobs:
- __Shortest interval__: Considero i jobs in ordine di durata
	![[Shortest_jobs.png]]
- __Fewest conflicts__: Condisero i jobs in base al numero di conflitti 
	![[Fewest-conflict.png]]
- __Earliest start time__: Condisero i jobs in ordine di inizio
	![[Earliest-start-time.png]]
- __Earliest finish time__: Considero i jobs in ordine di fine
	```
	Earliest-finisch-time-first(n, s1, ..., sn, f1, ...,fn)
	Sort jobs by finish time
	S <- (vuoto)
	for j=1 to n
		if(job j is compatible with S)
			S <- S U {j}
	return S
	```
	- Complessità temporale: $T(n)=O(nlogn)$
	- Correttezza:
		Sia $i_1,i_2,...,i_k$ un insieme di task selezionate dall'algoritmo greedy e sia $j_1,j_2,...,j_m$ un insieme di task selezionate dall'algoritmo ottimo
		
		Lemma 1
		$\forall r=1,2,...,k$ abbiamo che $f(i_r)\leq f(j_r)$
		
		Dim
		per r = 1 $\rightarrow$ ovvio
		per r $\geq$ 1 $\rightarrow$ supponiamo vera per r-1 (ossia $f(i_{r-1})\leq f(j_{r-1})$) Adesso l'ottimo sceglie un task, compatibile con gli altri selezionati precendetemete. Quindi il greedy, avendo i task ordinati per finish time, per forza andrà a guardare o un task che finisce prima o proprio il task selezionato dall'ottimo
		![[Lemma1_IntervalS.png]]
		L'algoritmo _Earliest finish time_ è ottimo:
		
		Dim
		Per il lemma 1 sappiamo che il greedy selezionerà sempre un job ≤ dell’ottimo, quindi se nell’ottimo si trova anche $j_{k+1}$ allora esso potrà essere preso anche dall’algoritmo greedy 
		![[Ottimo_IntervalS.png]]
# Interval Partitioning
L’algoritmo prende in **input** una collezione di n intervalli, ogni intervallo ha un tempo di inizio (s) e un tempo di fine (f) e restituisce in **output** un sottoinsieme (d) minimo di aule che contengono intervalli compatibili

Ci sono diverse ordinamenti secondo i quali posso considerare di ordinare i jobs:

- **Fewest conflicts**: Condisero i jobs in base al numero di conflitti 
	![[Fewest-conflict2.png]]
- **Shortest interval**: Considero i jobs in ordine di durata 
	![[ShortestInterval2.png]]
- **Earliest finish time**: Considero i jobs in ordine di fine 

![[Earliestfinishtime.png]]

- **Earliest start time**: Condisero i jobs in ordine di inizio 
```
	Earliest-start-time-first(n, s1, ..., sn, f1, ...,fn)
	Sort lectures by starting time
	d <-0
	for j = 1 to n
		if lecture j è compatibile con almeno una classe 
			aggiungi lecture j nella classe compatibile
		else
			d <- d + 1
			aggiungi lecture j nella classe d + 1 
```
- Complessità Temporale $T(n)=O(nlogn)$
	Possiao memorizzare le classi in una coda con priorità, con chiave il tempo di fine di ciascun task.
    - per allocare una nuova classe, `INSERT` la nuova classe nella coda con priorità.
    - per schedulare il $j-esimo$ task nella classe k, `INCREASE-KEY` della classe k a $f_j$.
    - per determinare se il $j - esimo$ task è compatibile con una qualunque classe, confrontare $s_{j}$ con `FIND-MIN`.
	Il numero totale di operazioni sulla coda con priorità è $O(n)$, ognuna di queste con tempo di esecuzione $O(log n)$.
- Correttezza:

   > [!IMPORTANT]
	>La depth(o profondità) è il numero massimo di intervalli che contengono lo stesso punto
	>
	>![[Depth.png]]

	L'algoritmo _Earliest start time_ è ottimo:
	
	Sia d il numero di calssi che l'algoritmo alloca, all'arrivo di un $j$-esimo task  che è incompatibile con tutti glia altri task allocati nelle d classi (ciò significa che ogni finish time delle classi aperte termina dopo lo starting time del $j$-esimo task). 
	Dobbiamo necessariamente aprire una nuova classe poiche abbiamo d+1 task che si sovrappongono a $s_j+\varepsilon$.

# Minimum Spanning Tree
L’algoritmo prende in **input** un grafo $G=(V,E)$ non orientato connesso e pesato e restituisce in **output** un sottoinsime di archi che connettono tutti i nodi del grafo, la cui somma ha peso minimo

Introduciamo alcune proprieta fondamentali:

- Cycles: cammino chiuso del tipo $<(a,b),(b,c), ... ,(z,a)>$	

![[ciclo.png]]

>[!IMPORTANT]
>Proprietà di ciclo: sia C un qualsiasi ciclo, e sia $f$ un arco con peso massimo nel ciclo. Allora esiste un MST che non contiene $f$

Dim)
Supponiamo che $f$ appartenga a $T^*$, cancellando $f$ da $T^*$ si crea una Cut $S$ in $T^*$, quindi l'arco $f$ appartiene sia la ciclo che al cutset. Allora esiste almeno un altro arco $e$ che sta sia nel ciclo che nel cutset

Sostituendo $f$ con $e$ costruiamo $T^{'} = T^* \cup ( e ) - ( f )$ 
Siccome $f$ era l'arco piu pesante del ciclo sostituendolo con $e$  $cost(T^{'}) \leq cost(T^*)$

- Cut: sottoinsieme dei nodi del grafo ( possiamo definirlo anche come partizione di V in S e V\S ), il cutset è un sottoinsieme di archi che connettono un nodo in S e un nodo in V-S

>[!IMPORTANT]
>Proprietà del cut: sia S un qualsiasi sottoinsieme di nodi e sia è un arco di costo minimio appartenente al cutset. Allora esiste un MST che contiene $e$

Dim)

Supponiamo che $e$ non appartenga a $T^*$,aggiungendo $e$ a $T^*$ creiamo un ciclo $C$, quindi l'arco $e$ appartiene sia al ciclo che al cutset. Allora esiste almeno un altro arco  $f$ che sta sia nel ciclo che nel cutset

Sostituendo $f$ con $e$ costruiamo $T^{'} = T^* \cup ( e ) - ( f )$ 
Siccome $e$ era l'arco di costo minimo del cutset sostituendolo con $f$  $cost(T^{'}) \leq cost(T^*)$

>[!IMPORTANT]
>L'intersezione tra un ciclo e un cutset contiene un numero pari di vertici
>
>![[intersezionecutsetciclo.png]] 

Dim)
Partendo da una nodo in S, esiste un arco per passare da $S$ a $V-S$. Avendo un ciclo C, allora esiste un arco per passare da $V-S$ a $S$. . Di conseguenza, ci sono almeno 2 archi nell'intersezione. In generale ci sono archi $2k$ nell'intersezione  

# Algoritmo di Kruskal

L'algoritmi iniza con $T = \emptyset$, considera gli achi in ordine ascendente di costo (eventualemente riordinandoli)

```
Kruscal(graph G=(V,E,w))
	UnionFind UF
	sia T un albero vuoto
	Sort gli archi in modo crescente in base ai costi
	for each vertex v do UF.makeset(v)
	for each edge(x,y) do
		T_x = UF.find(x)
		T_y = UF.find(y)
		if T_x != T_y then
			UF.union(T_x,T_y)
			add edge(x,y) to T
	return T
```

- Complessità temporale:
	Ordinare gli archi costa $O(mlogn)$
	Per implementare la UnionFind:
	- se utilizzo la QuickUnion $O(m+nlogn)$
	- se utilizzo laQuickFind $O(n+mlogn)$
	
	Il codice considerando entrambe le implementazioni di UnionFinde  $O(mlogn)$
	
- Correttezza:
	 ![[kruskal.png]]
	se l'algoritmo deve unire due insiemi indipendenti $S$ e $V-S$ vorrà dire che è stato selezionato l'arco più leggero poichè essi vengono visti in ordine cresente (sfrutta la proprieta del cut)

	
# Algoritmo di Prim

L'algoritmo inizia da un nodo sorgente $s$ e ad ogni passo aggiungà a $T$ il minimo arco $e$ di tutti gli archi che hanno un nodo in $T$ e uno fuori da $T$

>[!note]
>L'algoritmo può essere implementato in maniera semplice ma inefficente, contorllando per n-1 volte tutti gli archi uscenti da T e seleziona quello di costo minimo $O(nm)$

```
Prim(G, s)
    for each vertex v do a[v] = inf 
    a[s] = 0
    Sia Q una coda con priorità
    Sia S un insime vuoto
    Sia T un albero con root s
    for each vertex v do 
        Q.insert(a[v], v)

    while(not Q.isEmpty())
        u = Q.deleteMin()
        aggiunge u a S
        for each (e = arco(u,v) incidente a u)
            if((v non è in S) and (w(e) < a[v]))
                rendi u genitore di v in T
                delta = w(e) - a[v]
                Q.decreaseKey(v, delta)
    
    return T
```

- Complessita temporale:
	-  $O(m + n)$ più il costo delle operazioni sulla coda con priorità.
	La coda con priorità costa:
	- Con un un d-heap o heap binomiale: $O(m log n)$.
	- Con gli heap di Fibonacci: $O(m + n log n)$.
	
- Correttezza:
	È un immediata conseguenza della cut property
# Clustering
Dato un insieme $U$ di n oggetti etichettati $<p_1,p_2,...,pn>$ un clastering è u inseme di cluster ( insieme di oggetti correlati tra loro ), l'obbiettivo è massimizzare la distana tra i vari cluster

Si osserva che è facile implementarlo utlizzando Kruskal, procedento a eliminare da $T \space\space k-1$ archi più costosi col fine di individualre k cluster con distanza massima 

