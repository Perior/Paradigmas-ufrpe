package mamacosbananas;

import java.util.concurrent.Semaphore;

public class Bananeira {
	private int banana;
	private Semaphore semCon;
	private Semaphore semProd;
	private int totalSize;
	
	public Bananeira (int banana) {
		this.banana = banana;
		semCon = new Semaphore(2);
		semProd = new Semaphore(0);
		this.totalSize = 50;
	}
	
	public int getTotalSize() {
		return this.totalSize;
	}
	
	public int getBanana() {
		return this.banana;
	}
	
	
	public void consumir (int idMacaco) throws InterruptedException {
		System.out.println("Numero de bananas: "+this.banana);
		if(!semCon.tryAcquire()) {
			Thread.sleep(2000);
			System.out.println("\nO Macaco "+ idMacaco + " não conseguiu subir na bananeira.\n");
		} else {
			Thread.sleep(500);
			semCon.release();
			Thread.sleep(500);
			
			if(banana == 0) {
				semProd.release();
				System.out.println("\nO Macaco " + idMacaco + " não encontrou bananas :[\n");
			}
			System.out.println("O Macaco " + idMacaco + " comeu uma banana :]");
			banana--;
			
		}
		
		//System.out.println("Numero de releases: "+semCon.availablePermits());
	}
	
	public void produzir (int banana) throws InterruptedException {
		Thread.sleep(1000);
		semProd.acquire();
		this.banana += banana;
		this.totalSize += banana;
		
		if(this.banana < 50) {
			semProd.release();
		}
		
		//System.out.println("\nProduzi mais " + banana + " e agora tenho: " + this.banana + " \nTOTAL: " + this.totalSize + "\n");
	}
}
