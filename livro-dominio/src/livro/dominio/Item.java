package livro.dominio;

public class Item extends EntidadeDominio{
	
	private Livros livro;

	public Livros getLivro() {
		return livro;
	}

	public void setLivro(Livros livro) {
		this.livro = livro;
	}

}
