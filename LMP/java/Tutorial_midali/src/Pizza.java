public class Pizza {

    String impasto;
    String salsa;
    String formaggio;
    String extra;

    Pizza(String impasto){
        this.impasto = impasto;
    }

    Pizza(String impasto,String salsa){
        this.impasto = impasto;
        this.salsa = salsa;
    }

    Pizza(String impasto, String salsa, String formaggio, String extra){
        this.impasto = impasto;
        this.salsa = salsa;
        this.formaggio = formaggio;
        this.extra = extra;
    }
}
