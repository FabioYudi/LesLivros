package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.ArrayList;
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
			cupom = new CupomDesconto();
			
			cupom.setCupom(numCupom);
			cupom.setValor(Double.parseDouble(valor));
			return cupom;
			
			
		}
		
		if(operacao.equals("APLICAR")) {
			String codigo = request.getParameter("txtCup");
			CupomDesconto c = new CupomDesconto();
			System.out.println(request.getParameter("txtCup"));
			c.setCupom(codigo);
			return c;
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

					d = request.getRequestDispatcher("Carrinho.jsp");
					break;
				}else {
					resultado.setMsg("Cupom inválido");
					d = request.getRequestDispatcher("Carrinho.jsp");


				}
				
				
			}
			
		}

		d.forward(request, response);
	}

}
