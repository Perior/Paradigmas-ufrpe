package batalhadethreads;

//Aluno: Pedro Rodrigues Bandeira da Rocha
//Questão 2 - Monstros & Guerreiros

import java.util.Arrays;

public class Battlefield {
	
	
	public static void main(String[] args) throws InterruptedException {
		Monstro monstro = new Monstro();
		Personagem p1 = new Personagem(monstro, 1);
		Personagem p2 = new Personagem(monstro, 2);
		Personagem p3 = new Personagem(monstro, 3);
		Personagem p4 = new Personagem(monstro, 4);
		Personagem p5 = new Personagem(monstro, 5);
		
		monstro.damage(0,0);
		p1.start();
		p2.start();
		p3.start();
		p4.start();
		p5.start();
		
		p1.join();
		p2.join();
		p3.join();
		p4.join();
		p5.join();
		
		int[] array = new int[] {p1.getTotalDamage(), p2.getTotalDamage(), p3.getTotalDamage(),
								 p4.getTotalDamage(), p5.getTotalDamage()};
		
		Arrays.sort(array);
		
		if(p1.getTotalDamage() == array[0]) {
			System.out.println("Jogador que menos deu dano durante a batalha: "+ p1.getUser() +". Dando "+ p1.getTotalDamage() +" de dano.");
		} else if (p2.getTotalDamage() == array[0]) {
			System.out.println("Jogador que menos deu dano durante a batalha: "+ p2.getUser() +". Dando "+ p2.getTotalDamage() +" de dano.");
		} else if (p3.getTotalDamage() == array[0]) {
			System.out.println("Jogador que menos deu dano durante a batalha: "+ p3.getUser() +". Dando "+ p3.getTotalDamage() +" de dano.");
		} else if (p4.getTotalDamage() == array[0]) {
			System.out.println("Jogador que menos deu dano durante a batalha: "+ p4.getUser() +". Dando "+ p4.getTotalDamage() +" de dano.");
		} else if (p5.getTotalDamage() == array[0]) {
			System.out.println("Jogador que menos deu dano durante a batalha: "+ p5.getUser() +". Dando "+ p5.getTotalDamage() +" de dano.");
		}
		
		
		if(p1.getTotalDamage() == array[4]) {
			System.out.println("Jogador que mais deu dano durante a batalha: "+ p1.getUser() +". Dando "+ p1.getTotalDamage() +" de dano.");
		} else if (p2.getTotalDamage() == array[4]) {
			System.out.println("Jogador que mais deu dano durante a batalha: "+ p2.getUser() +". Dando "+ p2.getTotalDamage() +" de dano.");
		} else if (p3.getTotalDamage() == array[4]) {
			System.out.println("Jogador que mais deu dano durante a batalha: "+ p3.getUser() +". Dando "+ p3.getTotalDamage() +" de dano.");
		} else if (p4.getTotalDamage() == array[4]) {
			System.out.println("Jogador que mais deu dano durante a batalha: "+ p4.getUser() +". Dando "+ p4.getTotalDamage() +" de dano.");
		} else if (p5.getTotalDamage() == array[4]) {
			System.out.println("Jogador que mais deu dano durante a batalha: "+ p5.getUser() +". Dando "+ p5.getTotalDamage() +" de dano.");
		}
	}
}
