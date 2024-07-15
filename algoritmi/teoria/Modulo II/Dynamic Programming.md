# Insieme indipendente di peso massimo
**Input** : i nodo $v_i$ ha un peso $w_i$
**Output** : Insieme indipendente (insieme di nodi che non contiene due nodi adiacenti), di peso massimo

![[Insieme indipendete.png]]

Per tentare di risolvere il problema potremmo utilizzare diversi approcci :
- **Brute Force** : L'idea è quella di visionare tutti i possibili sottoinsiemi degli n nodi, il problema è che il numero di sottoinsieme e troppo grande ovvero $2^n$
- **Greedy** : L'idea è quella di costruire la soluzione in modo incrementale scegliendo ogni volta il nodo indipendente di valore massimo. Il problema sta nella corretteza di questo algoritmo, in quanto funziona solo per determinate istanze 
	![[insiemeindipendenteGreedy.png]]
- **Divide et Impera** : L'idea è quella di dividere a metà il cammino, calcolare il modo ricorsivo l'insieme indipendente di peso massimo sulle due metà e poi combinare le soluzioni, ma potremmo incorrere in conflitti durante la fase di ricostruzione
	![[divideetimperacontroesempio.png]]
Perchè questi approcci non funzionano? Il problema principale è che non stiamo capendo davvero la **struttura del problema**.

>[!Important]
>Regionare sulla struttura della soluzione ottima del problema e cercare di estrapolare dei sottoproblemi più piccoli, che possono essere combinati per calcolare la soluzione del problema

