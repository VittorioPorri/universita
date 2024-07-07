public class Impiegato extends Person {
    String matricola;
    String livello;
    String mansione;

    public Impiegato(String nome, String cognome, int anno, int mese, int giorno, String codiceFiscale, String matricola, String livello, String mansione) {
        super(nome, cognome, anno, mese, giorno, codiceFiscale);
        this.matricola = matricola;
        this.livello = livello;
        this.mansione = mansione;
    }
}