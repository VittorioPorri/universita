/*
 *   import java.util.Scanner;
 */

import java.util.ArrayList;

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

      -> Metodi 
    */

    }
}
