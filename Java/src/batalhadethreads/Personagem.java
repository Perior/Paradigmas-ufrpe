package batalhadethreads;

import java.util.concurrent.ThreadLocalRandom;

public class Personagem extends Thread{
	private Monstro monstro;
	private int user;
	private int danoTotal;
	
	public Personagem(Monstro monstro, int user) {
		this.monstro = monstro;
		this.user = user;
		danoTotal = 0;
	}
	
	public int getUser() {
		return user;
	}
	
	public void totalDamage(int dano) {
		danoTotal += dano;
	}
	
	public int getTotalDamage() {
		return danoTotal;
	}
	
	
	@Override
	public void run() {
		int dano;
		while (monstro.getVida() > 0) {
			try {
				switch(user) {
				case 1: 
					dano = ThreadLocalRandom.current().nextInt(20, 25 + 1);
					break;
				case 2:
					dano = ThreadLocalRandom.current().nextInt(15, 40 + 1);
					break;
				case 3:
					dano = ThreadLocalRandom.current().nextInt(20, 55 + 1);
					break;
				case 4:
					dano = ThreadLocalRandom.current().nextInt(23, 48 + 1);
					break;
				case 5:
					dano = ThreadLocalRandom.current().nextInt(12, 80 + 1);
					break;
				default:
					dano = 0;
					break;
				}
				
				
				totalDamage(monstro.damage(dano, user));
				
					
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
