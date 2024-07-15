import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        List<Sportivo> sportivi  = new ArrayList<Sportivo>();


        Allenatore allenatore1 = new Allenatore("Luca","Rossi","20-01-2020",4);
        sportivi.add(allenatore1);
        Allenatore allenatore2 = new Allenatore("Marco","Verdi","25-07-2023",3);
        sportivi.add(allenatore2);
        Preparatore_Atletico preparatore1 = new Preparatore_Atletico("Aldo","Marrone","25-07-2023",2);
        sportivi.add(preparatore1);
        Medico mededico1 = new Medico("Luigi","Azzurro","01-05-2022",2);
        sportivi.add(mededico1);
        Giocatore giocatore1 = new Giocatore("Marco","Giallo","04-05-2024",5);
        giocatore1.aggiungiReti(1,4);
        giocatore1.aggiungiReti(3,3);
        giocatore1.aggiungiReti(4,4);

        sportivi.add(giocatore1);
        Giocatore giocatore2 = new Giocatore("Alassio","Verdi","04-04-2024",4);
        giocatore2.aggiungiReti(2,3);
        giocatore2.aggiungiReti(5,2);
        giocatore2.aggiungiReti(9,1);
        sportivi.add(giocatore2);

        int N = 4;
        System.out.println("Giocatori idonei al bonus:");
        for (Sportivo sportivo : sportivi) {
            if (sportivo instanceof Giocatore) {
                Giocatore giocatore = (Giocatore) sportivo;

                if (giocatore.getLivelloStipendio() >= 3) {
                    double[] retiPerMese = giocatore.getRetiPerMese();
                    int mesiConNreti = 0;
                    for (double reti : retiPerMese) {
                        if (reti >= N) {
                            mesiConNreti++;
                        }
                    }

                    if (mesiConNreti > 0) {
                        System.out.println(giocatore.getNome() + " " + giocatore.getCognome() + " ha segnato almeno " + N + " reti in " + mesiConNreti + " mesi");
                    }
                }
            }
        }


        System.out.println();

        System.out.println("Sportivi assunti nello stesso mese e anno:");
        for (int i = 0; i < sportivi.size(); i++) {
            for (int j = i + 1; j < sportivi.size(); j++) {
                String[] date1 = sportivi.get(i).getDataAssunzione().split("-");
                String[] date2 = sportivi.get(j).getDataAssunzione().split("-");
                if (date1[0].equals(date2[0]) && date1[1].equals(date2[1])) {
                    System.out.println(sportivi.get(i).getNome() + " " + sportivi.get(i).getCognome() + " e " + sportivi.get(j).getNome() + " " + sportivi.get(j).getCognome() + " assunti nello stesso mese e anno");
                }
            }
        }
    }
}