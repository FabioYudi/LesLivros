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
import livro.core.util.ConfirmarADM;
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
		if(p == null)
            p = new Pedido();
		
			return p;
		
			
		}
		
		
		if(operacao.equals("FINALIZARCOMPRA")) {
			
			String indice = request.getParameter("txtIndice");
			String idPedido = request.getParameter("txtIdPedido");
			int i = Integer.parseInt(indice);
			Pedido p = map.get(id);
			
			
			return p;
			

		}
		
		
			if(operacao.equals("TRANSPORTAR")) {
			
			
			String indice = request.getParameter("txtI");
			int i = Integer.parseInt(indice);
			System.out.println(i);
			Pedido p = map.get(id);
			p.setStatus("APROVADA");
			ConfirmarADM.setAdm(true);
			return p;
			

		}
		
		
		
		Pedido pu = new Pedido();
		
		return pu;
		
		
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		

		RequestDispatcher d = null;
		String usuario = (String) request.getSession().getAttribute("username");
		
		String operacao = request.getParameter("operacao");
		
		if(operacao.equals("FINALIZAR")) {
			Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
			String txtId = (String) request.getSession().getAttribute("usuarioID");
			int id = Integer.parseInt(txtId);
			Cliente c = (Cliente) request.getSession().getAttribute("cli");
			Pedido p = map.get(id);
			if(usuario != null) {
				if(map.containsKey(id))
					map.replace(id, p);

	            if(!map.containsKey(id))
	            	map.put(id, p);
				request.getSession().setAttribute("resultado", resultado);
				d= request.getRequestDispatcher("Final.jsp");  
				
			}
		}
			
		
			
		
		
			if(operacao.equals("SELECIONAR")) {
				Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
				String txtId = (String) request.getSession().getAttribute("usuarioID");
				int id = Integer.parseInt(txtId);
				Cliente c = (Cliente) request.getSession().getAttribute("cli");
				
					request.getSession().setAttribute("selecionadoCartao", "true");
					String j = request.getParameter("txtIndice");
					int indice = Integer.parseInt(j);
					int ped = c.getPedido().size() - 1;
					System.out.println("size " + ped);
					Cartao cartao = new Cartao();
					cartao = c.getCartao().get(indice);
					if(c.getPedido().get(ped).getCartao() == null) {
						ArrayList<Cartao> cartoes = new ArrayList<>();
						c.getPedido().get(ped).setCartao(cartoes);
						c.getPedido().get(ped).getCartao().add(cartao);
						c.getPedido().get(ped).setCartao(c.getPedido().get(ped).getCartao());
					}else {
						if(c.getPedido().get(ped).getCartao().size() == c.getCartao().size()) {
							
						}else {
							c.getPedido().get(ped).getCartao().add(cartao);
							c.getPedido().get(ped).setCartao(c.getPedido().get(ped).getCartao());
						}
					
					}

				
				
					d = request.getRequestDispatcher("Final.jsp");
				
			}
			
			
			
			if(operacao.equals("FINALIZARCOMPRA")) {
				
				request.getSession().setAttribute("resultadoConsultaPedido", resultado);
				d= request.getRequestDispatcher("Confirmacao.jsp");  
				
			}
			

			if(operacao.equals("CONSULTARPEDIDO")){
				request.getSession().setAttribute("resultadoPedido", resultado);
				d= request.getRequestDispatcher("Painel.jsp");  
			}
			d.forward(request, response);
		}
		

	}


