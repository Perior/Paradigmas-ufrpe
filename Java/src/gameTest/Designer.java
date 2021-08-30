package gameTest;

public class Designer extends Thread{
	private Equipe equipe;
	
	public Designer(Equipe equipe) {
		this.equipe = equipe;
	}
	
	@Override
	public void run() {
		while(!equipe.winner()) {
			try {
				equipe.produzGdd();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
