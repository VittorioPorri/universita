# Livello di applicazione

>[!Note]
>Scrive un'applicazione di rete significa scrive un'applicazione sui sistemi periferici

Prima di inziare a scrivere codice, bisogna progettare l'**architettura dell'applicazione** e stabilire la sua organizzazione sui vari sistemi periferici.

>[!IMPORTANT]
>Architettura Client-Server nel quale vi è un host sempre attivo (*Server*) che risponde alle richieste di servizio di altri host (*Client*)

Spesso in una questo tipo di architettura Client-Server un singolo host non basta quindi si usano spesso data-center che ospitano molti host al fine di creare un server più potente

>[!IMPORTANT]
>Archiitettura P2P (Peer-to-Peer) si sfrutta la comunicazione diretta tra coppie di host (detti peer)
>Uno dei punti di forza di quest'architettura è la sua intrinseca **scalabilità**, perché nuovi peer aggiungono capacità di servizio al sistema, sebbene generino anche nuovo carico di lavoro.

In una architettura P2P non è necessario che i peer siano sempre attivi e possono cambiare indirizzo IP

### Processi comunicanti

Definiamo come processi (programma in esecuzione) su host diversi comunichino tra di loro. Nel contesto della rete i processi comunicano scambiandosi messaggi attraverso la rete.
Il mittente crea messaggi e li invia attraverso la rete il destinatario li riceve, e se richiesto, invia messaggi di risposta

>[!IMPORTANT]
>Un processo invia e riceve messagggi dalla rete attraverso un'interfaccia detta Socket 

Un processo che vuole inviare un messaggio in rete, fa uscire il messaggio dalla propria "porta" (_socket_). Il processo presuppone l'esistenza di un'infrastruttura esterna che trasporterà il messaggio attraverso la rete fino alla porta del processo di destinazione. Quando il messaggio giunge al destinatario, attraversa la porta (_socket_) del processo ricevente che infine opera sul messaggio.

![[Pasted image 20240401100847.png]]

Per poter inviare/ricevere messaggi, ciascuno host deve avere un indirizzo detto **indirizzo IP** (numero univoco di 32 bit). Oltre all'inidirizzo IP il mittente deve conoscere anche il processo destinatario, piu specificatamente la socket, questo avviene attraverso un **numero di porta destinazione**

### Quale servizio di trasporto richiede un'applicazione?

Bisonga scegliere il servizio a seconda dei requisti di cui si necessita

>[!IMPORTANT]
>Servizion **TCP** garantisce:
>- Affidabilità nella trasmissione dei dati, garantendo che siano consegnati senza errori, perdite e nell'ordine corretto.
>- Controllo del flusso per regolare la velocità di trasmissione e evitare sovraccarichi del destinatario.
>- Controllo della congestione per adattare la velocità di trasmissione in base alle condizioni di congestione della rete.
>- È orientato alla connessione, richiedendo un setup tra mittente e destinatario prima della trasmissione dei dati.
>- Non offre temporizzazione, garanzie su un'ampiezza di banda minima e sicurezza, che possono essere implementate a livello di applicazione o tramite protocoli aggiuntivi.
>

>[!IMPORTANT]
> Servizio di **UDP** garantisce:
> - Poca affidabilità nel trasferimento dei dati, non ho alcuna garanzia che i dati inviati siano ricevuti
> - Non offre affidabilità, controllo di flusso, controllo della congestione, temporizzazione, ampiezza di banda minima, sicurezza, né setup della connessione

# Web e HTTP

>[!IMPORTANT]
> **HTTP( Hypertext transfer protocol )** è un protoccollo a livello applicazione del Web. Questo protocollo è implementa in due progremmi, client( Browser) e server in esecuzione su sistemi periferici diversi che comunicano tra loro scambiantosi messaggi HTTP

![[Pasted image 20240401110141.png]]

- HTTP usa TCP perche vuole evitare perdite 
- HTTP è un protocollo senza stato (stateless), cioè non mantiene informazioni sulle richieste fatte dal client

# Connessioni Persistenti e non Persistenti
### HTTP con connessioni non persistenti

>[!Note]
>Ciascuna coppia richiesta/risposta deve essere inviata su una connessione TCP *separata*

Seguiamo passo dopo passo il trasferimento di una pagina web dal server al client, ipotizzando che l'URL del file HTML sia :
	`http://www.someSchool.edu/someDepartment/home.index`

1. Il client HTTP inizializza una connessione TCP con il server HTTP a `www.someSchool.edu` sulla porta 80 
2. Il server HTTP all'host  `www.someSchool.edu` in attesa di una connessione TCP accetta la connessione e avvisa il client
3. Il client HTTP tramite la propria socket, invia un messaggio di richeista che include il percoso `/someDepartment/home.index`
4. Il server HTTP riceve il messaggio di richiesta, forma il messaggio di risposta che contiene l'oggetto richiesto e invia il messaggio nella sua socket
5. Il server HTTP chiude la connessione TCP soltanto quando sarà certo che il client abbia ricevuto la risposta
6. Il client HTTP riceve il messaggio di risposta. La connessione TCP termina. Il messaggio di risposta contiene il file HTML che viene visualizzato 

>[!IMPORTANT]
> **Round-Trip Time (RTT)** rappresenta il tempo impiegato da un piccolo pacchetto per viaggiare dal client al server e poi torna al client. 
> 
> RTT include i ritardi di propagazione, di accodamento nei router e nei commutatori intermedi e di elaborazione di pacchetto.

Il tempo di risposta con connessioni non persistenti è 2RTT + tempo di trasferimento di file

![[Pasted image 20240401222931.png]]

Gli svantaggi sono:
- Per ogni oggetto richesto nisogna stabiliere una nuova connessione
- 2RTT di ritaardo per ciascun oggetto

