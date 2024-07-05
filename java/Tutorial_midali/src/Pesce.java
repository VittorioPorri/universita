public class Pesce implements Preda,Predatore{


    @Override
    public void Scappa() {
        System.out.println("Il pesce piccolo scappa da quelli più grossi");
    }

    @Override
    public void Caccia() {
        System.out.println("Il pesce grosso attacca quelli più piccoli");
    }
}
