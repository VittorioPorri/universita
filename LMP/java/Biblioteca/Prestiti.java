public class Prestiti{
    private Prodotto prodotto;
    private Data dataInizioPrestito;
    private Data dataFinePrestito;
    private Data riconsengaEffettiva;
    private String nomeUtente;
    private String cognomeUtente;
    private double costoAffitto;

    public Prestiti(Prodotto prodotto, Data dataInizioPrestito, Data dataFinePrestito, String nomeUtente, String cognomeUtente, double costoAffitto) {
        this.prodotto = prodotto;
        this.dataInizioPrestito = dataInizioPrestito;
        this.dataFinePrestito = dataFinePrestito;
        this.nomeUtente = nomeUtente;
        this.cognomeUtente = cognomeUtente;
        this.costoAffitto = costoAffitto;
    }

    public setDataRiconsengaEffettiva(Data riconsengaEffettiva) {
        this.riconsegaEffettiva = riconsengaEffettiva;
    }

    
    
}