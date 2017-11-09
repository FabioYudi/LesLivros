package livro.dominio;

import java.util.List;

public class Categoria extends EntidadeDominio {
	private String nome;
	private List<Subcategoria> subcategoria;
	
	public Categoria(){
		
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<Subcategoria> getSubcategoria() {
		return subcategoria;
	}

	public void setSubcategoria(List<Subcategoria> subcategoria) {
		this.subcategoria = subcategoria;
	}
	
	

}
