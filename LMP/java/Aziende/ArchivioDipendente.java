import java.util.Map;
import java.util.HashMap;

public class ArchivioDipendente {
    private Map<String,Dipendente> archivio;
    
    public ArchivioDipendente() {
        this.archivio = new HashMap<Dipendente>();
    }

    public void aggiungiDipendente(Dipendente dipendente) {
        if (dipendente != null){
            System.out.println("Per aggiungere un dipendete devi specificarlo");
        }else if(!archivio.containsKey(dipendente.getMatricola())) { 
            System.out.println("La chiave del dipendente è gia presente");
        } else {
            archivio.put(dipendente.getMatricola(), dipendente);
        }
    }

    public void rimuoviDipendente(String matricola) {
        if (archivio.containsKey(matricola)) {
            archivio.remove(matricola);
        } else {
            System.out.println("Il dipendente con la matricola non esiste.");
        }
    }

    public Dipendente getSostituto(Dipendente dipendente){
        mansione = dipendente.getMansione();
        capoDiretto = dipartimento.getCapoDiretto();

        for (Dipendente d : archivio.values()) {
            if (d.getMansione().equals(mansione) && d.getCapoDiretto().equals(capoDiretto)) {
                return d;
            }
        }
    }

    public ArrayList<Dipendente> match(int mase, int anno ,String dipartimento) {
        ArrayList<Dipendente> assunzioniMeseAnno = new ArrayList<>();
        for (Dipendente d : archivio.values()){
            if(d.dataAssunzione.mese == mese && d.dataAssunzione.anno = anno 
                && d.dipartimento.equals(dipartimento)){
                assunzioniMeseAnno.add(d);
            }
        }
        return assunzioniMeseAnno;        
    }
}
