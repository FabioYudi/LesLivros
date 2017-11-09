package livro.controle.web.command.impl;

import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;

public class LogarCommand extends AbstractCommand {
	
public Resultado execute(EntidadeDominio entidade) {
		
		return fachada.logar(entidade);
	}

}
