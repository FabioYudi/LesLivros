package livro.controle.web.command;

import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;

public interface ICommand {
	public Resultado execute(EntidadeDominio entidade);

}
