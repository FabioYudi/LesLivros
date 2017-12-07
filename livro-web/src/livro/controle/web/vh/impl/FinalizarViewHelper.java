package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.ArrayList;
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
import livro.dominio.Cartao;
import livro.dominio.Cliente;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class FinalizarViewHelper  implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ArrayList<Cartao> cartoes = new ArrayList<>();
		String operacao = request.getParameter("operacao");
		Cliente c = (Cliente) request.getSession().getAttribute("cli");
		Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
		String txtId = (String) request.getSession().getAttribute("usuarioID");
		int id = Integer.parseInt(txtId);
		if(operacao.equals("FINALIZAR")) {
		Pedido p = map.get(id);
		Calendar ca = Calendar.getInstance();
		Date dt = ca.getTime();
		p.setDtPedido(dt);
		p.setStatus("EM PROCESSO");
		c.getPedido().add(p);
			return p;
		}
		Pedido pu = new Pedido();
		
		return pu;
		
		
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
		String txtId = (String) request.getSession().getAttribute("usuarioID");
		int id = Integer.parseInt(txtId);
		Cliente c = (Cliente) request.getSession().getAttribute("cli");

		ArrayList<Integer> indices = new ArrayList();
		RequestDispatcher d = null;
		String usuario = (String) request.getSession().getAttribute("username");
		
		String operacao = request.getParameter("operacao");
		
		if(operacao.equals("FINALIZAR")) {
			if(usuario != null) {
				
				request.getSession().setAttribute("resultado", resultado);
				d= request.getRequestDispatcher("Final.jsp");  
				
			}
		}
			
			if(operacao.equals("CONSULTAR")) {
				
			}
			
			if(operacao.equals("SELECIONAR")) {
				
				request.getSession().setAttribute("selecionadoCartao", "true");
				String j = request.getParameter("txtIndice");
				int indice = Integer.parseInt(j);
				System.out.println("cartoes "  + c.getCartao().size());
				ArrayList<Cartao> cartoes = (ArrayList) c.getCartao();
				int ped = c.getPedido().size() - 1;
				Cartao cartao = c.getCartao().get(indice);
				cartoes.add(cartao);
				c.getPedido().get(ped).setCartao(cartoes);
				
				
				indices.add(indice);
				
				request.getSession().setAttribute("i", indices);
				d = request.getRequestDispatcher("Final.jsp");
			}
			

			if(operacao.equals("CONSULTARPEDIDO")){
				request.getSession().setAttribute("resultadoConsultaPedido", resultado);
				d= request.getRequestDispatcher("Painel.jsp");  
			}
			d.forward(request, response);
		}
		

	}


