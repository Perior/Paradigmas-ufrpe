package gameTest;

import java.util.ArrayList;

public class Jam {
	private ArrayList<Equipe> eqList;
	
	public Jam() {
		eqList = new ArrayList<Equipe>();
	}
	
	public ArrayList<Equipe> getEqList() {
		return eqList;
	}
	
	public void startJam(Equipe equipe) throws InterruptedException {
		Desenvolvedor dev = new Desenvolvedor(equipe);
		Designer des = new Designer(equipe);
		
		dev.start();
		des.start();
		
		dev.join();
		des.join();
		
		eqList.add(equipe);
	}
}
