/*
 *   import java.util.Scanner;
 */



public class Main {

    public static void main(String[] args) {
    /*
      ->Stampo una stringa
        System.out.println("Vado a capo da solo grazie a println");
        System.out.print("Non vado a capo da solo ma mi serve \\n\n");

      ->Introduzione alle variabili
        int x;  // dichiarazione
        x = 3;  // assegniazione

        System.out.printf("La variabile x vale %d\n",x);

      ->Tipo di dati
         boolean   | true o fale                       | 1 bit
         byte      | -128 a 127                        | 1 byte
         short     | -32768 a 32767                    | 2 byte
         int       | -2 miliardi a 2 miliardi          | 4 byte
         long      | -9 quintilioni a 9 quintilioni    | 8 byte
         float     | numero con 6/7 cifre decimali     | 4 byte
         double    | numero con 15 cifre decimali      | 8 byte
         char      | singolo carattere ( o ASCII)      | 2 byte
         String    | sequenza di catteri              | variabile


        boolean ilBoolean = true;
        byte  ilByte = 127;
        short loShort = -32768;
        int ilInt = 2_000_000; // il carattere _ non viene stampato serve per una migliore legibilita
        long ilLong = 2_000_000_000_000L; //Importante per i long la L alla fine
        float ilFloat = 5.34561f; //Importante per il float la f alla fine
        double ilDouble = 5.214141451231231;
        char ilChar = 'f'; // per il singolo carattere si utilizzano ''
        String laString = "Hello World"; // per le stirnghe si utilizzano ""

      ->Input utente
        Importiamo import java.util.Scanner;

        Scanner scanner = new Scanner(System.in); //inizializzo lo scanner per leggere roba da stdin
        System.out.println("Quale è il tuo input");
        String input = scanner.nextLine();

        System.out.println("Questo è il tuo input: " + input);

      ->Operazioni Aritmetiche + - / * %
        int x = 10;
        int y = 2;
        int somma = x + y;
        int sottrazione = x - y;
        int divisione = x / y;
        int resto = x % y;


        System.out.println("Questa è la somma di x +y " + somma);
        somma++;
        System.out.println("Yee funziona somma++ " + somma);

      ->Classe Math
        la classe Math implemeta le maggiori funzioni matematiche

        System.out.println(Math.abs(-55));
        System.out.println(Math.min(55,70));

      ->Operatori logici
       Funzionano come in C AND == &&  OR == ||  NOT == !

      ->if, else if, else and switch
        boolean online = true;
        if(online){
            System.out.println("siamo online");
        }else if (!online){
            System.out.println("siamo offline");
        }else{
            System.out.println("non so stabilirlo");
        }

        String nome = "Luca";
        switch(nome){
            case "Luca":
                System.out.println("ciao Luca");
                break;
            case "Marco":
                System.out.println("ciao Marco");
            default:
                System.out.println("ciao chiunque tu sia");
        }

      ->While and do while
        System.out.println("while prima verifica poi stampa");
        int i = 0;
        while (i < 5){
            System.out.println(i);
            i++;
        }

        System.out.println("do-while prima stampa poi verifica");
        i = 0;
        do {
            System.out.println(i);
            i++;
        }while(i < 5);

      ->Cicli for
        for(int i = 0; i<5; i++){
            System.out.println(i);
        }

      ->Array
        int[] numeri = new int[3]; // gli array in java sono di dimensione fissata

        numeri[0] = 0;
        numeri[1] = 10;
        numeri[2] = 100;

        System.out.println(numeri.length);
        System.out.println(numeri[2]);

     ->Array multidimensionali
        String[][] cella = new String[2][2];
        for(int i = 0; i < 2; i++){
            for(int j = 0; j < 2; j++){
                cella[i][j] = "x";
            }
        }

         String[][] celle_scritte= {
                        {"x","x"},
                        {"x","x"},
                     };

     -> Metodi String
        String nome = "Leonardo";
        // introduzione hai metodi

        // equlas restituisce un boolena che può essere vero o falso
        boolean risultato = nome.equals("Leonardo");

        // lenght restituisce la lunghezza della stringa
        int risultato1 = nome.length();

        // charAt che restituisce il char alla posizione indicata partendo a contare da 0
        char risultato2 = nome.charAt(7);

        // indexOf restituisce la posizione della lettera indicata
        int risultato3 = nome.indexOf(4);

        //isEmpty verifica se la stringa è vuota
        boolean risultato4 = nome.isEmpty();

        //convertono la stringa in vari formati
        String risultato5 = nome.toUpperCase();
        String risultato6 = nome.toLowerCase();

        //trim elimina gli spazi
        String risultato7 = nome.trim();

        //replace restituisce la stringa a cui è stato sostituito un carattere
        String risultato8 = nome.replace('o','w');

      ->Wrapper classes
        // permettono di usare i dati primitivi come reference
        Boolean vero = true;
        Character carattere = 'a';
        Integer numero = 5;
        Double virgola = 3.3;
        String stringa = "bel corso";

        boolean a = true;
        char b = 'a';
        int c = 5;
        double d = 3.3;

        if(vero = a){
            System.out.println("approvo");
        }

      .> Arraylist
        Sono array ridimensionabili che accettano pero solo reference
        ArrayList<String> persone = new ArrayList<String>();

        //vengono aggiunti con indici crescenti
        persone.add("Luca");
        persone.add("Marco");
        persone.add("Anna");

        //modifica il contenuto di un indice
        persone.set(2,"Paola");

        // persone.remove(0); rimuove l'elemento in posizione 0

        // persone.clear(); rmuove tutto dalla lista

        for(int i=0; i< persone.size(); i++) {
            System.out.println(persone.get(i));
        }

        //array list bidimensinali

        ArrayList<String> classe1 = new ArrayList<String>();
        classe1.add("Marco");

        ArrayList<String> classe2 = new ArrayList<String>();
        classe2.add("Luca");

        ArrayList<ArrayList<String>> classi = new ArrayList<ArrayList<String>>();

        classi.add(classe1);
        classi.add(classe2);

        for(int i = 0; i<classi.size(); i++){
            System.out.println();
            for(int j = 0; j<classi.get(i).size(); i++){
                System.out.println(classi.get(i).get(j));
            }
        }

      ->Metodi o funzioni
        cucinaPranzo("pasta");

        //fuori dal main
        static void cucinaPranzo(String cibo){
        System.out.println("sto cucinando " + cibo);
        }
        static int addizione(int a,int b) {
        int risultato = a + b;
        return risultato;
        }

      ->Overloaded Methods
        //java ci permette di utilizzare gli stessi nomi dei metodi a patto che si cambino i il numero o il tipo di parametri
        int tot1 = addizione(10,4);
        float  tot2 = addizione(0.4f,0.7f);

        System.out.println(tot1);
        System.out.println(tot2);

        //fuori del main
         static int addizione(int a, int b){
        int tot = a - b;
        return tot;
        }

        static float addizione(float a, float b){
            float tot = a + b;
            return tot;
        }

      ->Introduzione alla programmazione ad oggetti OOP(Object Oriented Programing)

        Persona persona1 = new Persona(); //creiamo una persona, prima istanza di persona
        Persona persona2 = new Persona(); // seconda istanza della classe persona

        System.out.println(persona1.colore_preferito);
        persona1.cammina();

      ->Costruttori di classe
        // grazie al costruttore definito nella classe Persona possiamo identificare due differenti persone
        Persona persona1 = new Persona("Marco","Rossi",25,"Blu");
        Persona persona2 = new Persona("Luca","Rossi",23,"Rosso");

        System.out.println(persona1.colore_preferito);
        System.out.println(persona2.colore_preferito);

      ->scope delle variabili
        //Le variabili hanno un diversa priorità

      ->costruttori sovraccaricati (overloaded constructors)
        //java ci permette di utilizzare gli stessi nomi per i costruttori a patto che si cambino i il numero o il tipo di parametri
        Pizza pizza1 = new Pizza("integrale","pomodoro","mozzarella","ananas");
        Pizza pizza2 = new Pizza("cereali");
        Pizza pizza3 = new Pizza("integrale","pomodoro");

      ->metodo toString
        retituisce la locazione in memoria ma può essere sovrascritto
        Persona persona  = new Persona("Luca", "Rossi", 25, "blu");
        System.out.println(persona.toString());

      ->array di oggetti
        Persona[] persone = new Persona[3];

        Persona persona1 = new Persona("Luca", "Rossi", 25, "blu");
        Persona persona2 = new Persona("Marco", "Verdi", 35, "rosso");
        Persona persona3 = new Persona("Anna", "Neri", 23, "giallo");

        persone[0] = persona1;
        persone[1] = persona2;
        persone[2] = persona3;

        Persona[] persone2 = {persona1,persona2,persona3};

        System.out.println(persone);

      ->Oggetti come parametri
        Persona persona1 = new Persona("Luca", "Rossi", 25, "blu");
        Persona persona2 = new Persona("Marco", "Verdi", 35, "rosso");

        persona1.Saluta(persona2);

      ->final e static
        //final indica una variabile che non può essere modificata nel corso del programma
        final int prova = 5;
        //non puoi più fare prova = 10;

        System.out.println(prova);

        //static è una variabile condivisa tra tutte le istanze vedi nella classe Persona

        Persona persona1 = new Persona("Luca", "Rossi", 25, "blu");
        Persona persona2 = new Persona("Marco", "Verdi", 35, "rosso");
        Persona persona3 = new Persona("Anna", "Neri", 23, "giallo");

        Persona.numero_di_persone();

      ->Eridarietà
        Insegnante insegnante1 = new Insegnante("Luca","Rossi",25,"blu","storia");
        Studente studente1 = new Studente("Marco", "Verdi", 35, "rosso","storia","5D");

        //se studente estende persona ho accesso di default a tutti i metodi di persona
        studente1.Saluta(insegnante1);

      ->Classi astratte
        // classi che vengono eslusivamente ereditate dalle altre classi
        //non posso usare Veicolo veicolo = new veicolo(); per creare un oggetto di una classe astratta
        Macchina macchina = new Macchina("CC953CX");
        System.out.println(macchina.targa);
        macchina.Muovi();
        macchina.Frena();

      ->Modificatori di accesso
                          class   package subclass   word
          public          si      si      si         si
          protected       si      si      si         no
          default         si      si      no         no
          private         si      no      no         no

      ->Incapsulamento getters/setters
        People persona1 = new People("Luca","Rossi");
        //System.out.println(persona1.nome); le variabili sono private quindi abbiamo bisogno di metodi Getters/Setters

        System.out.println(persona1.getCognome());

        persona1.setCognome("Verdi");
        System.out.println(persona1.getCognome());

      ->copiare oggetti

        People persona1 = new People("Luca","Rossi");
        People persona2 = new People("Marco","Verdi");

        //persona1 = persona2;  non va bene perche diventano lo stesso oggetto situati nella stessa cella di memoria

        persona2.copy(persona1);

        System.out.println(persona1);
        System.out.println(persona2);
        System.out.println();
        System.out.println(persona1.getNome());
        System.out.println(persona1.getCognome());
        System.out.println();
        System.out.println(persona2.getNome());
        System.out.println(persona2.getCognome());
        System.out.println();

        // se modifico la persona1 la persona2 non viene influenzata dalla modifica
        persona1.setNome("Orazio");
        System.out.println(persona1.getNome());
        System.out.println(persona2.getNome());


        People persona3 = new People(persona1);
        System.out.println(persona3);
        System.out.println(persona3.getNome());
        System.out.println(persona3.getCognome());

      ->Interfaccia

        Leone leone = new Leone();
        Gazzella gazzella = new Gazzella();
        Pesce pesce = new Pesce();

        leone.Caccia();
        gazzella.Scappa();
        pesce.Scappa();
        pesce.Caccia();

      ->Polimorfismo
        è capacità di un oggetto di identificarsi con più tipi di dato

        Studente studente1 = new Studente("Luca","Rossi",12,"blu","Storia","4D");
        Insegnante insengante1 = new Insegnante("Marco","Verdi",35,"verde","Storia");

        Persona[] classe = {studente1,insengante1}; // non si generano problemi proprio per il polimofismo

      ->Gestire le exceptions
        Scanner scanner = new Scanner(System.in);
        try {
            System.out.print("Inserisci il primo numero: ");
            int x = scanner.nextInt();

            System.out.print("Inserisci il secondo numero: ");
            int y = scanner.nextInt();

            System.out.printf("la divisione è %d\n", x/y);

        }catch (ArithmeticException e){
            System.out.println("non puoi dividere per zero");
        }catch(InputMismatchException e){
            System.out.println("non puoi dividere un numero per un stringa");
        }catch(Exception e){
            System.out.println("Problema");
        }finally {
            System.out.println("Lo eseguo sempre");
            scanner.close();
        }
      ->File
        File file = new File("prova.txt");//posso inserire anche dei path

        if(file.exists()) {
            System.out.println("il file esiste");
            System.out.println(file.getAbsolutePath());
            //per eliminare il file file.delete();
        }else{
            System.out.println("il file non esiste");
        }

        //per scrivere in un file è consigliabile metterlo in un try
        try {
            FileWriter writer = new FileWriter("proca.txt");
            writer.write("Ciao sono vittorio\nsto facendo il corso di java ");
            //per aggiungere righe in un file già scritto
            writer.append("\nnuova riga");
            writer.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        //per leggere invece
        try {
            FileReader reader = new FileReader("proca.txt");
            int date = reader.read(); // valore asii del primo carattere
            while(date != -1){
                System.out.print((char)date);
                date = reader.read();
            }
            System.out.println(date);
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

      ->Casting
        int x = (int)9.5;
     */
    }

}
