public class Grappe {
    String nome;
    String tipo;
    String botte;
    String cantina;
    int tempoInBotte;
    boolean disponibile;
    int numBottiglie;
    Forinitore fornitore;



    Grappe(String nome, String tipo, String botte, String cantina, int tempoInBotte) {
        if (tipo.equals("barricata") || tipo.equals("invecchiata")) {
            if (tempoInBotte < 12) {
                throw new IllegalArgumentException("La bottiglia deve invecchiare almeno 12 mesi");
            }
        } else if (tipo.equals("riserva") && tempoInBotte < 18) {
            throw new IllegalArgumentException("La bottiglia deve invecchiare almeno 18 mesi");
        }

        this.nome = nome;
        this.tipo = tipo;
        this.botte = botte;
        this.cantina = cantina;
        this.tempoInBotte = tempoInBotte;
    }

    public boolean getDisopnibile(){
        return this.disponibile;
    }

    public Forinitore getFornitore(){
        return this.fornitore;
    }


}