Sia $S$ la soluzione ottima, ossia l'insieme indipendente di peso massimo, considerando l'ultimo nodo $v_n$ vediamo se esso appartiene o meno a $S$ : 
- Se $v_n \notin S$ la soluzione ottima rimarra invariata anche per $G^{'}=G -${$v_n$}
	![[caso1insiemeindipendente.png]]
- Se $v_n \in S$ la soluzione ottima sarà il valore del nodo $v_n$ più la soluzione ottima per  $G{''} = G -${$v_{n-1},v_n$} 
	![[casodueinsiemeindipendete.png]]
L' idea a questo punto è quella di calcolare entrambi i casi ricorsivamente, sfortunatamente però il costo diventerebbe troppo elevato $O(\phi)^n$

Ma se invece di calcolare ogni volta tutte le soluzioni, calcolassimo solo i problemi distinti? Osserviamo che ci sono $O(n)$ problemi distinti ovvero c'è un sottoproblema per ogni nodo in $G$. Quindi l'idea migliore è di procedere iterativamente considerando prefissi di $G$ dai più piccoli verso i più grandi.

Definiamo i sottoproblemi:
- Opt[j] = il sottoinsieme di peso massimo considerando il sottocammino composto dai primi $j$ nodi

Definiamo i casi base e la folmula per trovare una soluzione generica:
- Opt[1]  = $w_1$
- Opt[2] = max{$w_1, w_2$}
- Opt[j] = max{Opt[j-1], $w_j$ + Opt[j-2]}

La soluzione ottima si troverà in Opt[n]

Ora abbiamo tutti gli strumenti necessari per definire l'algoritmo:

```
Insieme_indipendente_di_peso_massimo(G):
	Opt[1] = w_1
	Opt[2] = max{w_1, w_2}
	for j=3 to n do:
		Opt[j] = max{Opt[j-1], w_j + Opt[j-2]}
	return Opt[n]
```

Questo algorimto non calcola la soluzione ottima ma solo il suo vaolre per farlo abbiamo a disposizione due approcci:

1. Mentre calcoliamo OPT, possiamo mantenere esplicitamente anche la soluzione. Non è ottima in quanto andiamo a sprecare spazio e tempo.
2. Ricostruire la soluzione solo alla fine sfruttando Opt[n]
	
	```
	sia S un insieme vuoto
	while j >= 3:
		if Opt[j-1]>= w_j+ Opt[j-2]
			j-1
		else 
			aggiungi v_j a S
			j-2
			
	if j = 2 and w_2 > w_1 
		aggiungi v_2 a S
	else
		aggiungi v_1 a S
		
	return S
	```
	La complessita temporale è $O(n)$

# Principi fondamentali della programmazione dinamica

1. Identificare un numero piccolo di sottoproblemi.
	- I sottoproblemi devono essere pochi.
	- Risolti tutti i sottoproblemi si può calcolare velocemente la soluzione al problema originale.
	- Ci devono essere sottoproblemi "piccoli", ovvero casi base.
	- Ci deve essere un ordine in cui risolvere i sottoproblemi.

2. Descrivere la soluzione di un generico sottoproblema in funzione delle soluzioni di sottoproblemi più "piccoli".
3. Le soluzioni dei sottoproblemi sono memorizzate in una tabella.
4. Avanzare opportunatamente sulla tabella, calcolando la soluzione del sottoproblema corrente in funzione delle soluzioni di sottoproblemi già risolti.

# Weithed interval scheduling 
Questa problema è una generalizzazione dell'interval scheduling
L'algoritmo prende in **input** collezione di n intervalli $I_1,...,I_n$ che hanno un tempo di inizio e di fine con peso $w_j>0$ e restituisce in **output** un sottoinsieme di peso massimo mutuamente compatibili

![[Weithed interval scheduling.png]]

L'algoritmo dell'interval scheduling non funziona più:
![[controesempio.png]]

>[!note]
> Con $p(j)$ indichiamo il piu grande indice i (t.c $i<j$) compatibile con j

Definiamo i sottoproblemi:
- Opt[j] = il massimo peso di qualsiasi sottoinsieme dei primi j jobs compatibili

Definiamo i casi base e la folmula per trovare una soluzione generica:
- Se in Opt[j] non è stato selezionato il $j-esimo$ jobs Opt[j] = Opt[j-1]
- Se in Opt[j] è stato selezionato il $j-esimo$ jobs Opt[j] = $w_j$ + Opt[p(j)]

- Opt[0]  = 0
- Opt[j] = max{Opt[j-1], $w_j$ + Opt[p(j)]}

La soluzione ottima si troverà in Opt[n]

Ora abbiamo tutti gli strumenti necessari per definire l'algoritmo:
```
Bottom-Up(Intervals I)
    Ordina i job per finish-time 
    Calcola p[j] per ogni j con la ricerca binaria
    OPT[0] = 0
    for j = 1 to n do 
        OPT[j] = max(OPT[j - 1], wj + OPT[p[j]])
    return Opt[n]
```

Complessità temporale é $O(nlogn)$

Un altro approccio è quello di usare la tecnica della **memoization**. Ovvero si usa la ricorsione per calcolare OPT, ma nel mentre si memorizzano anche le soluzioni passate in un'apposita tabella.

```
Top-Down(Intervals I)
    Ordina i job per finish-time
    Calcola p[j] per ogni j con la ricerca binaria
    OPT[0] = 0
    return M-Compute-Opt(n)

M-Compute-Opt(j)
    if(OPT[j] is uninitialized)
        OPT[j] = max(M-Compute-Opt(j - 1), wj + M-Compute-Opt(p[j]))
    return OPT[j]
```

Complessita temporale è $O(nlogn)$:
- Ordinare i job mi costa $O(nlogn)$
- Ogni volta che devo risolvere una chiamata ricorsive ne vengono effettuate 2, e il costo di ogni singola chiamata ricorsiva è $O(1)$, effettuo al più $O(n)$ chiamate ricorsive

Questi algorimto non calcolano la soluzione ottima ma solo il suo valore.
```
Find-solution(j):
if(j = 0)
	return 0
else if(w_j + Opt[p(j)] > Opt[j-1])
	return {j} + Find-solution(p(j))
else
	return Find-solution(j-1)
```


# Longest Increasing Subsequence
Data una sequenza n vogliamo trovare la sottosequenza cresente più lunga

![[longestincreasing.png]]


Definiamo i sottoproblemi:
 Opt[i] = è la sottosequenza cresente più lunga che finisce per S[i]
 
Definiamo i casi base e la folmula per trovare una soluzione generica:

![[esempioLongestIncresing.png]]

Mi chedo se 5 può essere unito agli elementi precedenti della sequenza, ho due possibilità:
1. S[j] > S[i] è inutile controllarlo 
2. S[j] < S[i] allora faccio Opt[j]+1

Opt[1] = 1
Opt[i] = 1 +max{0, $max_{j = 1,2,...i-1  \space\space t.c. S[j]<S[i]}$ Opt[j]}

La soluzione ottima sarà il massimo valore Opt[i]


Ora abbiamo tutti gli strumenti necessari per definire l'algoritmo:
```
Longest_increasing_Subsequence(S[1,n])
	Opt[1] = 1
	for i=2 to n
		Opt[i] = 1 +max{0, max_{j = 1,2,...i-1 t.c. S[j]<S[i]}                       Opt[j]}
	return max Opt[i]
```

Complessità temporale é $O(n^2)$

# Segmented Least Square

Per prima cosa introduciamo Least Square
L'algoritmo prende in **input** n punti nel piano cartesiano, ogni punto ha cordiate(x,y) e restituisce in **output** la retta che approssima il più possibile l'andamento dei punti, voglio trovare una retta $y=ax+b$ che minimizza la somma degli scarti quadratici $\sum_{i = 1 \space to \space n}{(y_i-ax_i-b)^2}$

Il problema si riduce quindi a trovare i valori di a,b. Esiste una formula chiusa per calcolari in tempo $O(n)$

![[leastsquare.png]]

Spesso però i punti non sono allineati su una retta ma ad esempio sono allineati rispetto a una sequenza di più rette, quindi l'obbiettivo di Segmented Least Square è trovare una sequenza di rette che minimizza $f(x)$, dove $f(x) =E+cL$ 
- E = la somma degli scarti quadratici di ogni segmento $\sum_{i = 1 \space to \space n}{(y_i-ax_i-b)^2}$ 
- $c>0$ 
- L = numero di rette utilizzate

![[segmentedleast squeare.png]]

Definiamo i sottoproblemi:
 Opt[j] = è la sequenza di segmenti aventi costo minimo che coprono i punti da $p_1,...,p_j$ 
 
Definiamo i casi base e la folmula per trovare una soluzione generica:

>[!note]
> Definiamo con $e_ij$ scarto quadratico medio per coprire i punti da $p_i$ a $p_j$

- Opt[0] = 0
- Opt[j] = $min_{1\leq i\leq j}\space{e_{ij}+c+Opt[i-1]}$ provo tutte le possibili combinazioni da 1 a j e poi prendo la migliore

La soluzione ottima si troverà in Opt[n]

Ora abbiamo tutti gli strumenti necessari per definire l'algoritmo:
```
Segmented_least_square(Point, c)
	for i to n
		for j to n
			calcola e_ij
			
	Opt[0]=0
	for i to n
		 OPT[j] = min 1<=i<=j {eij + c + OPT[i - 1]}
		
    return OPT[n]
```

- Costo Computazionale è $O(n^3)$ 
	- calcolare $e_{ij}$ mi cosa ogni volta $n$ ripetendo per $n^2$ volte il costo diventa 

# Knapsack 
L'algoritmo prende in **input** un insieme di `n` oggetti con un peso $w_i$ e un valore $v_i$, e uno zaino che ha una certa capienza massima $W$ e restituisce in **output** una collezione di oggetti con valore piu alto possibile ma la cui somma dei pesi non deve superare la capacitò massima dello zaino 

![[knapsack.png]]

Per risolvere il problema utilizziamo un algoritmo di programmazione dinamica

Definiamo i sottoproblemi:

Opt[i,w]  = soluzione ottima per gli oggetti che vanno da 1 a i e la capacità dello zaino è w

Definiamo i casi base e la folmula per trovare una soluzione generica
Opt[i,w] = potrà contenere o non contenere l'oggetto i:
- Se Opt[i,w] non contiene l'oggetto `i` allora $Opt[i,w] = Opt[i-1,w]$$
- Se Opt[i,w] contiene l'oggetto `i` allora $Opt[i,w] = Opt[i-1,w-w_i]$ quando collezioniamo il valore di $v_i$ la capacità dello zaino diminuisce a $w-w_i$

Opt[0,0] = 0
Opt[i,w]  = Opt[i-1,w] se $w_i>w$
Opt[i,w] = max($Opt[i-1,w], v_i +Opt[i-1,w-w_1]$)

La soluzione ottima si troverà in Opt[n,W]

Ora abbiamo tutti gli strumenti necessari per definire l'algoritmo:
```
Knapsack(Items, W)
    for w = 0 to n do 
        OPT[0, w] = 0

    for i = 1 to n do 
        for w = 0 to W do 
            if(wi > w) then
                OPT[i, w] = OPT[i - 1, w]
            else 
                OPT[i, w] = max{ OPT[i - 1, w], vi + OPT[i - 1, w -                             wi]}
    return OPT[n, W].
```

La complessità temporale è $O(Wn)$

# Sequence alignment

Due stringhe x e y sono simili se ponendole una sotto l'altra abbiamo bisogno di poche modifiche per renderle uguali,

>[!Important] 
>**Edit Distance**
> - mismatch (bisogna sostituire una lettera con un'altra) con costo $\alpha_{pd}$
> - gaps (bisogna inserire un carattere vuoto) con costo $\delta$
> 
>Con $cost = \sum{\alpha}+\sum{d_x}+\sum{d_y}$ indichiamo quanto sono diverse due parole

![[mismach.png]]

L'algoritmo prende in **Input** due strighe $x_1,...,x_n$ e $y_1,...,y_m$ e retituisce in **output** un allineamento tra x e y di costo minimo

Definiamo i sottoproblemi:
Opt[i,j] = minimo costo per allineare la stringa   $x_1,...,x_i$ e $y_1,...,y_j$

Definiamo i casi base e la folmula per trovare una soluzione generica

possimamo distinguere 3 differenti casi:
- Opt[i,j] matches $x_i$ con $y_i$ quindi Opt[i,j]  =$\alpha_{x_i y_j}$ + Opt[i-1,j-1]
- Opt[i,j] lascia $x_i$ unmatches Opt[i,j]  = $\delta_i$ + Opt[i-1,j]
- Opt[i,j] lascia $y_j$ unmatches Opt[i,j]  = $\delta_j$ + Opt[i,j-1]

i due casi base sono:
- $\delta_i$ se i = 0
- $\delta_j$ se j = 0

La soluzione ottima si troverà in Opt[n,m]

Ora abbiamo tutti gli strumenti necessari per definire l'algoritmo:
```
Sequence-Alignment(x,y,Delta,Alpha)
	m = len(y)
	n = len(x)

	for i = 0 to m do
		M[i,0] = i * Delta
	for i = 0 to n do 
		M[0,j] = j * Delta

	for i = 1 to  m do
		for j = 1 to n do
			Opt[i,j]  = min{Alpha[x_i,y_i]+Opt[i-1,j-1],
							Delta + Opt[i-1,j],
							Delta + Opt[i,j-1]}
	return Opt[n,m]
	
```

La complessità temporale è $O(mn)$

Un modo per calcolare in maniera efficente la soluzione è l'algoritmo di Hirschberg che combina la tecnica del dividi-et-impera e della programmazione dinamica

Consideriamo la matrice come un grafo 

![[hirschberg.png]]

 Sia $f(i,j)$ la lunghezza del cammino da $(0-0)$ a $(i-j)$, possiamo calcolare $f(*,j)$ per ogni j in tempo $O(nm)$ e spazio $O(m+n)$
 ![[f.png]]
Lemma 1) $f(i,j)= Opt[i,j]$

Dim per induzione
- Caso base $f(0,0)= Opt[0,0] = 0$
- Passo induttivo $f(i,j)$ = $min{(\alpha_{x_iy_i} +f(i-i,j-1),\delta_i + f(i-1,j),\delta_j+ f(i,j-1))}$ = $min{(\alpha_{x_iy_i} +Opt[i-i,j-1],\delta_i + Opt[i-1,j],\delta_j+ Opt[i,j-1])}$ = Opt[i,j]

Definiamo $g(i,j)$ come la lunghezza del cammino che va da $(m-n)$ a $(i-j)$
invertendo gli archi 

![[g.png]]


Il nostro obbiettivo è quello di trovare un valore `q` che minimizza $f(q,n/2)+g(q,n/2)$ al fine di salvarci il nodo e utilizzarlo come nodo di start o di end nelle ricorsioni successive

![[n2.png]]

 
- Complessità Spaziale è $O(m + n)$
	Perchè ci sono $\leq n$ chiamate ricorsive, ciascuna usa $\theta(m)$ spazio per calcolare $f$ e $g$.
 - Complessità Temporale e $O(mn)$


# Bellman-Ford-Moore
L'algoritmo prende in **input** un grafo $G =(V,E)$ diretto con peso degli archi arbitrario (può essere anche negativo) e retituisce in **output** il cammino minimo che da ogni nodo $v$ porta ad un nodo $t$

>[!note]
>se il peso degli archi fosse vincolato ad essere positivo si utlizzarebbe Dijkstra che in tempo $O(m+nlogn)$

In presenza di archi negativi Dijkstraperò non funziona più perche non è in grado di stimare le distanze 

![[dijkstranonfunzia.png]]

Si potrebbe pensare di aggiungere una costante a ciascun peso per ottenere solo pesi positivi, ma anche così facendo, non otteremo il risultato corretto.

![[dijkstrasommato.png]]


- Lemma 1 
	Se nel grafo esiste un ciclo negativo non esiste un cammino minimo
	
	Dim) 
	 se esistesse un ciclo negativo potrei rendere il cammino minimo arbitrariamente corto
