package livro.core.impl.negocio;

import livro.core.IStrategy;
import livro.core.util.ConfirmarADM;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class AlterarStatusTransporte implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		Pedido p = (Pedido) entidade;

		if (ConfirmarADM.getAdm() == true) {

			if (p.getStatus().trim().equals("APROVADA")) {
				p.setStatus("TRANSPORTE");
				return null;
			}

			return "Ocorreu um erro na mudança de status";
		}
		return null;
	}

}
