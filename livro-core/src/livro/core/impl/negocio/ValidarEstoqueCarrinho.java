package livro.core.impl.negocio;

import livro.core.IStrategy;
import livro.dominio.EntidadeDominio;
import livro.dominio.Item;
import livro.dominio.Livros;

public class ValidarEstoqueCarrinho implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		Item itemCarrinho = (Item)entidade;
		Livros l = itemCarrinho.getLivro();
		System.out.println("OI LUMAS TO NO STRATEGY");
		if(l.getEstoque() == 0)
		{
			return "Este livro não está disponível no momento";
		}
		if(itemCarrinho.getQuantidade() >= l.getEstoque())
		{
			return "Não há mais livros disponíveis no estoque";
		}
		return null;
	}

}
