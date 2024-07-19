public class LiberoProfessionista extends Person {
    String professione;
    String partitaIVA;

    public LiberoProfessionista(String nome, String cognome, int anno, int mese, int giorno, String codiceFiscale, String professione, String partitaIVA) {
        super(nome, cognome, anno, mese, giorno, codiceFiscale);
        this.professione = professione;
        this.partitaIVA = partitaIVA;
    }
}
