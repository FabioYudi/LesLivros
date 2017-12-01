package livro.core.impl.negocio;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import livro.core.IStrategy;
import livro.core.aplicacao.Resultado;
import livro.core.impl.dao.CupomDAO;
import livro.core.util.ConsultaEntidades;
import livro.core.util.ConverteDate;
import livro.dominio.CupomDesconto;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class VrDataCupomDesconto implements IStrategy {

	@Override
	public String processar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		System.out.println("teste");
		
		CupomDesconto  cupom =  (CupomDesconto) ConsultaEntidades.consultar();
		if(cupom == null) {
			return "Cupom não existe";
			
		}else {
			Calendar ca = Calendar.getInstance();
			Date dt = ca.getTime();
			ConsultaEntidades.setCupom(cupom);
			
			if(cupom.getDtExpiracao().before(dt)) {
				return "Cupom Expirado";
				
				
			}else {
			
				return null;
			}
		}
	}
}
