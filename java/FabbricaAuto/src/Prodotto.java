import java.util.ArrayList;

public class Prodotto {
    private String identificativo;
    private String etichetta;
    private double costoProduzione;
    private double prezzoAcquirenti;
    private ArrayList<Componenti> componenti;
    private double numComponeti;
    private double tempoTotStimatoPerOrdine;


    public Prodotto(String identificativo, String etichetta, double costoProduzione, double prezzoAcquirenti) {
        this.identificativo = identificativo;
        this.etichetta = etichetta;
        this.costoProduzione = costoProduzione;
        this.prezzoAcquirenti = prezzoAcquirenti;
        this.componenti = new ArrayList<Componenti>();
        this.numComponeti = 0;
        this.tempoTotStimatoPerOrdine = 0;
    }

    public double calcoloTempoOrdine(ArrayList<Componenti> componenti){
        double tempo = 0;

        for(Componenti componente : componenti){
            if(componente.getTempiDiOrdine() > tempo){
                tempo = componente.getTempiDiOrdine();
            }
        }
        return  tempo;
    }

    public void addComponeti(Componenti componente){
        componenti.add(componente);
        numComponeti++;
        tempoTotStimatoPerOrdine = calcoloTempoOrdine(componenti);
    }

    public double prezzoAlPubblico(){
        for(Componenti componenti : componenti){
            
        }
    }


}
