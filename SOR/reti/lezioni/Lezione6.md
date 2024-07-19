# Domain Name System o DNS

Gli Host e i router di Interent possono essere identificati in vari modi:
- **l'indirizzo IP** a 32 bit(ad esempio 192.168.123.132),utilizzato per funzione di instradamento
- **nomi** (ad esempio cs.umass.edu),  hostname ustilizzato dalle persone.

E' necessario al fine di mappare anche gli hostname e riconoscere logicamente gli indirizzi IP, tradurre l'uno nell'altro, problema della **risoluzione dei nomi**.
L'approccio più statico possibile è quello di avere un ***file hosts*** nel nodo locale(in POSIX situato in /etc/hosts) che associa un indirizzo IP a uno o più hostname ad esso associati.Si tratta di un file locale a un nodo, e non abbiamo garanzie che ogni nodo abbia gli stessi hostname.

![[Pasted image 20240407141803.png]]

Inizialmente il file hosts era affidato ad un'unita centralizzata con un unico megafile. Ciò pero protava a diversi problemi, necessità di aggiornare continuamente e insallare il file di volta in volta per ogni nodo , che generava un enorme carico verso la macchina che manteneva il file

Oggi per ovvia a questi problemi il **DNS** è quindi un **database distribuito**implementato in gerarchia di **name server** ( non più una macchina centralizzata ma sistema distribuito in piu nodi di calcolo ).  Opera tramite un protoccolo a livello d'applicazione che può essere utilizzato dagli host, router e server per effettuare la rioluzione dei nomi 

>[!important]
>**DNS (Domain Name System)**, è un protocollo a livello applicazione che si occupa della traduzione dei nomi. Consiste in un database distribuito implementato in una gerarchia di **DNS server**. Consente quindi agli host, di interrogare questo database per **risolvere** i nomi.

>[!note]
>Si tratta di un protocollo a livello d'applicazione poichè è una funzione usata da tutte le applicazioni, e cosi come altre funzioni critiche sono implementate nelle parti periferiche della rete. In modo tale da lasciare il nucleo della rete più semplice possibile

Il DNS oltre alla traduzione degli hostname offe:
- **Host aliasing**. Un host dal nome complicato può avere più sinonimi o _alias_. Per esempio `relay1.west-coast.enterprise.com` potrebbe avere due sinonimi, `enterprise.com` e `www.enterprise.com`. In questo caso, il nome originale si dice che è un **hostname canonico**.
- **Mail sever aliasing**. Per esempio un utente, diciamo Bob, potrebbe avere un indirizzo di posta elettronica `bob@yahoo.com`. Tuttavia l'hostname del mail server di Bob potrebbe essere assai più complicato. Un'applicazione di posta può invocare il DNS per ottenere il nome canonico di un sinonimo fornito,così come l'indirizzo IP dell'host.
- **Load distribution**. Il DNS viene utilizzato anche per distribuire il carico tra server replicati, per esempio dei web server. I siti con molto traffico vengono replicati su più server, ognuno eseguito su un host diverso con un IP diverso. Nel caso di web server replicati, va associato a ogni hostname canonico un insieme di indirizzi IP.

  
# Organizzazione della gerarchia dei server DNS
Possiamo parlare di DNS come un sistema di databese distribuito e gerarchico:
- **Root level**. In Internet esistono più di 1000 root server dislocati in tutto il mondo. Tali root server sono copie di 13 differenti root server gestiti da 12 diverse organizzazioni, coordinate attraverso lo IANA. I root server forniscono gli indirizzi IP dei TLD server.
- **Top-level domain (TLD) server**. Questi server si occupano dei domini di primo livello quali com, org, net, edu, gov, e di tutti i domini di primo livello relativi ai vari paesi, come it, uk, fr, ca, jp. I TLD server forniscono gli indirizzi IP dei server autoritativi.
- **Server autoritativi**. Ogni organizzazione dotata di host pubblicamente accessibili tramite Internet deve fornire record DNS pubblicamente accessibili che associno i nomi di tali host a indirizzi IP. La maggior parte delle università e delle università e delle grandi società implementa e gestisce dei propri server autoritativi primario e secondario (di backup)