- Lemma 2
	Se non esistono cicli negativi nel grafo esiste un cammino minimo tra due nodi di lunghezza al piu n-1

	Dim)
	 se esiste un ciclo per ipotesi sarà $> 0$ quindi è inutile passarci attraverso
	  ![[ciclopositivo.png]]

Definiamo un algoritmo di programmazione dinamico:

Definiamo Opt(i,v) come il cammino minimo che va da v a t che utilizza un numero di archi $\leq i$ 

- Il numero di sottoproblemi è piccolo?
	si perchè per ogni nodo v vogliamo trovare il cammino minimo che utilizza $\leq i$  archi quindi ci sono $O(mn)$ sottoproblemi
- una volta risolti i sottoproblemi ho trovato la soluzione?
	si perche per ogni nodo $v$ avrò la soluzione in Opt(n-1,v) (questo è vero per il lemma 2)
- È possibile risolvere i sottoproblemi attraverso una formula?
	Abbiamo due possibili casi:
	1. il cammino minimo usa meno di $i$ archi Opt(i,v) = Opt(i-1,v)
	2. il cammino minimo usa i archi Opt(i,v) = $l_{vw}$ + Opt(i-1,w)
	$$
\left \{ \begin{array}{rl}
\text{0 \;\;\;\;\;\;\;\;\;\;\;\;\; if i  = 0 and v $\neq$ t}\\
\text{$\infty$ \;\;\;\;\;\;\;\;\;\;\;\;\; if i  = 0 and v $\neq$ t}\\
min(opt(i-1,v),min_{(v,w) \in E}(Opt(i-1,w)+l_{vw}))\;\text{if $i > 0$}

\end{array}
\right.
$$
 Ora abbiamo tutti gli strumenti necessari per definire l'algoritmo:
 ```
Shortest-Path(V,E,l(funzione peso),t):
	foreach node v appartenete ad V
		Opt[0,v]  = inf
	Opt[0,t] = 0
	
	for i=1 to n-1:
		foreach node v in V:
		Opt[i,v] = Opt[i-1,v]
		foreach edge(v,w) in E:
			Opt(i,v) = min{opt(i,v),(Opt(i-1,w)+l_{vw})}
```

- La complessità temporale è $O(mn)$
	 Dim)
	 Ogni iterazione esaminiamo ciascun nodo una volta sola. Quindi andando a considerare pero ogni nodo tutti i suoi archi uscenti e sommandoli insieme, otteniamo che il doppio ciclo `for each` costa $O(m)$
