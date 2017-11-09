package livro.controle.web.command.impl;

import livro.controle.web.command.ICommand;
import livro.core.IFachada;
import livro.core.impl.controle.Fachada;

public abstract class AbstractCommand implements ICommand {
	
	protected IFachada fachada = new Fachada();

}
