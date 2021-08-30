package mamacosbananas;

public class Producao extends Thread{
	private Bananeira bananeira;
	
	public Producao(Bananeira bananeira) {
		this.bananeira = bananeira;
	}
	
	@Override
	public void run() {
		while(bananeira.getTotalSize() < 100) {
			try {
				bananeira.produzir(5);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}
