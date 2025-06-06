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

	// Metodo per controllare quanti giorni ha un mese specifico
	private int giorniNelMese(int mese, int anno) {
		switch (mese) {
		case 4:
		case 6:
		case 9:
		case 11:
			return 30;
		case 2:
			return (isBisestile(anno)) ? 29 : 28;
		default:
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
			//Nelle prossime lezioni questo diventerà una "Eccezione"
			System.out.println("Anno non valido");
		}
	}

	public void setGiorno(int g) {
		if (g > 0 && g <= giorniNelMese(this.mese, this.anno)) {
			this.giorno = g;
		} else {
			//Nelle prossime lezioni questo diventerà una "Eccezione"
			System.out.println("Giorno non valido per il mese e l'anno specificati");
		}
	}

	public void setMese(int m) {
		if (m > 0 && m <= 12) {
			this.mese = m;
		} else {
			//Nelle prossime lezioni questo diventerà una "Eccezione"
			System.out.println("Mese non valido");
		}
	}

	// Metodo per stampare la data
	public String toString() {
		return String.format("%02d/%02d/%d", getGiorno(), getMese(), getAnno());
	}
}
