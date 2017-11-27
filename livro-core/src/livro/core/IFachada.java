package livro.core;

import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;

public interface IFachada {
	
	public Resultado salvar(EntidadeDominio entidade);
	public Resultado alterar(EntidadeDominio entidade);
	public Resultado excluir(EntidadeDominio entidade);
	public Resultado consultar(EntidadeDominio entidade);
	public Resultado visualizar(EntidadeDominio entidade);
	public Resultado logar(EntidadeDominio entidade);
	public Resultado comprar(EntidadeDominio entidade);
	public Resultado aplicar(EntidadeDominio entidade);

}
