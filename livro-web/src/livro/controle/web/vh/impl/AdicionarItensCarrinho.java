package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;
import livro.dominio.Item;
import livro.dominio.Livros;

public class AdicionarItensCarrinho implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
				Livros l = (Livros) request.getSession().getAttribute("livro");
				List<Livros> carrinhoLivros = (List<Livros>) request.getSession().getAttribute("livros"); 
				Map<Integer, Integer> m = (Map<Integer, Integer>)request.getSession().getAttribute("mapaCarrinho");
				
				String operacao = (String)request.getParameter("operacao");

					
				if(carrinhoLivros == null)
				{
					Map<Integer, Integer> mapLivros = new HashMap<Integer, Integer>();
					List<Livros> livros = new ArrayList<Livros>();
					livros.add(l);
					request.getSession().setAttribute("livros", livros);
					mapLivros.put(l.getId(), 1);
					request.getSession().setAttribute("mapaCarrinho", mapLivros);
					return new Item();
				}
				
<<<<<<< Upstream, based on origin/master

=======
				if(m != null && operacao.equals("CALCULAR"))
				{
					double frete;
					frete = l.getAltura() * l.getPeso() * l.getProfundidade();
					request.getSession().setAttribute("frete", frete);
				}
>>>>>>> 07f8a07 Sistema de sessão de login e sair da conta implementados, carrinho terminado
				
				if(m != null && operacao.equals("SOMAR"))
				{
					
					m = (HashMap<Integer,Integer>)request.getSession().getAttribute("mapaCarrinho");
					String txtId = (String) request.getParameter("txtId");
					Integer id = Integer.parseInt(txtId);
					if(m.containsKey(id))
					{
						m.replace(id, m.get(id) + 1);
						request.getSession().setAttribute("mapaCarrinho", m);
						Item i = new Item();
						return i;
					}
				}
				
				if(m != null && operacao.equals("SUBTRAIR"))
				{
					m = (HashMap<Integer,Integer>)request.getSession().getAttribute("mapaCarrinho");
					String txtId = (String) request.getParameter("txtId");
					Integer id = Integer.parseInt(txtId);
					if(m.containsKey(id))
					{
						m.replace(id, m.get(id) - 1);
						request.getSession().setAttribute("mapaCarrinho", m);
						Item i = new Item();
						return i;
					}
				}
				
				
				if(m != null && operacao.equals("REMOVER"))
				{
					String txtId = request.getParameter("id");
					int id = Integer.parseInt(txtId);

					m.remove(id, m.get(id));
					for(int i = 0; i < carrinhoLivros.size(); i ++)
					{
						if(carrinhoLivros.get(i).getId() == id)
						{
							carrinhoLivros.remove(i);
							break;
						}
					}
						request.getSession().setAttribute("livros", carrinhoLivros);
						request.getSession().setAttribute("mapaCarrinho", m);		
						return new Item();
				}
				
				if(carrinhoLivros != null)
				{
					if(m.containsKey(l.getId()))
					{
						m.put(l.getId(), m.get(l.getId()) + 1);
						request.getSession().setAttribute("mapaCarrinho", m);
					}
					if(!m.containsKey(l.getId()))
					{
						carrinhoLivros.add(l);
						m.put(l.getId(), 1);
						request.getSession().setAttribute("livros", carrinhoLivros);
						request.getSession().setAttribute("mapaCarrinho", m);	
					}
					return new Item();
				}
				
				return new Item();
				
			}

		
	

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		RequestDispatcher d = null;
		String operacao = request.getParameter("operacao");
		if(operacao.equals("COMPRAR")){
			request.getSession().setAttribute("resultadoLivro", resultado);
			d= request.getRequestDispatcher("Carrinho.jsp");  
		}			
		
		if(operacao.equals("SOMAR"))
		{
			d = request.getRequestDispatcher("Carrinho.jsp");
		}
		if(operacao.equals("REMOVER") || operacao.equals("SOMAR") || operacao.equals("SUBTRAIR"))
		{
			d = request.getRequestDispatcher("Carrinho.jsp");
		}
		d.forward(request,response);
		
	}

}
