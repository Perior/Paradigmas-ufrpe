package semana.oito;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Semaphore;

public class Servidor {

	private Semaphore semServ;
	private Date date;
	private SimpleDateFormat formatter;
	
	public Servidor() {
		date = new Date();
		formatter  = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
		semServ = new Semaphore(4);
	}
	
	public synchronized void requisicao(String name, int user) throws InterruptedException {
		Thread.sleep(5000);
		semServ.acquire();
		
		System.out.println("Requisição feita pelo usuário "+user+". Data: "+formatter.format(date)+". Enviada pelo "+name+".\n");
		
		semServ.release();
	}	
}
