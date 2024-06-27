public class Persona {
    String nome ;
    String cognome;
    int eta ;
    String colore_preferito;

    Persona(String nome, String cognome, int eta , String colore_preferito){
        // viene chiamato ogni volta che si crea una nuova persona

        // this viene utilizzato per identificare una istanza della classe
        this.nome = nome;
        this.cognome  = cognome;
        this.eta = eta;
        this.colore_preferito = colore_preferito;
    }

}
