package livro.controle.web.vh.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;

public class PedidoViewHelper implements IViewHelper{

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		RequestDispatcher d = null;
		
		String operacao = request.getParameter("operacao");
		
		if(operacao.equals("CONSULTARPEDIDO")){
			request.getSession().setAttribute("resultadoConsultaPedido", resultado);
			d= request.getRequestDispatcher("Painel.jsp");  
		}

		d.forward(request, response);

	}
	

}
