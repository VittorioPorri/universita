public class Insegnante extends Persona{
    // introduciamo extends Persona per creare l'ederitarietà

    String materia;


    Insegnante(String nome, String cognome, int eta, String colore_preferito,String materia) {
        super(nome, cognome, eta, colore_preferito); // ci affidiamo alla classe da cui deriviamo
        this.materia = materia;
    }
}
