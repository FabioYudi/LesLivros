package livro.core.impl.negocio;

import livro.core.IStrategy;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class vrQuantidadeCupom implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		Pedido p = new Pedido();
		if(p.getCupom() != null) {
			return "N�o � poss�vel aplicar mais de um cupom";
		}
		return null;
	}

}