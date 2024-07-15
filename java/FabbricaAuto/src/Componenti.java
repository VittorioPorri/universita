public class Componenti {
    private String nome;
    private String provenienza;
    private double tempiDiOrdine;
    private double costo;


    public Componenti(String nome,String provenienza,double tempiDiOrdine,double costo){
        this.nome = nome;
        this.provenienza = provenienza;
        this.tempiDiOrdine = tempiDiOrdine;
        this.costo = costo;
    }

    public double getTempiDiOrdine() {
        return tempiDiOrdine;
    }
}
