public class Data {
	private int giorno;
	private int mese;
	private int anno;

	// Costruttore che chiama i setter
	public Data(int giorno, int mese, int anno) {
		setAnno(anno);
		setMese(mese);
		setGiorno(giorno);
	}

	public int getAnno() {
		return anno;
	}

	public int getGiorno() {
		return giorno;
	}

	public int getMese() {
		return mese;
	}

	
	private int giorniNelMese(int mese, int anno) {
    if (mese == 2) {
        return isBisestile(anno) ? 29 : 28;
    } else if (mese == 4 || mese == 6 || mese == 9 || mese == 11) {
        return 30;
    } else {
        return 31;
    }
}

	// Metodo per verificare se un anno è bisestile
	private boolean isBisestile(int anno) {
		return (anno % 4 == 0 && anno % 100 != 0) || (anno % 400 == 0);
	}

	public void setAnno(int a) {
		if (a >= 1970 && a <= 2030) {
			this.anno = a;
		} else {
			System.out.println("Anno non valido");
		}
	}

	public void setGiorno(int g) {
		if (g > 0 && g <= giorniNelMese(this.mese, this.anno)) {
			this.giorno = g;
		} else {
			System.out.println("Giorno non valido per il mese e l'anno specificati");
		}
	}

	public void setMese(int m) {
		if (m > 0 && m <= 12) {
			this.mese = m;
		} else {
			System.out.println("Mese non valido");
		}
	}

	private int giorniDal_1-1-1970(){
		int giorni = 0;

		for (int i = 1970; i < this.anno; i++) {
			giorni += isBisestile(i) ? 366 : 365;
		}

		for (int i = 1; i < this.mese; i++) {
			giorni += giorniNelMese(i, this.anno);
		}

		giorni += this.giorno;

		return giorni;
	}


	public int differenzaGiorni(Data d) {
		return Math.abs(this.giorniDal_1-1-1970() - d.giorniDal_1-1-1970());
	}
	
	public String toString() {
		return String.format("%02d/%02d/%d", getGiorno(), getMese(), getAnno());
	}
}