- La complessità spaziale è $O(n^2)$


Per ricostruire la soluzione posso sfruttare 2 approcci:
1. Mantengo il puntatore al successore del nodo lungo il cammino minimo
2. La ricostruisco dalla tabella

##### Posso migliorare la complessità 
 La risposta è si, posso mantenere due vettori:
- un vettore d[v]  = cammino più corto che porta da v a t
- un vettore successor[v] = prossimo nodo del cammino da v a t

>[!note] 
>se d[w] non è stato modificato al passo i-1 allora non ha alcun senso considerare gli archi entranti in w al passo i

```
BELLMAN-FORD-MOORE(V,E,l,t)

	foreach node v in V:
		d[v] = inf
		successor[v] = null
	d[t] = 0
	
	for i=1 to n-1
		foreach node w in V:
			if d[w] è stato aggiornato nel passo precendete)
				foreach edge(v,w) in E
					if(d[v] > d[w]+l_vw)
						d[v]  = d[w]+l_vw
						successor[v] = w
		if(nessun valore di d è stato aggiornato)
			stop

```

- Lemma 3
	 $\forall$ nodo $v$ d[v] è il cammino minimo da $v$ a $t$ 
	 
- Lemma 4 
	 $\forall$ nodo $v$ d[v] è monotona decresente
	 
