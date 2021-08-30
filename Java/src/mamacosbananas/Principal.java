package mamacosbananas;

public class Principal {
	
	public static void main(String[] args) {
		Bananeira bananeira = new Bananeira(50);
		Macaco macacoCaco = new Macaco(bananeira, 1);
		Macaco macacoPaco = new Macaco(bananeira, 2);
		Macaco macacoRodrigo = new Macaco(bananeira, 3);
		Producao producao = new Producao(bananeira);
		
		macacoPaco.start();
		macacoCaco.start();
		macacoRodrigo.start();
		producao.start();
	}

}
