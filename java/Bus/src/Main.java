import java.util.HashMap;
import java.util.NavigableMap;

public class Main {
    public static void main(String[] args) {
        HashMap<String, Tratta> biglietti = new HashMap<String, Tratta>();

        // Inserisci le tratte nella mappa
        biglietti.put("Roma-Firenze-naz-blu", new Tratta(200, "naz-blu", "tutti", "Roma-Firenze"));
        biglietti.put("Roma-Firenze-naz-grigio", new Tratta(200, "naz-grigio", "tutti", "Roma-Firenze"));
        biglietti.put("Roma-Pisa-normale", new Tratta(220, "naz-blu", "normale", "Roma-Pisa"));
        biglietti.put("Roma-Pisa-comfort", new Tratta(220, "naz-blu", "comfort", "Roma-Pisa"));
        biglietti.put("Firenze-Pisa-comfort", new Tratta(50, "reg-blu", "comfort", "Firenze-Pisa"));
        biglietti.put("Firenze-Pisa-deluxe", new Tratta(50, "reg-blu", "delux", "Firenze-Pisa"));
        biglietti.put("Firenze-Bologna-reg-blu", new Tratta(60, "reg-blu", "tutti", "Firenze-Bologna"));
        biglietti.put("Firenze-Bologna-naz-blu", new Tratta(60, "naz-blu", "tutti", "Firenze-Bologna"));
        biglietti.put("Roma-Ancona-reg-blu", new Tratta(200, "reg-blu", "normale", "Roma-Ancona"));
        biglietti.put("Roma-Ancona-reg-grigio", new Tratta(200, "reg-grigio", "normale", "Roma-Ancona"));
        biglietti.put("Roma-Pescara-reg-blu", new Tratta(150, "reg-blu", "normale", "Roma-Pescara"));
        biglietti.put("Roma-Pescara-reg-grigio", new Tratta(150, "reg-grigio", "normale", "Roma-Pescara"));
        biglietti.put("Roma-Napoli", new Tratta(170, "naz-blu", "normale", "Roma-Napoli"));
        biglietti.put("Napoli-Foggia-reg-blu", new Tratta(80, "reg-blu", "normale", "Napoli-Foggia"));
        biglietti.put("Napoli-Foggia-reg-grigio", new Tratta(80, "reg-grigio", "normale", "Napoli-Foggia"));
        biglietti.put("Napoli-Foggia-comfort", new Tratta(80, "reg-blu", "comfort", "Napoli-Foggia"));
        biglietti.put("Foggia-Pescara", new Tratta(100, "reg-blu", "normale", "Foggia-Pescara"));

        System.out.println(biglietti.get("Roma-Firenze-naz-blu"));
        System.out.println(biglietti.get("Roma-Firenze-naz-grigio"));



    }
}