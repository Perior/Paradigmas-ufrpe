package gameTest;

import java.util.concurrent.Semaphore;
import java.util.concurrent.ThreadLocalRandom;

public class Equipe extends Thread{
	private Jam jam;
	private String name;
	private int gameCount;
	private Semaphore semGdd;
	private Semaphore semDev;
	volatile static boolean winCon = false;
	private int numJogos;
	
	public Equipe(Jam jam, String name) {
		this.jam = jam;
		this.name = name;
		gameCount = 0;
		semGdd = new Semaphore(2);
		semDev = new Semaphore(0);
		numJogos = 0;
	}
	
	public boolean winner() {
		gameCount = numJogos;
		return winCon;
	}
	
	public int getGameCount() {
		return gameCount;
	}
	
	public int getNumJogos() {
		return numJogos;
	}
	
	public String getNameString() {
		return name;
	}
	
	public void produzGdd() throws InterruptedException {
		if(winCon) {
			return;
		}
		semGdd.acquire();
		Thread.sleep(ThreadLocalRandom.current().nextInt(500, 2001));
		semDev.release();
		
	}
	
	public void makeGame() throws InterruptedException {
		if(winCon) {
			semGdd.release();
			return;
		}else {
			semDev.acquire();
			Thread.sleep(ThreadLocalRandom.current().nextInt(500, 3001));
			if(winCon) {
				semGdd.release();
				return;
			}
			++numJogos;
			System.out.println("Jogos de " + name + ": " + numJogos);
			if(numJogos == 10) {
				winCon = true;
			}
			semGdd.release();
		}
	}
	
	@Override
	public void run() {
		try {
			jam.startJam(this);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