![[Pasted image 20240407133818.png]]
Questa gerarchia a livelli  in realtà ne presenta molti altri, talvolta i server con la mappatura effettiva si trovano a livelli più bassi (es art.uniroma2.it)

>[!Important]
>Man mano che scendo nella gerarchia, sto considerando un suffisso sempre più grande 
>Solo quando arrivo al server piu in basso nella gerarchia ho la mappatura effettiva

Esiste un altro tipo di DNS, detto **DNS server locale**, che non appartiene alla gerarchia di server, ma che è comunque centrale nell'architettura DNS. Ciascun ISP ha un DNS server locale. Quando un host si connette a un ISP, quest'ultimo gli fornisce un indirizzo IP tratto da uno o più dei suoi DNS server locali. Quando un host effettua una richiesta DNS, la query viene inviata al DNS locale che opera da proxy e inoltra la query alla gerarchia dei DNS server.

Il DNS server locale può essere implemetato in due differenti modalità:
- DNS interrogative iterativa :
	l server contattato risponde con il nome del server da contattare.

	![[Pasted image 20240407144019.png]]
	
- DNS interrogative ricorsiva:
	L'host affida il compito di tradurre il nome al server contattato.

	![[Pasted image 20240407144406.png]]

Il DNS  implementa un servizio di cache, per migliorare le prestazioni della rete in caso di query se la richeisto è gia presente nella sua cache la risolve immediatamente, altrimento lo ricerca attraverso la struttra a livelli e successivamente lo salva nella propria cache. Ovviamente per evitare dati stantii esiste il *time_to _live* (tempo dopo il quale le voci nella cache vengono cancelalte ) che tipicamente è di due giorni.

# Record DNS
I server che implementano il DNS memorizzano i dati  in delle strutture chiamate **RR ( resource record )**, ogni messaggio di risposta trasporta uno o piu RTT che sono delle quadrupre di fomato (Name, Value , Type, TTL ) 

In base al `Type` il record avrà name e value divero:
-  Se `Type = A`, allora `Name` è il nome dell'host e `Value` è il suo indirizzo IP. Pertanto un record di tipo `A` fornisce la corrispondenza tra hostname standard e il suo indirizzo IP. Per esempio, `(relay1.bar.foo.com, 145.37.93.126, A)`.
- Se `Type = NS`, allora `Name` è un dominio e `Value` è l'hostname del DNS server autoritativo che sa come ottenere gli indirizzi IP degli host del dominio. Questo record viene usato per instradare le richieste DNS successive alla prima nella concatenazione delle query. Per esempio `(foo.com, dns.foo.com, NS)`.
- Se `Type = CNAME`, allora `Value` rappresenta il nome canonico dell'host per il sinonimo `Name`. Questo record può fornire agli host richiedenti il nome canonico relativo a un hostname. Per esempio `(foo.com, relay1.bar.foo.com, CNAME)`.
- Se `Type = MX`, allora `Value` è il nome canonico di un mail server che ha il sinonimo `Name`. Per esempio `(foo.com, mail.bar.foo.com, MX)`.

Vediamo ora il formato dei messaggi DNS che possono essere: richiesta ( query ) o risposta ( reply ):
- I primi 12 byte rappresentano la **sezione di intestazione** che a sua volta contiene
	- 16 bit che  identificano la richiesta (copiati poi nel messaggio di risposta)
	- campo flag , il primo bit è 0 se è una richiesta 1 se è una risposta, un ulteriore bit è quello della ricorsione, viene impostato quando un client desidera che il DNS server effettui ricorsione.
