public class Forinitore {
    String denominazione;
    int pIVA;
    String regione;
    int tempoDiOrdine;
    int prezzoPerBottiglia;

    Forinitore(String denominazione, int pIVA, String regione, int tempoDiOrdinazione, int prezzoPerBottiglia) {
        this.denominazione = denominazione;
        this.pIVA = pIVA;
        this.regione = regione;
        this.tempoDiOrdine = tempoDiOrdinazione;
        this.prezzoPerBottiglia = prezzoPerBottiglia;
    }

    @Override
    public String toString() {
        return "[denominazione=" + denominazione + ", partitaIVA=" + pIVA + ", regione=" + regione
                + ", tempoDiOrdinazione=" + tempoDiOrdine + " giorni, prezzoPerBottiglia=" + prezzoPerBottiglia + " euro]";
    }

}
