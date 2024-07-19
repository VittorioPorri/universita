public class Vini {
    String nome;
    String colore;
    String coloreBacca;
    String cantina;
    int annoDiImbottigliamento;
    String persistenza;
    String acidità;
    String equilibrio;
    boolean disponibile;
    int numBottiglie;
    Forinitore fornitore;



    Vini(String nome, String colore, String coloreBacca, String cantina, int annoDiImbottigliamento, String persistenza, String acidità, String equilibrio,boolean disponibile,int numBottiglie,Forinitore fornitore) {
        if(colore.equals("rosso") || colore.equals("rosé")){
            if(!coloreBacca.equals("rosso")){
                throw new IllegalArgumentException("La bacca deve essere di colore Rosso");
            }
        }
        this.nome = nome;
        this.colore = colore;
        this.coloreBacca = coloreBacca;
        this.cantina = cantina;
        this.annoDiImbottigliamento = annoDiImbottigliamento;
        this.persistenza = persistenza;
        this.acidità = acidità;
        this.equilibrio = equilibrio;
        this.disponibile = disponibile;
        this.numBottiglie = numBottiglie;
        this.fornitore = fornitore;
    }

    public boolean getDisopnibile(){
        return this.disponibile;
    }

    public Forinitore getFornitore(){
        return this.fornitore;
    }
}
