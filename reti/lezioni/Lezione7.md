# Livello di Trasporto

Un protocollo a livello di trasporto mette una **una comunicazione logica** tra processi appartenenti a host diversi ( con comunicazione logica si intende che tutto procede come se gli host che eseguono i processi fossero direttamente connessi )

>[!note]
>Come i protocolli a livello di applicazione, anche i protocolli a livello di trasporto sono implementati  nei sistemei periferici

- Lato Mittente: il livello di trasporto converte i messaggi che riceve dal livello applicazione in pacchetti (noti come segmenti), questo avviene spezzando i messaggi in parti più piccole e aggiungendo a ciascuna di esse un intestazione di trasporto.
	l livello di trasporto passa poi il segmento al livello di rete dove viene incapsulato in un datagramma e iniviato al destinatario 
- Lato Ricevente elabora i segmenti ricevuti dal livello di rete, crea il mesaggio assembrando i segmenti e li passa al livello applicazione

In Internet possiede due protocolli di trasporto:
 - UDP (User Datagram Protocol) inaffidabile 
 - TCP ( Transmission Control Protocol) comunicazione tra processi affidabile, grazie a vari controlli.
 
## Multiplexing e Demultiplexing 
Un processo gestisce più di una socket( attraverso di essa i dati fluiscono nella rete).
Il livello di trasporto perciò non trasferisce i dati direttamente al processo, bensì ad una socket che fa da intermediario, ogni socket avrà un identificatore univoco il cui formato varai a seconda del protocollo di trasporto

- Lato ricevente, il livello di traspoto esamina i campi del segmento per identificare la socket di ricezione dove dirigere i segmenti.  Il compito di trasportare verso la socket i dati è detto **demultiplexing**
- Lato Mittente, il livello di trasporto raduna i frammenti di dati dati e incapsula ognuno di essi con una intestazione a livello di trasporto, per creare i segmenti e passarli al livello di rete. Questa operazione viene detta **Multiplexing**

![[multipexingdemultipexing.png.png]]

##### Multiplexing e Demultiplexing non orientati alle connessioni

In Python, `client_socket = socket(AF_INET,SOCK_DGRAM)` permettte di creare una socket UDP. Quando una socket viene creata il sistema operativo assegna in modo automatico un numero di porta che non sia ancora utilizzato. 
In alternativa `client_socket.bind(('',19157))` crea una socket associata ad una particolare porta

Una volta crata la socket, quando si deve creare il datagramma si deve specificare l'indirizzo IP di destinazione e la porta di destinazione, il segmento poi viene passato al livello di rete che effettua un tentativo di consegna del segmento all'host di destinazione. Se il segmento arriva all'host destinazione, il suo livello di trasporto esamina il numero di porta di destinazione nel segmento e invia il segmeno UDP alla socket con quel numro di porta 

>[!important]
>Una socket UDP viene identificata completamente da una coppia che consiste di un indirizzo IP e di un numero di porta di destinazione.
>Quindi due segmenti UDP con stesso indirizzo IP e numero di porta di destinazone saranno indirizzati allo stesso processo sul computer di destinazione 

![[UDP.png]]
##### Multiplexing e Demultiplexing orientati alla connessione 

La differenza tra una soket UDP e una TCP è che quella TCP è identificata da 4 parametri : **indirizzo IP di origine , numero di porta di origine , indirizzo IP di destinazione , numero di porta di destinazione**
- L'applicazione server TCP  presenta un "socket di benvenuto" che si pone in attesa di richieste di connessione da parte dei client TCP sulla porta 1200
- Il client TCP crea una socket e genera un segmento per stabilire la connessione tramite le seguenti linee di codice
``` python
client_socket = socket(AF_INET,SOCK_STREAM)
client_socket.connect(server_name, 12000)
```
- Una richiesta di connessione non è nient'altro che un segmento TCP con un numero di porta di destinazone 12000 e uno speciale bit di richiesta di connessione posto a 1 nell'intestazione. Il segmento include anche un numero di porta di origine
- Il sistema operativo dell'host che esegue il processo server quando riceve il segmento con la richiesta di connessione con porta di destinazione 12000, localizza il processo server in attesa di accettare connessioni sulla porta 12000.Il processo server crea quindi una nuova connessione `connection_socket, addr = server_socket.accept()`
- Il livello di trasport sul server prende nota dei seguenti valori nel segmento con la richiest di connessione:
	1. Numero di porta di origine nel segmento
	2. Indirizzo IP dell'host di origine
	3. Numero di porta di destinazione nel segmento
	4. Indirizzo IP dell'host di destinazione

![[Connessioneorientato.pgn.png]]

## Trasporto non orientato alla connessione: UDP
UDP fa il minimo che un protocollo di trasporto debba fare, preleva i messaggi dal livello applicativo, aggiunge altri due piccoli campi e passa il segmento al livello di rete.
Per questo motivo, si dice che UDP è **non orientato alla connessione**.

Ma allora perche esiste UDP?
- Nessun controllo stabile che potrebbe generare ritardi 
- Nessuno stato di connssione 
- Minor spazio usato per l'intestazione del pacchetto, UDP aggiugnge 8 byte mentre TCP ne aggiunge 20

## UDP: azione del livello di trasporto

- Lato mittente: Gli viene passato un messaggio applicativo, determina i valori dei campi di intestazione del segmento UDP, poi crea il segmento e lo invia al livello di rete 
- Lato ricevente: Riceve il segmento dal livello di rete, controlla il valore del campo di intestazione UDP checksum, estrare il messaggio applicativo e lo consegana alla socket appropiata 

![[udpsegmenti.png.png]]

### Checksum UDP
Il Checksum  UDP sever per il rilevamento degli errori, viene utilizzato per deteminare se i bit del segmento UDP sono stati alterati durante il loro trasferimento da sorgente a destinazione.

Il mittente UDP effettua il complemento a 1 della somma di tutte le parole da 16 bit nel segmento e l'eventuale riporto viene sommato al primo bit,tale risulato viene posto nel campo _Checksum_ del segmento UDP

Esempio con 3 parole a 16 bit:
1. sommiamo due parole:
	$110 0110 0110 0000 + 0101 0101 0101 0101 = 1011 1011 1011 0101$
2. Adesso sommiamo il risulato della somma, con la terza parola
	$011 1011 1011 0101 + 1000 1111 0000 1100 = 0100 1010 1100 0010$
3. Effettua il complemento a 1 ( inverte i bit ) 
	 $1011 0101 0011 1101$
	 
In ricezione si sommano le tre parole inziali e il checksum. Se non ci sono errori nel pacchetto, l'adizione farà $1111 1111 1111 1111$, altrimenti se un bit vale 0 sappiamo che è stato introdotto almeno un errore nel pacchetto.