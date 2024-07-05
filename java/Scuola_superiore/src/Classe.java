public class Classe extends Scuola{
    int Anno_di_nascita;
    int Anno_di_corso;
    Studenti[] studenti;
    int Num_Studenti = 0;


    Classe(String sezione,int Anno_di_nascita,int Anno_di_corso) {
        super(sezione);
        this.Anno_di_nascita = Anno_di_nascita;
        this.Anno_di_corso = Anno_di_corso;
        this.studenti = new Studenti[Num_Studenti];
    }

    public void Aggiungi_studente(Studenti studente) {
        if (Num_Studenti < studenti.length) {
            studenti[Num_Studenti] = studente;
        } else {
            Studenti[] nuovoArrayStudenti = new Studenti[studenti.length + 1];
            System.arraycopy(studenti, 0, nuovoArrayStudenti, 0, studenti.length);
            nuovoArrayStudenti[studenti.length] = studente;
            studenti = nuovoArrayStudenti;
        }
        Num_Studenti++;
    }


    public Studenti[] ripetenti(){
       Studenti[] ripetenti = new Studenti[Num_Studenti];
       int j=0;
        System.out.println(Anno_di_nascita);
        for (Studenti studente : studenti) {
            System.out.println(studente.Anno_di_nascita);
            if (studente.Anno_di_nascita < Anno_di_nascita) {
                ripetenti[j] = studente;
                j++;
            }
        }
       return ripetenti;
    }

    public int Numero_studenti(){
        return Num_Studenti;
    }


}
