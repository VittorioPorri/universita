public class ArchivioPrestiti{
    private ArrayList<Prestiti> prestiti;

    public ArchivioPrestiti() {
        this.prestiti = new ArrayList<>();
    }

    public void aggiungiPrestito(Prestiti prestito) {
        this.prestiti.add(prestito);
    }

    public void rimuoviPrestito(Prestiti prestito) {
        this.prestiti.remove(prestito);
    }
     
    public ArrayList<Prestiti> getPrestiti() {
        return prestiti;
    }

    public int periodoPiuLungoPrestito() {
        int maxPeriodo = 0;
        for (Prestiti prestito : prestiti) {
            int periodo = prestito.getDataFinePrestito().differenzaGiorni(prestito.getDataInizioPrestito());
            if (periodo > maxPeriodo) {
                maxPeriodo = periodo;
            }
        }
        return maxPeriodo;
    }

    public boolean verificaInconsistenze() {
        for (Prestiti prestito : prestiti) {
            if (prestito.getDataFinePrestito().differenzaGiorni(prestito.getDataInizioPrestito()) < 0) {
                return true; 
            }
        }
        return false;
    }
    
}