# Sotto il cielo radiattivo
### Autori 
Vittorio Porri  vittorio.porri@students.uniroma2.eu
Lorenzo Cugliari  lorenzo.cugliari@students.uniroma2.eu
### Corso di Laurea
 Informatica Triennale

# Parte 1: Generalità

## Dominio Applicativo
La società post terza guerra mondiale è in crisi a causa delle radiazioni prodotte dalle esplosioni nucleari. I governi, per cercare di salvare i pochi superstiti umani dalla minaccia di estinzione, decidono di unirsi in un'unica associazione. Al fine di garantire una gestione ottimale del territorio, il governo centrale suddivide il territorio in varie porzioni chiamate Basi, che sono in grado di comunicare tra loro attraverso canali considerati sicuri. Nel caso in cui una Base si trovi in difficoltà, le altre sono tenute ad aiutare inviando risorse attraverso tali canali.

All'interno delle Basi, ogni aspetto è strettamente controllato: dalle abitazioni alle risorse, fino al livello di radiazioni presente nell'area e persino alle attività degli individui. Ogni individuo è schedulato e ha un compito ben definito da svolgere quotidianamente. Le Basi fanno rapporto giornaliero al governo centrale, che tiene traccia delle risorse prodotte e della loro posizione 

## Obiettivi del progetto 

Il principale obiettivo del progetto è lo sviluppo di un sistema per il controllo efficiente delle risorse all'interno di ciascuna Base. Questo sistema mira a monitorare accuratamente la produzione e la distribuzione delle risorse vitali all'interno delle Basi, al fine di garantire la sopravvivenza e il benessere degli abitanti.

1. **Monitoraggio delle Risorse:**
    
    - Implementare un sistema in grado di rilevare e monitorare le risorse cruciali all'interno di ogni Base. Ciò include, ma non è limitato a, cibo, acqua, medicinali, materiali da costruzione e altre risorse essenziali per la vita umana.
2. **Monitoraggio delle Radiazioni:**
    
    - Condurre una sorveglianza attenta dei livelli di radiazioni all'interno e nei dintorni di ciascuna Base. L'obiettivo è garantire che tali livelli rimangano entro limiti sicuri per la salute umana.
    - Implementare rigorose misure di protezione, inclusi rifugi anti-radiazione, per mitigare i rischi derivanti dall'esposizione alle radiazioni.
3. **Distribuzione Equa delle Risorse:**
    
    - Assicurare una distribuzione equa e adeguata delle risorse disponibili in ogni Base. Questo implica l'allocazione delle risorse in base alle necessità e alla popolazione della Base, garantendo che nessun individuo o gruppo venga trascurato o privato dei mezzi necessari per la sopravvivenza e il benessere.
4. **Sicurezza e Privacy dei Dati:**
    
    - Garantire la sicurezza e la riservatezza dei dati relativi alle risorse e alle attività all'interno di ciascuna Base. Ciò comporta l'implementazione di robuste misure di sicurezza informatica per proteggere tali informazioni da accessi non autorizzati o minacce esterne.
    
## Utenti
1. Amministratori delle Basi:
	- Profilo: Responsabili della gestione delle risorse all'interno di una Base. Hanno accesso completo al sistema e sono responsabili della supervisione delle attività e delle risorse all'interno della loro giurisdizione.
	- Obiettivi/bisogni: Monitorare e gestire efficacemente le risorse all'interno della propria Base, garantendo un'allocazione equa e adeguata in base alle necessità della popolazione.
	
1. Cittadini
	- Profilo: Sono individui che vivono all'interno delle Basi e dipendono dalle risorse e dalla gestione delle autorità per la loro sopravvivenza e il loro benessere. Possono essere lavoratori, anziani, bambini.
	- Obiettivi/bisogni: I cittadini cercano di accedere a risorse vitali come cibo, acqua, medicinali e alloggi sicuri per sé stessi e per le loro famiglie. Desiderano un ambiente sicuro e protetto in cui vivere, con accesso equo e adeguato alle risorse necessarie per soddisfare i bisogni di base. 
# Parte 2: Raccolta e analisi dei requisiti

