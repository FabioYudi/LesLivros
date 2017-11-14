package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		// TODO Auto-generated method stub
	


			Livros l = (Livros) request.getSession().getAttribute("livro");
			List<Item> carrinho = (List<Item>) request.getSession().getAttribute("carrinho");
			List<Item> itens;
			if (carrinho == null) {
				itens = new ArrayList<Item>();
				Item i = new Item();
				i.setLivro(l);
				itens.add(i);
				request.getSession().setAttribute("carrinho", itens);

				return i;
			} else {
				Item i = new Item();
				i.setLivro(l);
				carrinho.add(i);
				return i;
				
			}
			
			
		}

		
	

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		RequestDispatcher d = null;
		String operacao = request.getParameter("operacao");
		if (operacao.equals("COMPRAR")) {
			request.getSession().setAttribute("resultadoLivro", resultado);
			d = request.getRequestDispatcher("Carrinho.jsp");
		}

		d.forward(request, response);

	}

}
