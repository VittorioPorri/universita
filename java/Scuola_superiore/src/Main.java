public class Main {
    public static void main(String[] args) {
        Classe classeA = new Classe("A", 2005, 2024);

        Studenti studente1 = new Studenti(2004, "Roma", "Mario", "Rossi", 2022);
        Studenti studente2 = new Studenti(2006, "Milano", "Luca", "Bianchi", 2022);
        Studenti studente3 = new Studenti(2003, "Napoli", "Anna", "Verdi", 2022);

        classeA.Aggiungi_studente(studente1);
        classeA.Aggiungi_studente(studente2);
        classeA.Aggiungi_studente(studente3);

        int num = classeA.Numero_studenti();
        System.out.println("Il numero degli studenti è " + num);

        Studenti[] ripetenti = classeA.ripetenti();

        System.out.println("Studenti ripetenti: ");
        for (Studenti studente : ripetenti) {
            if (studente == null) {
                System.out.println("Non ci sono più studenti ripetenti");
                break;
            } else {
                System.out.println(studente.nome + " " + studente.cognome);
            }
        }
    }
}