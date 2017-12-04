package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.Cliente;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class FinalizarViewHelper  implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String operacao = request.getParameter("operacao");
		Cliente c = (Cliente) request.getSession().getAttribute("cli");
		Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
		String txtId = (String) request.getSession().getAttribute("usuarioID");
		int id = Integer.parseInt(txtId);
		
		Pedido p = map.get(id);
		Calendar ca = Calendar.getInstance();
		Date dt = ca.getTime();
		p.setDtPedido(dt);
		p.setStatus("EM PROCESSO");
		c.getPedido().add(p);
		
		
		return p;
		
		
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		Map<Integer, Pedido> mapaUsuarios = (HashMap<Integer, Pedido>)request.getSession().getAttribute("mapaUsuarios");

		RequestDispatcher d = null;
		String usuario = (String) request.getSession().getAttribute("username");

		String operacao = request.getParameter("operacao");
		
		if(operacao.equals("FINALIZAR")) {
			if(usuario != null) {
				
				System.out.println("finalizado");
				d = request.getRequestDispatcher("Final.jsp");

				
			}else {
				System.out.println("Faça login para finalizar a compra ");
				d = request.getRequestDispatcher("Carrinho.jsp");
			}
			
			if(operacao.equals("CONSULTAR")) {
				
			}
			
		}
		d.forward(request, response);

	}

}