## Documentazione Esistente e Fonti

Le fonti documentali esistenti sulla preparazione e la risposta alle emergenze includono una varietà di testi, rapporti e manuali sviluppati da organizzazioni internazionali, governi e istituzioni accademiche. Tra queste:

1. **Manuale di Gestione delle Crisi delle Nazioni Unite (UNHCR)**: Fornisce linee guida dettagliate sulla risposta umanitaria in situazioni di conflitto e disastri naturali. Include protocolli per la distribuzione di aiuti, la gestione dei campi profughi e la cooperazione tra diverse agenzie.
    
2. **Linee Guida della Croce Rossa Internazionale (ICRC)**: Questo documento offre strategie per la protezione dei civili, l'assistenza sanitaria d'emergenza e la ricostruzione post-conflitto. Si concentra anche sulla formazione del personale di soccorso e sulla logistica delle operazioni.
    
3. **Rapporti del Global Peace Index**: Questi rapporti analizzano le cause dei conflitti e forniscono raccomandazioni per la costruzione della pace e la prevenzione dei conflitti futuri. Sono utilizzati per pianificare interventi e sviluppare politiche di sicurezza.
    
4. **Linee Guida per la Ricostruzione Post-Bellica del World Bank**: Fornisce indicazioni su come gestire le risorse economiche per la ricostruzione delle infrastrutture, il ripristino dei servizi pubblici e la promozione dello sviluppo economico sostenibile.
    
#### Fonti di Piani di Emerge

Dopo la Terza Guerra Mondiale, l'elaborazione di piani di emergenza è essenziale per assicurare la sopravvivenza e il benessere della popolazione. Questi piani dovrebbero essere basati su principi di resilienza, sostenibilità e inclusività. Le principali fonti di ispirazione includono:

1. **Piani di Contingenza Nazionali**: Ogni nazione deve sviluppare un piano di emergenza che includa scenari di crisi specifici, strategie di evacuazione, punti di raccolta per i civili, e canali di comunicazione per le emergenze. Questi piani devono essere aggiornati regolarmente e testati attraverso esercitazioni.
    
2. **Protocolli di Emergenza delle Agenzie Umanitarie**: Organizzazioni come il World Food Programme (WFP) e l'Organizzazione Mondiale della Sanità (OMS) dispongono di protocolli standardizzati per la distribuzione di cibo, acqua e medicinali. Questi protocolli sono cruciali per garantire una risposta rapida ed efficiente.
    
3. **Modelli di Governance Locale**: Le autorità locali devono essere preparate a gestire la crisi a livello comunitario. Questo include la formazione di squadre di pronto intervento, la creazione di rifugi temporanei e la gestione delle risorse locali.
    
4. **Tecnologie di Comunicazione e Informazione**: L'uso di tecnologie avanzate come i droni per la consegna di beni di prima necessità, e sistemi di comunicazione satellitare per coordinare le operazioni di soccorso può migliorare significativamente l'efficacia della risposta.
    

#### Assistenza alla Popolazione

La popolazione colpita dalla guerra necessita di supporto immediato e di lungo termine. Le principali forme di assistenza includono:

1. **Distribuzione di Beni di Prima Necessità**: Cibo, acqua potabile, medicinali e kit di primo soccorso devono essere distribuiti rapidamente e in maniera equa. Le razioni devono essere sufficienti per soddisfare le necessità quotidiane di ogni individuo.
    
2. **Assistenza Medica e Psicologica**: Le strutture sanitarie devono essere ricostruite e potenziate per affrontare le emergenze sanitarie. Inoltre, è cruciale fornire supporto psicologico per affrontare i traumi causati dalla guerra.
    
3. **Programmi di Ricostruzione e Sviluppo Economico**: Creare opportunità di lavoro attraverso progetti di ricostruzione può aiutare a rilanciare l'economia locale. Questo include la riparazione di infrastrutture, la riattivazione delle scuole e la promozione di attività agricole sostenibili.
    
