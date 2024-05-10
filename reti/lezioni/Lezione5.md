# Cookie
Come abbiamo visto il protocollo HTTP è un protocollo senza stato, ovvero il server non mantiene informaioni riguardo i client. Tuttavia , spesso i web server possono autenticare gli utenti , sia per limitare l'accesso da parte di questi ultimi sia per fornire contenuti in funzione della loro identità. A questo scopo, HTTP adotta i **cookie** per tenere traccia degli utetni


La tecnologia dei cookie presenta quattro componenti:
1. una riga di intestazione nel messaggio di risposta HTTP
2. una riga di intestazione nel messaggio di richiesta HTTP
3. un file cookie mantenuto sul sistema terminale dell'utente e gestito dal browser dell'utente
4. un database sul sito


>[!Esempio]
>- Susan usa il browser dal portatile, visita uno specifico sito di commercio elettronico per la prima volta (ad esempio amazon)
>- quando la richiesta HTTP iniziale arriva al sito, il sito crea:
>    - un identificativo univoco
>    - una voce nel proprio database, indicizzata dal numero identificativo
>- il server ritorna una risposta che include l'intestazione `Set-cookie`, che contiene l'identificativo unico e che sarà aggiunto al file dei cookie 
>- le successive richieste del browser di Susan per questo sito conterranno l'identificativo in una intestazione cookie.

![[Pasted image 20240402130419.png]]

I cookie sono oggetto di controversie, in quanto possono essere considerati una violazione della privacy dell'utente. Un web server può imparare molto sull'utente e potrebbe vendere queste informazioni a una terza parte.
I cookie sono considerati dati personali, soggetti alla normativa GDPR (EU General Date Protection Regulation ) sui dati personali.

# Web cache
Una **web cache**, nota anche come **proxy server**, è un entità di rete che soddisfa richieste HTTP al posto del web server effettivo. Il proxy ha una propria memoria su disco (una cache) in cui conserva copie di oggetti recentemente richiesti.

![[Pasted image 20240402151116.png]]

1. Il browser stabilisce una connession TCP con il proxy server e invia una richiesta HTTP per l'oggetto specificato 
2. Il proxy server controlla la presenza dell'oggetto richiesto nella propria memoria locale
	- se essa è presente viene inoltrato un messaggio di risposta HTTP al browser
	- se non è presente il proxy apre una connessione TCP verso il server di origine. Invia una richiesta HTTP al server originale che invierà al proxy l'oggetto all'interno di una risposta HTTP, la risposta verrà salvata nella memoria locale e ne inoltra poi una copia al browser attraverso un messaggio di risposta HTTP
	
>[!Note]
>Si noti che il proxy si comporta  contemporaneamente sia  da server che da client

Il web caching si è sviluppa in internet per due ragioni:
1.  riduce i tempi di risposta alle richieste dei client
2. riduce il traffico sul collegamento di accesso a Internet istituzionale

Esempio: 

![[esempio.png]]

Una rete di un ente e la rete publica Internet. La rete dell'ente è una LAN ad alta velocità. Un collegamento a 15Mbps connette un router della prima parte a uno della seconda. I server di origine sono collegati a Internet e situati in diverse parti del mondo. Supponiamo che:

- Dimensione media di un oggetto: 1 Mbit 
- Frequenza media browser: 15 richieste al secondo
- Messaggi HTTP trascurabilmente piccoli
- Velocità media di trasmissione dei dati (*Ritardo Internet*): 2 s

Quindi abbiamo che:
- Intensità traffico rete LAN   $\frac{(15 ric/s) \cdot (1 Mbit/ric)}{100 Mbps} =0.15$
- Intensità traffico sul collegamento  $\frac{(15 ric/s) \cdot (1 Mbit/ric)}{15 Mbps} =1$

