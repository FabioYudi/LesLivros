package livro.core.impl.negocio;

import javax.servlet.RequestDispatcher;

import livro.core.IStrategy;
import livro.dominio.EntidadeDominio;
import livro.dominio.Livros;

public class vrDadosObrigatoriosLivro implements IStrategy {
	
	@Override
	public String processar(EntidadeDominio entidade) {
		
		if(entidade instanceof Livros){
			Livros livro = (Livros)entidade;
			
			String codigoLivro = livro.getCodigoLivro();
			String autor = livro.getAutor();
			String  ano = livro.getAno();
			Boolean status = livro.getStatus();
			String titulo = livro.getTitulo();
			String editora = livro.getEditora();
			String edicao = livro.getEdicao();
			String isbn = livro.getIsbn();
			String numPaginas = livro.getNumPg();
			String sinopse = livro.getSinopse();
			double altura = livro.getAltura();
			double peso = livro.getPeso();
			double profundidade = livro.getProfundidade();
			
			if(codigoLivro == null || autor == null || ano==null || status == null || titulo == null   || editora == null  ||
					edicao == null || isbn == null || numPaginas == null || sinopse == null || altura == 0   ||  peso == 0 ||
					profundidade == 0){
				return "Codigo do livro, autor, ano, status, titulo, editora, "
						+ "edição, ISBN, numero de paginas, sinopse, altura, peso"
						+ " e profundidade são de preenchimento obrigatório!";
				
		   
			}
			
			if(codigoLivro.trim().equals("") || autor.trim().equals("") || 
					ano.trim().equals("")|| titulo.trim().equals("") || editora.trim().equals("")
					|| edicao.trim().equals("") || isbn.trim().equals("") || numPaginas.trim().equals("") ||
					sinopse.trim().equals("")){
				return "Codigo do livro, autor, ano, status, titulo, editora, "
						+ "edição, ISBN, numero de paginas, sinopse, altura, peso"
						+ " e profundidade são de preenchimento obrigatório!";
			}
			
		}else{
			return "Deve ser registrado um Livro!";
		}
		
		
		return null;
	}

}