4. **Educazione e Sensibilizzazione**: Campagne di educazione su come comportarsi durante e dopo un'emergenza possono salvare vite. Informare la popolazione su come accedere ai servizi di assistenza e su come contribuire alla ricostruzione è essenziale per una ripresa efficace.
#### Bunker
I bunker sono strutture progettate per offrire protezione contro minacce esterne, come attacchi militari, disastri naturali e radiazioni. La loro costruzione e funzionamento richiedono una combinazione di tecnologie avanzate, materiali robusti e sistemi di supporto vitali per garantire la sopravvivenza degli occupanti. 


I bunker sono realizzati con materiali altamente resistenti, come cemento armato, acciaio e, in alcuni casi, piombo per protezione dalle radiazioni. Le pareti sono spesse e progettate per resistere a esplosioni, penetrazione di proiettili e onde d'urto. La struttura di base di un bunker include:

1. **Struttura Esterna**: Composta da strati di cemento armato e acciaio per fornire resistenza contro esplosioni e penetrazione.
2. **Struttura Interna**: Pannelli divisori interni per compartimentare lo spazio e creare aree funzionali come dormitori, cucine, bagni e aree di stoccaggio.

Per garantire la sopravvivenza degli occupanti, i bunker sono dotati di vari sistemi di supporto vitali:

1. **Filtrazione dell'Aria**: Sistemi di filtrazione avanzati che purificano l'aria da agenti chimici, biologici e radioattivi. Include filtri HEPA e filtri a carboni attivi.
2. **Acqua e Cibo**: Serbatoi d'acqua e scorte di cibo non deperibile sufficienti per un lungo periodo. Sistemi di purificazione dell'acqua per garantire la potabilità.
3. **Energia**: Generatori a combustibile, pannelli solari e batterie di riserva per fornire energia elettrica. Sistemi di illuminazione a LED per ridurre il consumo energetico.
4. **Gestione dei Rifiuti**: Sistemi di trattamento dei rifiuti umani e solidi per mantenere l'igiene e prevenire malattie. Include inceneritori e compattatori.

La capacità di comunicare con l'esterno è fondamentale per la sicurezza e il coordinamento. I bunker sono equipaggiati con:

1. **Radio a Onde Corte**: Per le comunicazioni a lungo raggio, soprattutto in assenza di infrastrutture di telecomunicazione funzionanti.
2. **Internet Satellitare**: Connessioni satellitari per accedere a informazioni e coordinare con altre unità di soccorso.
3. **Linee Telefoniche Protette**: Collegamenti telefonici sicuri per comunicazioni urgenti e riservate.

Il mantenimento operativo del bunker richiede una preparazione e manutenzione costante:

1. **Controlli Regolari**: Ispezioni periodiche dei sistemi di filtrazione, dei generatori e delle scorte di cibo e acqua.
2. **Addestramento degli Occupanti**: Formazione su come utilizzare i sistemi del bunker, procedure di emergenza e tecniche di primo soccorso.
3. **Aggiornamento delle Risorse**: Rifornimento regolare delle scorte e aggiornamento dei sistemi tecnologici per mantenere la funzionalità e la sicurezza.

## Elenco dei requisiti

Si intende sviluppare un sistema di gestione di database destinato a un contesto post terza guerra mondiale, concepito per monitorare e gestire informazioni rilevanti per la sopravvivenza e il benessere dei sopravvissuti. L'ambito di questo sistema si focalizza sulle Basi autonome, individuate da un codice univoco, che costituiscono entità territoriali autonome. Al fine di identificarle, si considereranno la loro ubicazione geografica, il nome e la capacità di ospitare cittadini. Per ciascuna di queste Basi, si intende archiviare una serie di dati, tra cui: il tipo di materiali prodotti , la gestione delle risorse, il livello di radiazioni, il numero di residenti e le loro professioni, nonché lo stato delle abitazioni disponibili e occupate, con eventuali informazioni sugli occupanti. Inoltre, si prevede di monitorare le infrastrutture dedicate alla produzione di risorse specifiche, tenendo traccia del compito svolto, delle risorse generate, delle materie prime utilizzate e del personale impiegato.

