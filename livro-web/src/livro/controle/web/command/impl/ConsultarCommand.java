package livro.controle.web.command.impl;

import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;

public class ConsultarCommand extends AbstractCommand {
	
public Resultado execute(EntidadeDominio entidade) {
		
		return fachada.consultar(entidade);
	}

}
