public class Main {
    public static void main(String[] args) {
        
        Libro libro = new Libro("Il nome della rosa", "Bompiani", 1980, 500);
        DVD dvd = new DVD("Inception", "Warner Bros", 2010, 148);

        
        Data inizio = new Data(1, 6, 2024);
        Data fine = new Data(15, 6, 2024);

       
        Prestiti prestitoLibro = new Prestiti(libro, inizio, fine, "Mario", "Rossi", 2.5);

       
        ArchivioPrestiti archivio = new ArchivioPrestiti();
        archivio.aggiungiPrestito(prestitoLibro);

        
        System.out.println("Periodo più lungo di prestito: " + archivio.periodoPiuLungoPrestito() + " giorni");
    }   
}