- **Sezione della domanda** contiene informazioni sulla richeista che stanno per essere effettuate, incluse il campo nome con il nome che sta per essere richiesto 
- **Sezione delle risposte** contiene i record di risorsa relativi al nome originariamente richiesto. Una risposta può restituire più RR, dato che un hostname può avere piò indirizzi IP.
- **Sezione autoritativa** contiene i record di altri server autoritativi.
- **Sezione aggiuntiva** racchiude altri record utili[]

![[Pasted image 20240407160541.png]]

>[!note]
>Supponiamo di dover registrare il nome di dominio `networkutopia.com` presso ente un ente di registrazione (DNS Registrar), esso si occuperà di verificare l'unicitò del nome di dominio e di  inserirlo nel database DNS 
>Al registrar dobbiamo fornire il nome e gli indirzzi IP degli DNS autoritativi primario e secondario. Il registrar inserisce poi due record nel TLD server .com: `(networkutopia.com, dns1.networkutopia.com, NS) (dns1.networkutopia.com, 212.212.212.1, A)`. Nel server autoritativo bisogna poi inserire due record, uno di tipo A per `www.networkutopia.com` e uno di tipo MX per `networkutopia.com`.

# Applicazione P2P
Nell'architettura peer-to-peer ci sono coppie di host connessi ,in modo intermittente, che comunicano tra l'uno con l'altro

##### Confronto della distribuzione di un file tra architettura client-server e P2P
Sia F la dimenione del file. Siano N il numero di copie che devono essere trasmesse. Siano $u_s$ la velocità di upload nel server, $u_i$ la velocità di upload dell' i-esimo peer e $d_i$ la velocità di downoload dell' i-esimo peer.

1. Distribuzione file client-server 
		Il server, per caricare una copia di un file, impiega mediamente F/us. Per inviare N copie  $\frac {N \cdot F}{u_s}$. Per scaricare una copia l’i-esimo client impiega tempo pari ad $\frac{F}{d_{i}}$. Il client che impiega effettivamente più tempo a scaricare è quello con banda inferiore$\frac{F}{d_{min}}$
		
	- Il server deve inviare in sequenza N copie di file. Per invialre impiega $\frac {N \cdot F}{u_s}$
	- Ogni client deve scaricare una copia del file . Sia $d_{min}$ la banda di download più bassa(più la banda è piccola piu ci mette). Allore il tempo di download per il client con la banda minima sarà $\frac{F}{d_{min}}$
	- $D_{c-s} \geq max$ { $\frac{N \cdot F}{u_{s}}$, $\frac{F}{d_{min}}$ }
	
1. Distribuzione file P2P
		Vediamo ora la stessa situazione ma con approccio P2P.Il server, che è colui che ha a disposizione inizialmente il file, deve caricarne almeno una copia, con tempo $\frac{F}{u_s}$. Ciascun peer impiegherà $\frac{F}{d_{i}}$ per scaricarlo, e ancora una volta il download più lento sarà legato al peer con download minore $\frac{F}{d_{min}}$. Ma questa volta, volendo considerare quanto ci vuole a trasmettere tutte le N copie, possiamo considerare il fatto che le varie porzioni del file saranno sparse nella rete e quindi un nuovo nodo potrebbe richiedere il file non dal server iniziale, ma da un altro peer che lo ha scaricato in precedenza! Abbiamo quindi con buona approssimazione una capacità di upload totale che, oltre a quella del server, è anche quella di tutti i peer.
		
	- Il server deve trasmettere almeno una copia del file $\frac{F}{u_s}$
	- Ogni clinet deve scaricare una copia del file, quello con la banda piu bassa impiegherà $\frac{F}{d_{min}}$ , come aggregato deve scaricare $\frac{N \cdot F}{u_s+\sum_{i}{u_i}}$ dove $u_s+\sum_{i}{u_i}$ è la capacita di upload del server
	-  $D_{P2P} \geq max$ {$\frac{F}{u_s},\frac{F}{d_{min}},\frac{N \cdot F}{u_s+\sum_{i}{u_i}}$} 

![[Pasted image 20240407170545.png]]

