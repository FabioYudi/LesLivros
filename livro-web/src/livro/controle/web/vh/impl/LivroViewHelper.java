package livro.controle.web.vh.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.manager.util.SessionUtils;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;
import livro.dominio.LivroLog;
import livro.dominio.Livros;
import livro.dominio.Usuario;

public class LivroViewHelper implements IViewHelper {
	
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		String operacao = request.getParameter("operacao");
		Livros livro = null;
		LivroLog log = null;
		Logar lo = null;
		Usuario u = null;
		
		
		

		if (!operacao.equals("VISUALIZAR")) {
			String idLog = request.getParameter("txtIdLog");
			String id = request.getParameter("txtId");
			String codigoLivro = request.getParameter("txtCodigoLivro");
			String autor = request.getParameter("txtAutor");
			String ano = request.getParameter("txtAno");
			String status = request.getParameter("txtStatus");
			String titulo = request.getParameter("txtTitulo");
			String editora = request.getParameter("txtEditora");
			String edicao = request.getParameter("txtEdicao");
			String isbn = request.getParameter("txtIsbn");
			String sinopse = request.getParameter("txtSinopse");
			String numPg = request.getParameter("txtNumPg");
			String altura = request.getParameter("txtAltura");
			String peso = request.getParameter("txtPeso");
			String profundidade = request.getParameter("txtProfundidade");
			livro = new Livros();
			log = new LivroLog();
			lo = new Logar();
			u = new Usuario();
			 HttpSession sessao = request.getSession();
			String teste = "";
			teste = (String)sessao.getAttribute("username");

			livro.setLivroLog(log);
			

			
			
			if (codigoLivro != null && !codigoLivro.trim().equals("")) {
				livro.setCodigoLivro(codigoLivro);
				log.setCodigoLivro(codigoLivro);
			}

			if (autor != null && !autor.trim().equals("")) {
				livro.setAutor(autor);
				log.setAutor(autor);
			}

			if (ano != null && !ano.trim().equals("")) {
				livro.setAno(ano);
				log.setAno(ano);
			}

			if (status != null && !status.trim().equals("")) {
				if (status.equals("true")) {
					livro.setStatus(true);
					log.setStatus(true);
				} else if(status.equals("false")) {
					livro.setStatus(false);
					log.setStatus(false);
				}else {
					
					livro.setStatus(null);
				}
			}

			if (titulo != null && !titulo.trim().equals("")) {
				livro.setTitulo(titulo);
				log.setTitulo(titulo);
			}

			if (editora != null && !editora.trim().equals("")) {
				livro.setEditora(editora);
				log.setEditora(editora);
			}

			if (edicao != null && !edicao.trim().equals("")) {
				livro.setEdicao(edicao);
				log.setEdicao(edicao);
			}
			if (isbn != null && !isbn.trim().equals("")) {
				livro.setIsbn(isbn);
				log.setIsbn(isbn);
			}
			if (sinopse != null && !sinopse.trim().equals("")) {
				livro.setSinopse(sinopse);
				log.setSinopse(sinopse);
			}
			if (numPg != null && !numPg.trim().equals("")) {
				livro.setNumPg(numPg);
				log.setNumPg(numPg);
			}
			if (altura != null && !altura.trim().equals("")) {
				livro.setAltura(Double.parseDouble(altura));
				log.setAltura(Double.parseDouble(altura));
			}
			if (peso != null && !peso.trim().equals("")) {
				livro.setPeso(Double.parseDouble(peso));
				log.setPeso(Double.parseDouble(peso));

			}
			if (profundidade != null && !profundidade.trim().equals("")) {
				livro.setProfundidade(Double.parseDouble(profundidade));
				log.setProfundidade(Double.parseDouble(profundidade));

			}
			if (id != null && !id.trim().equals("")) {
				livro.setId(Integer.parseInt(id));
				log.setId(Integer.parseInt(idLog));

			}
			
			
		} else {
			HttpSession session = request.getSession();
			Resultado resultado = (Resultado) session.getAttribute("resultado");
			int txtId = Integer.parseInt(request.getParameter("txtId"));

			for (EntidadeDominio l : resultado.getEntidades()) {
				if (l.getId() == txtId) {
					livro = (Livros) l;
				}
			}
		}
			return livro;
		}
	

	/**
	 * TODO Descrição do Método
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 * @see livro.controle.web.vh.IViewHelper#setView(javax.servlet.http.HttpServletRequest,
	 *      javax.servlet.http.HttpServletResponse)
	 */
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher d = null;
		request.getSession().setAttribute("resultado", null);
		request.getSession().setAttribute("livro", resultado);
		String operacao = request.getParameter("operacao");
		

		if (resultado.getMsg() == null) {
			if (operacao.equals("SALVAR")) {
				resultado.setMsg("Livro cadastrado com sucesso!");
			}

			request.getSession().setAttribute("resultado", resultado);
			d = request.getRequestDispatcher("FormConsultaLivro.jsp");
		}

		if (resultado.getMsg() == null && operacao.equals("ALTERAR")) {

			d = request.getRequestDispatcher("FormConsultaLivro.jsp");
		}

		if (resultado.getMsg() == null && operacao.equals("VISUALIZAR")) {

			request.setAttribute("livro", resultado.getEntidades().get(0));
			d = request.getRequestDispatcher("FormLivros.jsp");
		}

		if (resultado.getMsg() == null && operacao.equals("LOGAR")) {

			//HttpSession se = request.getSession();
			request.getSession().setAttribute("resultado", resultado);
			//String usu = (String) se.getAttribute("txtUsuario").toString();
			//LivroLog log = new LivroLog();
			//log.setUsuario(usu);
			d = request.getRequestDispatcher("FormLivros.jsp");
		}

		if (resultado.getMsg() != null) {
			if (operacao.equals("SALVAR") || operacao.equals("ALTERAR")) {
				request.getSession().setAttribute("resultado", resultado);
				d = request.getRequestDispatcher("FormConsultaLivro.jsp");
			}
		}
		
		if(operacao.equals("CONSULTARLIVRO")){
			request.getSession().setAttribute("resultadoConsultaLivro", resultado);
			d= request.getRequestDispatcher("index.jsp");  
			System.out.println("Passou pelo consultalivro");
		}

		d.forward(request, response);

	}
}
