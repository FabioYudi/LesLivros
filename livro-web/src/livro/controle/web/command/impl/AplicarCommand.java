package livro.controle.web.command.impl;

import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;

public class AplicarCommand extends AbstractCommand{

	@Override
	public Resultado execute(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return fachada.aplicar(entidade);
	}

}
