package livro.core.impl.negocio;

import livro.core.IStrategy;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class vrQuantidadeCupom implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		Pedido p = new Pedido();
		System.out.println("Strategy do cupom");
		if(p.getCupom() != null) {
			System.out.println("STRATEGY DO CUPOM DENTRO DO IF");
			return "Não é possível aplicar mais de um cupom";
		}
		return null;
	}

}
