package semana.oito;

//Aluno: Pedro Rodrigues Bandeira da Rocha
//Questão 1 - Load Balancing Server

public class Principal {

	public static void main(String[] args) {
		
		LoadBalancer load = new LoadBalancer();
		
		Usuario user1 = new Usuario(load, 1);
		Usuario user2 = new Usuario(load, 2);
		Usuario user3 = new Usuario(load, 3);
		Usuario user4 = new Usuario(load, 4);
		Usuario user5 = new Usuario(load, 5);
		Usuario user6 = new Usuario(load, 6);
		Usuario user7 = new Usuario(load, 7);
		Usuario user8 = new Usuario(load, 8);
		Usuario user9 = new Usuario(load, 9);
		Usuario user10 = new Usuario(load, 10);
		Usuario user11 = new Usuario(load, 11);
		Usuario user12 = new Usuario(load, 12);
		Usuario user13 = new Usuario(load, 13);
		Usuario user14 = new Usuario(load, 14);
		Usuario user15 = new Usuario(load, 15);
		Usuario user16 = new Usuario(load, 16);
		Usuario user17 = new Usuario(load, 17);
		Usuario user18 = new Usuario(load, 18);
		Usuario user19 = new Usuario(load, 19);
		Usuario user20 = new Usuario(load, 20);
		
		user1.start();
		user2.start();
		user3.start();
		user4.start();
		user5.start();
		user6.start();
		user7.start();
		user8.start();
		user9.start();
		user10.start();
		user11.start();
		user12.start();
		user13.start();
		user14.start();
		user15.start();
		user16.start();
		user17.start();
		user18.start();
		user19.start();
		user20.start();
	}
}

