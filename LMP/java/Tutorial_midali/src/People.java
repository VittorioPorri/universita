public class People {
    private String nome;
    private String cognome;

    People(String nome, String cognome){
        this.nome = nome;
        this.cognome = cognome;
    }

    People(People persona){
        this.setNome(persona.getNome());
        this.setCognome(persona.getCognome());
    }

    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public void copy(People persona){
        this.setNome(persona.getNome());
        this.setCognome(persona.getCognome());

    }
}