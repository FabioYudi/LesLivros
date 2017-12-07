package livro.controle.web.vh.impl;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.Cliente;
import livro.dominio.EntidadeDominio;
import livro.dominio.LivroLog;
import livro.dominio.Livros;

public class Logar implements IViewHelper {
	

	
	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		
		 RequestDispatcher d = null;
		String operacao = request.getParameter("operacao");

			
		if(operacao.equals("SAIR")){
			request.getSession().removeAttribute("username");
			request.getSession().removeAttribute("selecionado");
			request.getSession().removeAttribute("indice");
			request.getSession().removeAttribute("mapaUsuarios");
			request.getSession().removeAttribute("usuarioID");
			request.getSession().removeAttribute("cupom");
			request.getSession().removeAttribute("cliente");
			request.getSession().removeAttribute("cli");
			request.getSession().removeAttribute("selecionadoCartao");


			d = request.getRequestDispatcher("index.jsp");

			
		}
		
			 
			d.forward(request, response);

		
	}
	
	
	
}
