import java.util.HashMap;

public class Main {
    public static void main(String[] args) {
        HashMap<String, Person> persone = new HashMap<>();

        String tipo = "LiberoProfessionista";
        Person p = null;

        switch (tipo) {
            case "LiberoProfessionista":
                p = new LiberoProfessionista("Luigi", "Verdi", 1975, 4, 15, "VRDGLG75D15H501B", "Avvocato", "IT12345678901");
                break;
            case "Impiegato":
                p = new Impiegato("Mario", "Rossi", 1985, 5, 20, "RSSMRA85M20H501Z", "12345", "Senior", "Ingegnere");
                break;
            default:
                p = new Disoccupato("Anna", "Bianchi", 1990, 3, 10, "BNCHNN90C50H501C", "Registro001");
                break;
        }

        persone.put(p.codiceFiscale, p);

    }
}
