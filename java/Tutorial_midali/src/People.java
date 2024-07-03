public class People {

    private String nome;
    private String cognome;

    People(String nome, String cognome){
        this.nome = nome;
        this.cognome = cognome;
    }

    // accediamo al nome da dentro la classe e buttiamo fuori il nome attraverso il metodo public
    public String getNome(){
        return nome;
    }

    public String getCognome(){
        return cognome;
    }

    // impostiamo il nome da dentro la classe
    public void setNome(String nome){
        this.nome = nome;
    }

    public void setCognome(String cognome){
        this.cognome = cognome;
    }
}
