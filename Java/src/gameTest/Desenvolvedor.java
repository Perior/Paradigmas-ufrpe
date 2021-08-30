package gameTest;

public class Desenvolvedor extends Thread{
	private Equipe equipe;
	
	public Desenvolvedor(Equipe equipe) {
		this.equipe = equipe;
	}
	
	
	@Override
	public void run() {
		while(!equipe.winner()) {
			try {
				equipe.makeGame();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
