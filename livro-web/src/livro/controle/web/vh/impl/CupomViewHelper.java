package livro.controle.web.vh.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.Cliente;
import livro.dominio.CupomDesconto;
import livro.dominio.Endereco;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class CupomViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String stringId = (String) request.getSession().getAttribute("usuarioID");
		String operacao = request.getParameter("operacao");
		CupomDesconto cupom = null;
		if (operacao.equals("SALVAR")) {
			String numCupom = request.getParameter("txtNumCupom");
			String valor = request.getParameter("txtValor");
			String data = request.getParameter("txtData");
			SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
			Date dataExpiracao = null;
			try {
				dataExpiracao = formato.parse(data);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			cupom = new CupomDesconto();
			cupom.setDtExpiracao(dataExpiracao);
			cupom.setCupom(numCupom);
			cupom.setValor(Double.parseDouble(valor));
			return cupom;
			
			
		}
		
		if(operacao.equals("APLICAR")) {
			String codigo = request.getParameter("txtCup");
			System.out.println(codigo);
			Pedido p = new Pedido();
			CupomDesconto c = new CupomDesconto();
			p.setCupom(cupom);
			c.setCupom(codigo);
			return p;
		}
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		RequestDispatcher d = null;
		
		String operacao = request.getParameter("operacao");
		if(operacao.equals("SALVAR")) {
			
			request.getSession().setAttribute("resultadoCupom", resultado);
			d = request.getRequestDispatcher("Painel.jsp");
			
		}
		if(operacao.equals("APLICAR")) {

			
			List<EntidadeDominio> entidades = resultado.getEntidades();
			for (int i = 0; i < entidades.size(); i++) {
				CupomDesconto cupom = (CupomDesconto) entidades.get(i);
				if(request.getParameter("txtCup").trim().equals(cupom.getCupom()))
				{
					HttpSession sessao = request.getSession();
					sessao.setAttribute("cupom", cupom);
					request.getSession().setAttribute("resultado", resultado);
					d = request.getRequestDispatcher("Carrinho.jsp");
					break;
				}else {
					request.getSession().setAttribute("resultado", resultado);
					d = request.getRequestDispatcher("Carrinho.jsp");


				}
				
				
			}
			
		}

		d.forward(request, response);
	}

}
