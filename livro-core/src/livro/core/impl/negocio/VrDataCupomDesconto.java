package livro.core.impl.negocio;

import java.util.Calendar;
import java.util.Date;

import livro.core.IStrategy;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class VrDataCupomDesconto implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		Pedido p = (Pedido)entidade;
		if(p.getCupom() != null) {
			Date dtExpiracao = p.getCupom().getDtExpiracao();
			Calendar ca = Calendar.getInstance();
			Date dt = ca.getTime();
			if(dtExpiracao.before(dt)) {
				return "Cupom Expirado";
			}
			
		}
		
		return null;
	}

}
