package livro.controle.web.vh.impl;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.core.util.ConsultaEntidades;
import livro.core.util.ConverteDate;
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

			cupom = new CupomDesconto();
			cupom.setDtExpiracao(ConverteDate.converteStringDate(data));
			cupom.setCupom(numCupom.toUpperCase());
			cupom.setValor(Double.parseDouble(valor));
			return cupom;

		}

		if (operacao.equals("APLICAR")) {
			String codigo = request.getParameter("txtCup");
			CupomDesconto c = new CupomDesconto();
			c.setCupom(codigo.toUpperCase());
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
		if (operacao.equals("SALVAR")) {

			request.getSession().setAttribute("resultadoCupom", resultado);
			d = request.getRequestDispatcher("Painel.jsp");

		}
		if (operacao.equals("APLICAR")) {

			if (resultado.getMsg() == null) {
				CupomDesconto cupom = ConsultaEntidades.getCupom();
				request.getSession().setAttribute("cupom", cupom);
				request.getSession().setAttribute("resultadoCupom", resultado);
				d = request.getRequestDispatcher("Carrinho.jsp");

			}
		}
		if (resultado.getMsg() != null) {
			request.getSession().removeAttribute("cupom");
			request.getSession().setAttribute("resultadoCupom", resultado);
			d = request.getRequestDispatcher("Carrinho.jsp");
		}

		d.forward(request, response);
	}

}
