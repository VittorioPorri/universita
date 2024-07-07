public class Disoccupato extends Person {
    String iscrizioneRegistroDisoccupazione;

    public Disoccupato(String nome, String cognome, int anno, int mese, int giorno, String codiceFiscale, String iscrizioneRegistroDisoccupazione) {
        super(nome, cognome, anno, mese, giorno, codiceFiscale);
        this.iscrizioneRegistroDisoccupazione = iscrizioneRegistroDisoccupazione;
    }
}
