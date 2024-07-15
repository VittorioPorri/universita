public class Tratta {
    double lunghezza;
    String codiceTipologiaTratta;
    String MezziDisponibili;
    String stazioneInizialeFinale;
    double costoTratta;


    Tratta(double lunghezza, String codiceTipologiaTratta, String MezziDisponibili, String stazioneInizialeFinale) {
        this.lunghezza = lunghezza;
        this.codiceTipologiaTratta = codiceTipologiaTratta;
        this.MezziDisponibili = MezziDisponibili;
        this.stazioneInizialeFinale = stazioneInizialeFinale;
        this.costoTratta = calcoloPrezzo();
    }

    public double calcoloPrezzo(){
        if(codiceTipologiaTratta.equals("naz-blu")){
            if(MezziDisponibili.equals("comfort")){
                return this.costoTratta = 1.3 * this.lunghezza * 0.10;
            } else if(MezziDisponibili.equals("delux")){
                return this.costoTratta = 1.7 * this.lunghezza * 0.10;
            } else if(MezziDisponibili.equals("normal")) {
                return this.costoTratta = this.lunghezza * 0.10;
            }
        } else if(codiceTipologiaTratta.equals("naz-grigio")){
            if(MezziDisponibili.equals("comfort")){
                return this.costoTratta = 1.3 * this.lunghezza * 0.15;
            } else if(MezziDisponibili.equals("delux")){
                return this.costoTratta = 1.7 * this.lunghezza * 0.15;
            } else if(MezziDisponibili.equals("normal")) {
                return this.costoTratta = this.lunghezza * 0.15;
            }
        } else if(codiceTipologiaTratta.equals("reg-grigio")){
            if(MezziDisponibili.equals("comfort")){
                return this.costoTratta = 1.3 * this.lunghezza * 0.10;
            } else if(MezziDisponibili.equals("delux")){
                return this.costoTratta = 1.7 * this.lunghezza * 0.10;
            } else if(MezziDisponibili.equals("normal")) {
                return this.costoTratta = this.lunghezza * 0.10;
            }
        } else if(codiceTipologiaTratta.equals("reg-blu")){
            if(MezziDisponibili.equals("comfort")){
                return this.costoTratta = 1.3 * this.lunghezza * 0.08;
            } else if(MezziDisponibili.equals("delux")){
                return this.costoTratta = 1.7 * this.lunghezza * 0.08;
            } else if(MezziDisponibili.equals("normal")) {
                return this.costoTratta = this.lunghezza * 0.08;
            }
        }
        return 0;
    }

    @Override
    public String toString() {
        return "Tratta{" +
                "lunghezza=" + lunghezza +
                ", codiceTipologiaTratta='" + codiceTipologiaTratta + '\'' +
                ", MezziDisponibili='" + MezziDisponibili + '\'' +
                ", stazioneInizialeFinale='" + stazioneInizialeFinale + '\'' +
                ", costoTratta=" + costoTratta +
                '}';
    }



}
