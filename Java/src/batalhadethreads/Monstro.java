package batalhadethreads;

import java.util.concurrent.Semaphore;
import java.lang.Math;

public class Monstro {
	private int vida;
	private int exit;
	private Semaphore semLuta;
	
	public Monstro() {
		vida = 4000;
		semLuta = new Semaphore(1);
		exit = 0;
	}
	
	public int damage(int dano, int user) throws InterruptedException {
		Thread.sleep((long)(Math.random()*500));
		if(exit == 1) {
			return 0;
		}
		try {
			semLuta.acquire();
		} catch (InterruptedException e) {
			System.out.println("InterruptedException caught");
		}
		
		
		vida = vida - dano;
		
		if(vida < (4000 * 0.3)) {
			//Valores altos deixam o inimigo muito forte kkkkk
			int heal = (int)(Math.random()*40);
			vida += heal;
			System.out.println("\nBenção demoníaca!\nCriatura curou "+ heal +" pontos de vida. :(\n");
		}
		
		if(vida > 0) {
			System.out.println("\nJogador "+ user +" deu "+ dano +" de dano.");
			System.out.println("Vida do monstro: " + vida);
			semLuta.release();
			
			return dano;
		}
		else {
			System.out.println("\nJogador "+ user +" deu "+ dano +" de dano, derrotando a criatura!");
			System.out.println("Vida do monstro: " + 0);
			exit = 1;
			
			return (dano - Math.abs(vida));
		}
		
	}
	
	public int getVida() {
		return vida;
	}
}