### HTTP con connessioni persistenti

Con HTTP 1.1 il server lascia la connession TCP aperta dopo l'invio di una risposta, in modo tale che i successivi messaggi tra gli stessi client/server vengano trasemssi sulla connessione. In generale il server HTTP chiude la connessione quando essa rimane inattiva per un dato lasso di tempo 


# Messaggio HTTP

### Messaggio di richesta

```
#Riga di Richesta
GET /somedir/page.html HTTP/1.1\r\n

#Riga di intestazione
Host: www.someschool.edu\r\n
Connection: close\r\n
User-Agent: Mozilla/5.0\r\n
Accept-Language: it\r\n
Accept: text/html, application/xhtml-xml\r\n
Accept-Encoding: gzip, deflate\r\n
Connection: keep-alive\r\n
\r\n
```


>[!note]
>Si noti che il messaggio è scritto in ASCII in modo che l'utente sia in grado di leggerlo

- **Riga di richesta** questa riga presenta 3 campi , il campo metodo , il campo URL e il campo verione HTTP. Il campo metodo può assumere diversi valori tra cui :
	- **GET** utilizzato per richiedere una risposta al server specificata nell'URL Spesso è usato anche per inviare dati al server, immettendo i dati da inviare direttamente nell'URL, dopo una (`?`). La stringa creata si chiama _query string_ ed è formata da coppie chiiave valore separati da `&`:  `/someDir/index?nome=Francesco&cognome=Rossi`.
	
	- **POST** E' uno dei metodi HTTP per inviare dati al server. A differenza di GET i dati inviati con POST non sono visibili nell'URL il che lo rende piu sicuro per l'invio di infomazioni sensibili
	
	- **HEAD** utilizzato per recuperare le informazioni di intestazione associate a una risorsa specifica, senza trasferire il corpo della risorsa stessa.
	
	- **PUT** utilizzato per aggiornare o creare una risora sul server 
	
	- **DELETE** utilizzato per eliminare una risorsa specifica dal server

- **Riga di intestazione** queste righe contengono i cosidetti _hearders_, sono dei metadati che forniscono informazioni aggiuntive sia nella richiesta che nella risposta di una comunicazione HTTP. Sono composte da coppie chiave-valore e servono a specificare vari aspetti della comunicazione. Alcuni di questi campi sono:
	- **Host** : Hostname o numero di porta del server al quale sara inviata la richesta. Obbligatori in HTTP/1.1 , se assente il server risponderà con *400 Bad Request*
	- **User-Agent** :  identifica l'applicazione, il sistema operativo, il _vendor_ e/o la versione dello _user agent_ che sta effetuando la richiesta
	- **Accept** : Tipo di contenuto, espressi come media type, compresi dal client
	- **Accept-Language** : Linguaggi naturali o locali preferiti dal client
	- **Accept-Encoding** : Algoritmi di codifica compesi dal client
	- **Connection**: Controlla se la connessione rimarrà aperta al termine dello scambio richiesta/risposta. Il valore _close_ indica che la connessione sarà chiusa; altrimenti, una lista non vuota di nomi di header, in genere solo keep-alive, indica che la connessione rimarrà aperta.


![[Pasted image 20240401233227.png]]

### Messaggio di risposta

```
# Riga di stato
HTTP/1.1 200 OK

# Riga di Intestazione
Date: Tue, 08 Sep 2020 15:44:04 GMT
Server: Apache/2.4.6 (CentOs)
Last-Modified: Tue, 01 Mar 2016 18:57:50 GMT
Accept-Ranges: bytes
Content-Lenght: 2651
Content-Type: text/html, charset=UTF-8
\r\n
# Corpo 
(data data data data ...)
```

- **Riga di Stato** presenta 3 campi: la versione del protocollo, un codice di stato e corrispettivo messaggio di stato
	- **1xx Infomational** risposta intermedia per comunicaro lo stato di connessione o l'avanzamento della richiesta prima di completare l'azione richiesta e inviare una risposta finale
	
	- **2xx Successful** : la richeista è stata ricevuta con successo, compresa e accettata
		Per esempio `200 OK` significa che la richiesta ha avuto successo, l'oggetto richiesto viene inviato nella rispsota.
		
	- **3xx Redirect**: il client deve eseguire ulteriori azioni per soddisfare la richiesta
		Per esempio `301 Moved Permanently`, significa che l'oggetto richiesto è stato trasferito, la nuova posizione è specificata nell'intestatazione `Location`
		
	- **4xx Client Error** : la richeista è sintatticamente scorretta o non può essere soddisfatta
		Per esempio `404 Not Found`, significa che il documento richiesto non si trova su questo server, oppure `406 Not Acceptable`, l'oggetto richiesto non esiste in una forma che soddisfa i vari `Accept-*`.
		
	- **5xx Server Error** : il server ha fallito nel soddisfare la richesta apparentemente valida
		Per esempio `505 HTTP Version Not Supported`, il server non ha la versione di protocollo HTTP
	
- **Riga di Intestazione**
	- **Date**: la data e l'ora in cui il messaggio è stato originato
	- **Server**: descrive il software usato dal server di origine per gestire la richiesta (troppi dettagli possono aiutare i malintenzionati ad attaccare il server)
	- **Last-Modified**: la data è l'ora il cui il server di origine crede che l'oggetto sia stato modificato per l'ultima volta
	- **Accept-Ranges** indica il supporto del server ai download parziali: il valore, se diverso da none, indica l'unità che si può usare per esprimere l'intervallo richiesto
	- **Content-Length**: l:wunghezza in byte del corpo dell'entità inviato al ricevente
	- **Content-Type**: media type nel corpo dell'entità inviato al riceventi
- **Corpo** : contiene l'oggetto richeisto

