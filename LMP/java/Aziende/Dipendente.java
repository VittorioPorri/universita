import java.util.Date;
import java.util.ArrayList;

public class Dipendente {
    private String nome;
    private String cognome;
    private Data dataDiNascita;
    private Data dataAssunzione;
    private String dipartimento;
    private String mansione;
    private int livello;
    private Dipendente capoDiretto;
    private String matricola = 0;

    public Dipendente(String nome, String cognome, Data dataDiNascita, 
                      Data dataAssunzione, String dipartimento, String mansione, 
                      int livello, Dipendente capoDiretto) {
        this.nome = nome;
        this.cognome = cognome;
        this.dataDiNascita = dataDiNascita;
        this.dataAssunzione = dataAssunzione;
        this.dipartimento = dipartimento;
        this.mansione = mansione;
        this.livello = livello;
        this.capoDiretto = capoDiretto;
        this.matricola = "CTL_<"+matricola+">";
        matricola++;
    }

    public String getNome() {
        return this.nome;
    }

    public String getCognome() {
        return this.cognome;
    }

    public Data getDataDiNascita() {
        return this.dataDiNascita;
    }

    public Data getDataAssunzione() {
        return this.dataAssunzione;
    }

    public String getDipartimento() {
        return this.dipartimento;
    }

    public String getMansione() {
        return this.mansione;
    }

    public int getLivello() {
        return this.livello;
    }

    public Dipendente getCapoDiretto() {
        return this.capoDiretto;
    }

    public String getMatricola() {
        return this.matricola;
    }

    public void setMatricola(String matricola) {
        if(Integer.parseInt(matricola.split("<")[1].split(">")) > this.matricola){
            this.matricola = matricola;
        }else {
            System.out.println("Matricola non valida");
        }
    }

    public void setDipartimento(String dipartimento) {
        this.dipartimento = dipartimento;
    }

    public void setMansione(String mansione) {
        this.mansione = mansione;
    }

    public void setLivello(int livello) {
        this.livello = livello;
    }

    public void setCapoDiretto(Dipendente capoDiretto) {
        this.capoDiretto = capoDiretto;
    }

    public ArrayList<Dipendente> chainOfCommand(Dipendente dipendente) {
        ArrayList<Dipendente> chain = new ArrayList<>();
        Dipendente current = dipendente.getCapoDiretto();
        
        while (current != null) {
            chain.add(current);
            current = current.getCapoDiretto();
        }
        
        return chain;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (!(obj instanceof Dipendente)) return false;
        Dipendente other = (Dipendente) obj;
        return this.matricola.equals(other.matricola);
    }

    @Override
    public String toString() {
        return "Dipendente{" +
                "nome='" + nome + '\'' +
                ", cognome='" + cognome + '\'' +
                ", dataDiNascita=" + dataDiNascita +
                ", dataAssunzione=" + dataAssunzione +
                ", dipartimento='" + dipartimento + '\'' +
                ", mansione='" + mansione + '\'' +
                ", livello=" + livello +
                ", capoDiretto=" + (capoDiretto != null ? capoDiretto.getNome() + " " + capoDiretto.getCognome() : "N/A") +
                ", matricola='" + matricola + '\'' +
                '}';
    }
    
}