package semana.oito;


public class LoadBalancer {
	private Servidor server1;
	private Servidor server2;
	
	
	public LoadBalancer() {
		server1 = new Servidor();
		server2 = new Servidor();
	}
	
	public void divide(int id) throws InterruptedException {
		Thread.sleep(5000);
		
		if(id > 10) {
			server1.requisicao("Servidor 1", id);
		} else {
			server2.requisicao("Servidor 2", id);
		}
	}
}
