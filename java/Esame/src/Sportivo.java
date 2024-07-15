public class Sportivo {
    private String nome;
    private String cognome;
    private String dataAssunzione;
    private int livelloStipendio;
    private String numIscrizione;
    private int numeroIscrizione = 0;

    public Sportivo(String nome,String cognome,String dataAssunzione, int livelloStipendio){
        this.nome = nome;
        this.cognome = cognome;
        this.dataAssunzione = dataAssunzione;
        this.livelloStipendio = livelloStipendio;
        this.numIscrizione = "TEAM_<" + String.valueOf(numeroIscrizione++) +">";

    }

    public String getNome() {
        return nome;
    }

    public String getCognome() {
        return cognome;
    }

    public String getDataAssunzione() {
        return dataAssunzione;
    }

    public int getLivelloStipendio() {
        return livelloStipendio;
    }

    public String getNumIscrizione() {
        return numIscrizione;
    }



    public void setNome(String nome) {
        this.nome = nome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public void setDataAssunzione(String dataAssunzione) {
        this.dataAssunzione = dataAssunzione;
    }

    public void setLivelloStipendio(int livelloStipendio) {
        this.livelloStipendio = livelloStipendio;
    }


    public void setNumIscrizione(String numIscrizione) {
        this.numIscrizione = numIscrizione;
    }

}
