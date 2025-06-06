public class DVD extends Prodotto {
    private int durata; 

    public DVD(String titolo, String casaEditrice, int annoPubblicazione, int durata) {
        super(titolo, casaEditrice, annoPubblicazione);
        this.durata = durata;
    }

    public int getDurata() {
        return durata;
    }
}