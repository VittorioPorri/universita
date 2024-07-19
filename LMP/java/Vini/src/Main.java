public class Main {
    public static void main(String[] args) {
        Forinitore Tos = new Forinitore("Tosrl", 1035,"Piemonte",4,10);
        Vini vino1 = new Vini("Tavernello","rosso","rosso","casa mia",2022,"corto","largo","caldo",true,10,Tos);

        System.out.println( "Il vino è disponibile: " + vino1.getDisopnibile());
        System.out.println( "In magazzino ci sono " + vino1.numBottiglie + " bottiglie");
        System.out.println("Il fornitore è :" + vino1.getFornitore());
    }
}