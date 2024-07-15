public class Giocatore extends Sportivo{
    private double[] retiPerMese;

    public Giocatore(String nome, String cognome, String dataAssunzione, int livelloStipendio) {
        super(nome,cognome,dataAssunzione,livelloStipendio);
        this.retiPerMese = new double[13];
    }

    public void aggiungiReti(int mese, double reti) {
        if (mese > 0 && mese <13) {
            retiPerMese[mese] = reti;
        }
    }

    public double[] getRetiPerMese() {
        return retiPerMese;
    }

}

