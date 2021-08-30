package semana.oito;

public class Usuario extends Thread {
	private LoadBalancer load;
	private int id;
	
	public Usuario (LoadBalancer load, int id) {
		this.load = load;
		this.id = id;
	}

	public void run() {
		while (true) {
			try {
				load.divide(id);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
