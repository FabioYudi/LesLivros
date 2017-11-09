package livro.core;

import livro.dominio.EntidadeDominio;

public interface IStrategy {
	public String processar(EntidadeDominio entidade);

}
