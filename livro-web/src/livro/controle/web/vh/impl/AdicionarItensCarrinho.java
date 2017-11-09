package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;
import livro.dominio.Item;

public class AdicionarItensCarrinho implements IViewHelper {
	public ArrayList<String> AdicionaItensCarrinho(Item dado, ArrayList<String> lista) {
		// TODO Auto-generated constructor stub
		if (lista == null){
			lista = new ArrayList<String>();
		}
		lista.add(dado.getLivro().getTitulo());
		System.out.println("Livro adicionado ao carrinho");
		System.out.println(lista);
		return lista;
	}
	
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
			 
			d = request.getRequestDispatcher("Compra.jsp");
			d.forward(request, response);



		
	}

}
