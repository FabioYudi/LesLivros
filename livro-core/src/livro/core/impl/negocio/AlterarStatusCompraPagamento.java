package livro.core.impl.negocio;

import livro.core.IStrategy;
import livro.core.util.OperadoraCartao;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class AlterarStatusCompraPagamento implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		Pedido p = (Pedido)entidade;
		String retorno = OperadoraCartao.validar();
		if(retorno == null) {
			p.setStatus("REPROVADA");
			return null;
		}else {
			p.setStatus("APROVADA");
			return null;
		}
	}

}