# BitTorrent
Diffuso protocollo P2P per la distribuzione di file. L'insieme di tutti i peer che partecipano alla distribuzione di un file è chiamata **Torrent**. I peer nel torrent inviano/ricevono chunk del file( in genere  256kB ).
Quando un peer entra a far parte di un torrent per la prima volta, si registra in un **tracker** e ottiene la lista di un sottoinsieme di peer nel torrent, successivamente si connette al tracker e ottiene una lista di peer che stanno condividendo il file richesto, durante il download del file il peer che sta scaricando può condividere ad altri peer le porzioni che ha gia scaricato. Una volta che un peer ha acquistato l'intero file può lasciare il torrent oppure può rimanere nel torrent (come seeder)

![[Pasted image 20240407211810.png]]

Il problema fondamentale di queste reti sono i peer che una volta ottenuto il file lasciano la rete, in questo sento BitTorrent utilizza una strategia **tit-for-tat** (pan per focaccia), condivido ad un mio vicino solo se anche lui mi condivide qualcosa. Ogni 30 secondi scelgo un peer casuale a cui inizio ad inviare un file (serve per permettere anche ai nuovi peer che non hanno chunk di ottenerne uno per iniziale la condivisione)
# Streaming video e CDN

>[!important]
>Un video è una sequenza di immagini, visualizzate tipicamente a velocità costante di, 24 o 30 immagini al secondo. Un immagine non compressa è rappresentata mediante un array di pixel, ognuno dei quali codificato con un numero di bit per rappresentare lumininanza e crominananza.

Nello streaming HTTP quando un utente vuole vedere un video, il client sabilisce una connessione TCP  con il server e invia una richiesta GET HTTP, i byte di risposta vengono memorizzati in un buffer sell'applicazione client, quando il numoro di byte supera una soglia fissata l'applicazione client iniza la riproduzione (il client riproduce i frame mentre ne riceve altri che memorizzerà alla fine del buffer)

Oltre allo streaming HTTP, è stato sviluppato un altro sistema di streaming basato su HTTTP, **Streaming Dinamico Adattivo su HTTP, DASH**. In DASH i video vengono codificati in diverse versioni, ognuna aventi bit rate differente e quindi un differente livello di qualità. Quando la banda è elevata il client seleziona in automatico i blocchi da una versione con alto bit rate, mentre quando la banda è poca seleziona i blocchi da una versione con basso bit rate.

>[!important]
>**CDN** (_Content Distribution Networks_): gestisce server distribuiti in molti posti diversi, memorizza copie dei video e di altri contenuti web nei server e cerca di dirigere le richieste degli utenti al punto della CDN in grado di offrire il servizio migliore. Possono essere **CDN privata**, cioè proprietaria del fornitore di contenuti, come la CDN di Google che distribuisce i contenuti di Youtube. Alternativamente ci sono **CDN di terze parti** che distribuisce contenuti per conto di molti fornitori di contenuti come Akamai.

#### Funzionamento di  una CDM
Bob richiede `https://video.netcinema.com/6Y7B23V`.

1. Bob visita la pagina web di NetCinema.
2. Bob risolve `video.netcinema.com` attraverso il DNS locale.
3. Il **DNS server locale** invia una richiesta al DNS autoritativo per NetCinema ritorna il CNAME per `KingCDN.com`.
4. Il sistema DNS di `KingCDN.com` fornisce l'indirizzo IP del nodo CDN più vicino (di solito geograficamente) a Bob, ovvero al suo DNS locale.
5. Il DNS locale inoltra l'indirizzo IP del nodo CDN a Bob che fornirà il contenuto all'host dell'utente.
6. Bob, una volta ricevuto l'indirizzo IP del server di `KingCDN`, stabilisce una connessione TCP diretta con il server a quell'indirizzo IP e gli invia una richiesta GET HTTP per il video. Nel caso venga impiegato DASH, il server innanzitutto invierà al client un file manifesto con una lista di URL, uno per ogni versione del video, e il client selezionerà in modo dinamico i blocchi da versioni differenti