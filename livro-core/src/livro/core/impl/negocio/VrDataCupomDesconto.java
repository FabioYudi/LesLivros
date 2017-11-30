package livro.core.impl.negocio;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import livro.core.IStrategy;
import livro.core.aplicacao.Resultado;
import livro.core.impl.dao.CupomDAO;
import livro.core.util.ConverteDate;
import livro.dominio.CupomDesconto;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class VrDataCupomDesconto implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		CupomDesconto c = (CupomDesconto) entidade;
		List<EntidadeDominio> entidades = null;
		if (c.getCupom() != null) {
			CupomDAO dao = new CupomDAO();
			try {
				
				entidades = dao.consultar(entidade);
				entidades.add(entidade);
				for (int i = 0; i < entidades.size(); i++) {
					CupomDesconto cu = (CupomDesconto) entidades.get(i);
					System.out.println("valor" + cu.getValor());
					System.out.println("data exp" + cu.getDtExpiracao());
					if (c.getCupom() == cu.getCupom()) {
						System.out.println("OI PIRANHA TO NO FI");
						Calendar ca = Calendar.getInstance();
						Date dt = ca.getTime();
						
						if(c.getDtExpiracao().before(dt)) {
							return "Cupom Expirado";
							
						}else {
						
							return null;
						}

					}

				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			
			
			

			
		}
		return null;

	}
}
