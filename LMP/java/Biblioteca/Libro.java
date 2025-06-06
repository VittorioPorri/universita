public class Libro extends Prodotto {
    private int pagine; 

    public Libro(String titolo, String casaEditrice, int annoPubblicazione, int pagine) {
        super(titolo, casaEditrice, annoPubblicazione);
        this.pagine = pagine;
    }

    public int getPagine() {
        return pagine;
    }
}