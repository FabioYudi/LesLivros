package livro.controle.web.vh.impl;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;
import livro.dominio.LivroLog;

public class Logar implements IViewHelper {
	
	private String usuario;
	
	public String Cadastro() {
		
		
		return usuario;
	}
	
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

		// TODO Auto-generated method stub
		if(operacao.equals("LOGAR")){
			HttpSession sessao = request.getSession();
			sessao.setAttribute("username",request.getParameter("username"));


			d = request.getRequestDispatcher("index.jsp");
		}		
		if(operacao.equals("SAIR")){
			request.getSession().removeAttribute("username");
			d = request.getRequestDispatcher("index.jsp");

			
		}
		
			 
			d.forward(request, response);

		
	}
	
	public String getUsuario() {
		return usuario;
	}
	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	
}