Un'intesità di traffico di 0.15 su una rete locale provoca ritardi dell'ordine dei millisecondi, però quando l'intesita di traffico su un collegamento si avvicina a 1 può provocare ritardi dell'ordine di minuti. Quindi abbiamo due possibilità:
1. Incementare la banda sul collegamento, puo però risultare costoso aggiornare l'infrastruttura.
2. Adottare un proxy nella rete dell'ente, supponiamo ora che il 40% delle richieste sia soddisfatto dal proxy entro 10ms e che il restante 60% deve essere soddisfatta dalla server di origine. In questo l'intesità di traffico passa sul collegamento di accesso scende a 0.60. Quinid il ritardo medio è  $0,4 \cdot(0.01s)+0.6 \cdot (2.01) \leq 1,2s$ 

Cosa accade se l'oggetto viene modificato nel server di origine?? HTTP presenta un meccanismo che permette alla cache di verificare se i suoi oggetti sono aggiornati, chiamato **GET condizionale**, un messaggio HTTP viene detto messaggio GET condizionale se:
1. Usa il metodo GET
2. include una riga di intestazione `If-modified-since`

Esempio:

```
GET /fruit/kiwi.gif HTTP/1.1
Host: www.exotiquecouisine.com 
If-modified-since: Wed, 9 Sep 2015 09:23:24
```

GET condizionale che richiede al server di inviare l'oggetto solo se è stato modificato rispetto alla data specificata. Se non è stato modificato il server rispondera con:

```
HTTP/1.1 304 Not Modified 
Date: Sat, 10 Oct 2015 15:39:29
Server: Apache/1.3.0 (Unix)
```

Il web server invia un messaggio di risposta, ma non include l'oggetto richiesto, in quanto ciò implicherebbe spreco di banda e incrementerebbe il tempo di risposta percepito dall'utente

# Da HTTP/1.1 a HTTP/2 a HTTP/3

**Obiettivo principale**: diminuzione del ritardo nella richiesta HTTP a più oggetti

- **HTTP/1.1** introduce GET multiple in pipeline su una singola connessione TCP
	- Il server risponde in ordine alle richieste di  GET (first-come-first-served)
	- Con FCFS oggetti piccoli possono dover aspettare per la trasmissione dietro a uno o più oggetti grandi
	- Il recupero delle perdite (ritrasmissione dei segmenti TCP persi) blocca la trasmissione degli oggetti

-  **HTTP/2** maggiore flessibilità del server nell'invio di oggetti al client
	- Metodi, codice di stato, maggior parte dei campi di intestazione inalterati rispetto a HTTP/1.1
	- Ordine di trasmissione degli oggetti richiesti basata su una priorità degli oggetti specificata dal client
	- Invio _push_ al client di oggetti aggiuntivi, senza che il client li abbia richiesti (notifiche)
	- Dividere gli oggetti in frame, intervallare i frame per mitigare il blocco HOL(Head-Of-Line blocking)
	
- **HTTP/3** aggiunge sicurezza, controllo di errore e congestione per oggetto (più pipelining) su UDP.
# E-mail

La posta elettronica è costituita da tre componenti principali:

- **User Agent** consentono agli utenti di leggere, rispondere, inoltrare, salvare e comporre messaggi (Outlook, Gmail ...)
- **Mail Servers** costituiscono la parte centrale dell'infrastruttura del servizio di posta elettronica
- **Protocollo SMTP (Simple Mail Transfer Protocol)** rappresenta il principale protocollo a livello di applicazione per la posta elettronica. Fa uso di TCP per il trasferimento della mail dal mittente al destinatario. SMTP presenta un lato client, in esecuzione sul mail server del mittente, e un lato server, in esecuzione sul server del destinatario. Entrambi i lati possono essere eseguiti su tti i server di posta. Quando un server invia posta a un altro,  agisce come client SMTP; quando invece la riceve, funziona come un server SMTP.

	![[Pasted image 20240402184602.png]]

**Formati di messaggi di posta**

```
From: alice@crepes.fr 
To: bob@hamburger.edu
Subject: Alla ricerca del significato della vita

(body)
```

Il corpo dei messaggi di posta elettronica è preceduto da un'intestazione contenete informazioni di servizio. Tale informazione periferica è contenuta in una serie di righe di intestazione. Queste righe sono separate dal corpo del messaggio mediante una riga senza contenuto.

