public class Persona {
    String nome ;
    String cognome;
    int eta ;
    String colore_preferito;
    static int num_perosne;

    Persona(String nome, String cognome, int eta , String colore_preferito){
        // viene chiamato ogni volta che si crea una nuova persona

        // this viene utilizzato per identificare una istanza della classe
        this.nome = nome;
        this.cognome  = cognome;
        this.eta = eta;
        this.colore_preferito = colore_preferito;
        num_perosne++;
    }
    public String toString(){
        String stringa = this.nome +"\n"+ this.cognome+"\n"+this.eta +"\n"+ this.colore_preferito;
        return stringa;
    }

    void Saluta(Persona persona){
        System.out.println("ciao " + persona.nome + " io sono " + this.nome);
    }

    static void numero_di_persone(){
        System.out.println(num_perosne);
    }

}
