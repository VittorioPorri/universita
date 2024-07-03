public class Studente extends Persona{
    // introduciamo extends Persona per creare l'ederitarietà

    String materia_preferita;
    String classe;

    Studente(String nome, String cognome, int eta, String colore_preferito,String materia_preferita,String classe) {
        super(nome, cognome, eta, colore_preferito); // facciamo riferimeto alla classe da cui deriviamo
        this.materia_preferita = materia_preferita;
        this.classe = classe;
    }

    //importante quando si sovrasrive un metodo scrivere
    @Override
    void Saluta(Persona persona) {
        System.out.println( "Buongiono prof " + persona.nome );
    }
}
