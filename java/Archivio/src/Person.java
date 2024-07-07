import java.time.LocalDate;

public class Person {
    String nome;
    String cognome;
    LocalDate dataDiNascita;
    String codiceFiscale;

    public Person(String nome, String cognome, int anno, int mese, int giorno, String codiceFiscale) {
        if (anno < 1900) {
            throw new IllegalArgumentException("L'anno di nascita non può essere inferiore al 1900");
        }
        this.nome = nome;
        this.cognome = cognome;
        this.dataDiNascita = LocalDate.of(anno, mese, giorno);
        this.codiceFiscale = codiceFiscale;
    }
}