- Lemma 5 
	 dopo i-esima passo $d[v] \leq$ della lunghezza del cammino minimo da $v$ a $t$ che usa archi $\leq i$
	 
	 Dim)
	 - caso base: $i = 0$. 
		  Se non ho ancora fatto nessuna passata, `d[v]` contiene la lunghezza del cammino minimo che usa al più 0 archi. Ovvero tutti sono $+\infty$ tranne `d[t]` che è 0.
	 - passo induttivo: $i>0$
		 Assumiamo che sia vero fino alla passata $i-esima$
		 Condiseriamo un cammino P  da $v$ a $t$ composto da  $\leq i+1$ archi. Sia (v,w) il primo arco in P e sia $P^{'}$ il sottocammino che va da $w$ a $t$
		 
		 Per ipotesi induttiva sappiamo che per $P^{'}$ il teorema è rispettato, poichè  è un cammino che utilizza al più $i$ archi, pertanto la condizione è rispettata anche per il cammino $P$ che utilizza tutti gli archi utilizzati da $P^{'}$ +1 

- Complessità temporale di Bellman-Ford-Moore è $O(mn)$
- Complessità temporale di Bellman-Ford-Moore è $O(n)$

- Lemma 6
	Ogni ciclo nel grafo dei successori è un ciclo negativo
	
	Dim)
	 se successor[v]  = w allora d[v] $\geq$ d[w] +$l_{vw}$
	
	 ipotizzando di aver trovato un ciclo nel grafo dei successori 
	 ($v_1 \rightarrow v_2 \rightarrow ... \rightarrow v_k\rightarrow v_1$)
	
	 $d[v_1] \geq d[v_2] + l(v_1,v_2)$
	 $d[v_2] \geq d[v_3] + l(v_2,v_3)$
	 ...
	 $d[v_k] \geq d[v_1] + l(v_k,v_1)$
	 
	 se facciamo la somma delle disuguaglianze
	 $l(v_1,v_2)+...+l(v_k,v_1) < 0$
	   

Se ci sono cicli negativi bisogna aggiungere questo ciclo alla fine del codice in modo tale da indentificalo

```
for each edge (v, w)
    if(d[v] > d[w] + l_vw) then return "Esiste un ciclo negativo.
```

Dim)
Supponiamo che ci sia un ciclo nel grafo ($v_1 \rightarrow v_2 \rightarrow ... \rightarrow v_k\rightarrow v_1$)
Assumiamo per assurdo che la condizione sia sempre falsa allora

$d[v_1] \leq d[v_2] + l(v_1,v_2)$
$d[v_2] \leq d[v_3] + l(v_2,v_3)$
...
$d[v_k] \leq d[v_1] + l(v_k,v_1)$

 se facciamo la somma delle disuguaglianze
 $l(v_1,v_2)+...+l(v_k,v_1) \geq 0$ in contraddizione con lemma 6
 