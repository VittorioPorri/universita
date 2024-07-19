public class Macchina extends Veicolo{
    String targa;

    Macchina(String targa){
        this.targa = targa;
    }

    @Override
    void Muovi(){
        System.out.println("la macchina frena");
    }

    @Override
    void Frena(){
        System.out.println("la macchina frena");
    }

}