Parallelamente, si intende conservare informazioni riguardanti normative e leggi da rispettare da parte degli abitanti, inclusi eventuali piani di emergenza. La formalizzazione e l'organizzazione di tali dati mirano a garantire la stabilità e il funzionamento ordinato della società, fornendo una struttura gestionale solida e adeguata al contesto post-bellico.

## Glossario


| Termini            | Descrizione                                                                                                            | Sinonimi                                     |
| ------------------ | ---------------------------------------------------------------------------------------------------------------------- | -------------------------------------------- |
| Sopravvissuti      | Persone sopravvissute alla guerra                                                                                      | Cittadini,residenti                          |
| Basi               | Sistema che gestisce una parte del territorio                                                                          | Stato,Governo,paese.nazione                  |
| Risorse            | Ciò che è utile o disponibile per soddisfare un bisogno                                                                | Cibo,Acqua, medicine, Beni                   |
| Abitazioni         | Luogo dove si va per riposarsi                                                                                         | Casa, appartamento                           |
| Infrastrutture     | Insieme delle strutture fisiche dei servizi                                                                            | Impianti                                     |
| Materie prime      | Le "materie prime" sono sostanze grezze o materiali di base che vengono utilizzati nella produzione di beni e servizi. | Materiali grezzi, materiali di base          |
| Normative          | Insiemi di regole, direttive o disposizioni che regolano il comportamento                                              | Leggi, norme                                 |
| Piani di emergenza | Procedure o strategie predefinite messe in atto per affrontare situazioni di crisi                                     | Protocolli di sicurezza,Piani di evacuazione |
| Professioni        | Occupazioni o attività svolte da persone che hanno acquisito un certo grado di competenza                              | Mestiere, impieghi, occupazioni              |
| Servizi            | I servizi sono attività o prestazioni offerte dalla base per soddisfare specifiche esigenze della popolazione          | Prestazioni,Funzioni                         |
| Infrastrutture     | Insieme di strutture fisiche necessarie per il funzionamento di una società                                            | Strutture,Impianti                           |
| Tribunale          | istituzione pubblica dove vengono amministrati la giustizia e il diritto                                               | Aula di giudizio                             |
## Schema Entity Relationship (ER)

![[ER.jpeg]]

## Individuazione ed elenco delle operazioni sui dati per la realizzazione delle funzioni 

- Operazioni sulla **Base**:
	- Op1: Stabilire la posizione 
	- Op2:
- Operazini sul **Magazzino**
	- Op:
- Operazioni sulle **Risorse**
	- Op:
- Operazini sulle **Persone**
	- Op:
- Operazini sulle **Leggi**
	- Op:
- Operazini sulle **Infrastrutture**
	- Op:
- Operazini sui **Servizi**
	- Op:
## Dimensionamento dei dati e analisi del carico applicativo, in termini di volume e frequenza delle operazioni

| Nome           | Tipologia | Dimension |
| -------------- | --------- | --------- |
| Base           | Entità    |           |
| Leggi          | Entità    |           |
| Persone        | Entità    |           |
| Magazzino      | Entità    |           |
| Risorse        | Entità    |           |
| Servizi        | Entità    |           |
| Infrastrutture | Entità    |           |
| Scuola         | Entità    |           |
| Ospedale       | Entità    |           |
| Tiribunale     | Entità    |           |
| Centali        | Entità    |           |
| Fattorie       | Entità    |           |
| Produce        | Relazione |           |
| Lavorano       | Relazione |           |
| Possiede       | Relazione |           |
| Offre          | Relazione |           |
| Stoccaggio     | Relazione |           |
| Accoglie       | Relazione |           |
| Gestisce       | Relazione |           |
| Instaura       | Relazione |           |
| Rispettano     | Relazione |           |
| Interpreta     | Relazione |           |

## Specifiche , assunzioni e vincoli di integrità
- In ogni base deve esseci un magazzino dove poter riporre le risorse che quella base produce
- Ogni base deve avere almeno un ospedale e una scuola per garantire la sicurezza e l'istruzione della popolazione
- È necessario che ogni persona che abbia compiuto 18 anni abbia almeno un lavoro
- Le infrastutture possno serire più basi 
- Ogni Base ha la possibilità di stabile le proprie leggi  
