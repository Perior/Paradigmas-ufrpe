package gameTest;

public class Main {
	
	public static void main(String[] args) throws InterruptedException {
		
		Jam jam = new Jam();
		
		Equipe astroNets = new Equipe(jam, "AstroNets");
		Equipe mamacoLoko = new Equipe(jam, "MamacoLoko");
		Equipe dreigui = new Equipe(jam, "Dreigui");
		Equipe devion = new Equipe(jam, "Devion");
		Equipe guilerme = new Equipe(jam, "GUIlerme");
		
		astroNets.start();
		mamacoLoko.start();
		dreigui.start();
		devion.start();
		guilerme.start();
		
		astroNets.join();
		mamacoLoko.join();
		dreigui.join();
		devion.join();
		guilerme.join();
		
		
		jam.getEqList().sort((o1, o2) -> Integer.compare(o2.getGameCount(), o1.getGameCount()));
		
		
		System.out.println("\n\n================RANKING EQUIPES GAMEJAM================\n");
		
		for(Equipe eq : jam.getEqList()) {
			System.out.println(eq.getNameString() + " " + eq.getNumJogos());
		}
		
		
	}

}
