
>[!important]
>Un Flow-Network è un grafo diretto G=(V,E,s,t,c) dove $s$ è il nodo sorgente $t$ è  il nodo pozzo e $c(e)\geq 0$ è la capacità di ogni arco $e$

#### Problema del Min-Cut

Ad ogni st-cut ( partizione dei nodi in A e B in modo tale che $s\in A$ e $t\in B$ ) possiamo associare una capacità che è la somma delle capacità delgi achi che vanno da $A\rightarrow B$
$$Cap(A,B) = \sum_{\text{e out of A}}{c(e)}$$
L'algoritmo che lo risolve deve prendere in **input** un Flow-Network e restituire in **output** un st-cut di capacità minima

#### Problema del Max-Flow
Definiamo st-flow con una funzione $f(e)$ che rappresenta la quantità di flow che sto spostando su quell'arco, la funzione deve garantire:
- Capacità: $\forall e \in E \space\space 0\leq f(e) \leq c(e)$
- Conservazione del flusso: $\forall v \in V-\{s,t\}$   $\sum_{\text{e in to v}}{f(e)} =\sum_{\text{e out of v}}{f(e)}$


il valore del flusso è $val(f)  =\sum_{\text{e out of s}}{f(e)}- \sum_{\text{e in to s}}{f(e)}$

![[flowmax.png]]

L'algoritmo che lo risolve deve prendere in **input** un Flow-Network e restituire in **output** flow di valore massimo 

# Ford-Fulkerson
L'idea iniziale è quella di utilizzare un approccio greedy:
1. impostare con $f(e) = 0$  tutti gli archi
2. trovare un cammino da $s$ a $t$ dove $\forall e \in E$   $f(e)<c(e)$
3. Aumentare il flusso finche  $\forall e \in E$   $f(e)-c(e) \neq 0$
4. ripetere finche sarà possibile
 
![[maxflowgreedy.png]]

L'algoritmo greedy non funziona perche una volta effettuata una scelta(giusta o sbagliata che sia) non potrà mai cambiare la scelta fatta

Introduciamo allora il concetto di Residual-network che ci permetterà di effettuare un Undo. Essa è definita a partire dalla Flow-Network originale, ma $\forall e \in E$ abbiamoo al più due archi

![[reteresidua.png]]

L'arco $e  =(u,v)$ è la capacità che posso ancora spingere da u verso v ( (u,v) = c(e)-f(e) ), l'arco $e^{reverse}  =(v,u)$ è il flusso che sta passando da u verso v ( (v,u) = f(e) )

Definiamo Aumenting-Path come il cammino nella rete residua che va da $s$ a $t$ e come Bottoleneck-Capacity l'arco di capacità minima lungo il cammino
```
AUGMENT(f,c,P)
delta = bottleneck capacity di P
foreach edge e in P:
	if e in E 
		f(e) = f(e) + delta
	else
		f(e^reverse) = f(e^reverse) -delta
return f
```

Ora possimao definire l'algoritmo
```
FORD-FULKERSON(G):
	foreach edge e in E:
		f(e) = 0
	G_f = residual network di G
	
	while(esiste un cammino P da s a t in G_f)
			f = AUGMENT(f,c,P)
			update G_f
	return f
```

- Lemma del Flow-Value
	sia f un qualunque flusso e sia (A,B) un qualsiasi st-cut. Il valore del flusso è
	$$val(f)  =\sum_{\text{e out of A}}{f(e)}- \sum_{\text{e in to A}}{f(e)}$$
	Dim)
	  $$val(f)  =\sum_{\text{e out of A}}{f(e)}- \sum_{\text{e in to A}}{f(e)}  = \sum_{u\in A}(\sum_{\text{e out of u}}{f(e)}- \sum_{\text{e in to u}}{f(e)})$$ 
	  tutti i nodi per la poprietà di conservazione del fusso avranno valore zero ad eccezione di s

- **Proprietà della dualità debole**: Sia f un qualsiasi flusso e (A,B) un qualsiasi cut, allora $val(f) \leq cap(A,B)$
	Dim)
	 È evidente perche se il taglio ha una certa capacità più di quella quantità di flusso non potrà passare 

- **Corollario**: Sia f un qualsiasi flusso e (A,B) un qualsiasi taglio se val(f) = cap(A,B) allora f è il max flow e (A,B) il min-cut
	Dim)
		Per un qualsiasi flusso $f^{'}$, per la dualità debole vale che: $val(f^{'} \leq cap(A, B) = val(f))$.
	    Per un qualsiasi cut $(A^{'}, B^{'})$, per la dualità debole vale che: $cap(A^{'}, B^{'}) \geq val(f) = cap(A, B)$.

- **Teorema del Max-Flow  e Min-Cut**: il valore del Max-Flow = capacita del Min-Cut
	Dim)
	 i. esiste un cut (A,B) t.c. cap(A,B) = val(f)
	 ii. f è un Max-Flow
	 iii. non ci sono cammini aumentati se il flusso è f
	
	 i $\rightarrow$ ii: 
		 vedi corollario
	 ii $\rightarrow$ iii: 
		 basta dimostrare $\neg$ iii $\rightarrow$ $\neg$ ii
		 se ci fosse un cammino aumentate allora basta aumentarlo e quindi f non poteva essere massimo
	 iii $\rightarrow$ i
		sia f un flow senza cammini aumentati, e definaimo A come i nodi che sono raggiungibili da s nella rete residua allora il flusso netto nella rete residua è esattamente uguale a cap(A,B)
	![[teorema.png]]
	 - Tutti gli archi che vanno da A verso B devono essere saturati, se cosi non fosse sarebbe possibile raggiungere nella rete residua il nodo a cui puntano che apparterrebbe ad A e non a B
	 - Tutti gli archi che vanno da B verso A non devono essere utilizzati, se cosi non fosse nella rete residua avrei un arco che mi permetterebbe di raggiungere il nodo di origine che a quel punto non apparterrebbe più a B ma ad A

Complessita temporale di Ford-Fulkerson è $O(mnC)$
	 Dim)
	 in tempo $O(m)$ posso trovare il min-cut, basta individuare tutti i nodi raggiungibili da s nella rete residua
	 Assendo che il valore del flusso venga sempre incrementato di uno il costo compressivo è  $O(m \space val(f))$
	 dove il valore del flusso è $O(nC)$ dove C è la capacità massima degli archi 

	
 
