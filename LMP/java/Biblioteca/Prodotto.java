public class Prodotto {
    private String titolo;
    private String casaEditrice;
    private int annoPubblicazione;

    public Prodotto(String titolo, String casaEditrice, int annoPubblicazione) {
        this.titolo = titolo;
        this.casaEditrice = casaEditrice;
        this.annoPubblicazione = annoPubblicazione;
    }
    
    public String getTitolo() {
        return titolo;
    }
    public String getCasaEditrice() {
        return casaEditrice;
    }
    public int getAnnoPubblicazione() {
        return annoPubblicazione;
    }