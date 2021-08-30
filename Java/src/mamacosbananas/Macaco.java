package mamacosbananas;

public class Macaco extends Thread{
	private Bananeira bananeira;
	private int idMacaco;
	private int tempoEspera;
	
	public Macaco(Bananeira bananeira, int idMacaco) {
		this.bananeira = bananeira;
		this.idMacaco = idMacaco;
		tempoEspera = 0;
	}
	
	public int getIdMacaco() {
		return idMacaco;
	}
	
	public int getTempoEspera() {
		return tempoEspera;
	}
	
	public void TempoEspera(int tempo) {
		tempoEspera += tempo;
	}
	
	@Override
	public void run() {
		while(bananeira.getBanana() > 0 || bananeira.getTotalSize() < 100) {
			try {
				bananeira.consumir(idMacaco);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
	}
}
