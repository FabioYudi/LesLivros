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
import livro.dominio.Pedido;

public class AdicionarItensCarrinho implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String stringId = (String) request.getSession().getAttribute("usuarioID");
		Livros l = (Livros) request.getSession().getAttribute("livro");
		Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
		Map<Integer, Resultado> mapaResultado = (Map<Integer, Resultado>) request.getSession().getAttribute("mapaResultado");
		String operacao = (String) request.getParameter("operacao");

		if (stringId == null) {
			request.getSession().setAttribute("usuarioID", "0");
			request.getSession().setAttribute("usuariodeslogado", true);
			stringId = "0";
		}
			
		

		if (mapaUsuarios == null) {
			mapaUsuarios = new HashMap<Integer, Pedido>();
			Pedido p = new Pedido();
			p.setItem(new ArrayList<Item>());
			Item i = new Item();
			i.setLivro(l);
			i.setQuantidade(1);
			p.getItem().add(i);
			int idUsuario = Integer.parseInt(stringId);
			mapaUsuarios.put(idUsuario, p);
			return i;
		}

		if (operacao.equals("SOMAR") || operacao.equals("SUBTRAIR")) {
			String txtIdUsuario = (String) request.getSession().getAttribute("usuarioID");
			int idUsuario = Integer.parseInt(txtIdUsuario);
			String txtIdLivro = request.getParameter("txtId");
			int idLivro = Integer.parseInt(txtIdLivro);
			Pedido p = mapaUsuarios.get(idUsuario);
			Livros li;
			Item i = new Item();
			for (int k = 0; k < p.getItem().size(); k++) {
				if (p.getItem().get(k).getLivro().getId() == idLivro) {
					li = p.getItem().get(k).getLivro();
					i = p.getItem().get(k);

				}
			}

			return i;
		}

		if(mapaUsuarios != null)
		{
			Item i = new Item();
			i.setQuantidade(1);
			i.setLivro(l);
			return i;
		}
		
		return new Item();

	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		RequestDispatcher d = null;
		Livros te = (Livros) request.getSession().getAttribute("livro");

		String operacao = request.getParameter("operacao");
		String strId =  request.getSession().getAttribute("usuarioID").toString();

		if (strId == null) {
			request.getSession().setAttribute("usuarioID", "0");
			request.getSession().setAttribute("usuariodeslogado", true);
			strId = "0";
		}
		if (!strId.trim().equals("0")) {
			if (request.getSession().getAttribute("usuariodeslogado") != null) {
				Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
				Pedido p = mapaUsuarios.get(0);
				mapaUsuarios.put(Integer.parseInt(strId), p);
				request.getSession().removeAttribute("usuariodeslogado");
				request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
				
			}
		}

		if (operacao.equals("COMPRAR")) {
			int estoque = 0;
			Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
			String txtId = (String) request.getSession().getAttribute("usuarioID");
			Integer id = Integer.parseInt(txtId);
			if (mapaUsuarios == null) {
				mapaUsuarios = new HashMap<Integer, Pedido>();
			}
			String msg1 = "Nao ha mais livros restantes no estoque";
			msg1.trim();
			System.out.println("to no setview comprar");
			
			if (resultado.getMsg() == null || resultado.getMsg().trim().equals(msg1)) {
				if (mapaUsuarios.containsKey(id)) // se o usuário já existe
				{
					List<EntidadeDominio> e = resultado.getEntidades(); // pegando o resultado que retorna da fachada
					// cast da lista de entidade dominio para item(só é possível ter um item na
					// lista
					Item item = (Item) e.get(0);// pega o único item que retornou da fachada
					
					Pedido p = mapaUsuarios.get(id); // pega o pedido que está associado com a id do usuário
					List<Integer> listaIds= new ArrayList<Integer>();
					int indice = 0;
					if(p.getItem().size() == 0)      //se não existe uma lista de itens no pedido
					{
						p.setItem(new ArrayList<Item>()); 
						p.getItem().add(item);  
					}
					else
					{
						for(int i = 0; i < p.getItem().size(); i++)
						{
							if(item.getLivro().getId() == p.getItem().get(i).getLivro().getId()) { // verificando se o livro ja está no pedido
								indice = i;
								 estoque = p.getItem().get(i).getLivro().getEstoque();

							}
							
							listaIds.add(p.getItem().get(i).getLivro().getId()); 
						}
						
						if(!listaIds.contains(item.getLivro().getId()))
						{	
							
							p.getItem().add(item); 
						}
						else {
							if(p.getItem().get(indice).getQuantidade() ==  estoque) {
								resultado.setMsg("Não existem mais unidades disponiveis");
								
							}else {
								p.getItem().get(indice).setQuantidade(p.getItem().get(indice).getQuantidade() + 1);
							}
						}
						mapaUsuarios.replace(id, p);  
						request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
					} // if lista de item maior q 0
				} // if contains key
				
				if(!mapaUsuarios.containsKey(id))
				{
					List<EntidadeDominio> e = resultado.getEntidades();  //pegando o resultado que retorna da fachada

					Item item = (Item)e.get(0);//pega o único item que retornou da fachada
					Pedido p = mapaUsuarios.get(id); //pega o pedido que está associado com a id do usuário
					
					if(p == null)
					{
						p = new Pedido();
					}
					
					p.setItem(new ArrayList<Item>()); 
					p.getItem().add(item);  
					
					if(mapaUsuarios.size() == 0 || !mapaUsuarios.containsKey(id))
					{
						mapaUsuarios.put(id, p);  
					}
					else
					{
						mapaUsuarios.replace(id, p); 
					}
					request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
				} // if !containsKey
			}// if getMsg == null


			request.getSession().setAttribute("resultadoLivro", resultado);
			
			d = request.getRequestDispatcher("Carrinho.jsp");
		} // operacação == VERIFICAR

		if (operacao.equals("SOMAR") || operacao.equals("SUBTRAIR")) {
			Map<Integer, Pedido> mapaUsuarios = (HashMap<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
			// mapaResultado = (Map<Integer,
			// Resultado>)request.getSession().getAttribute("mapaResultado");
			String txtIdLivro = (String) request.getParameter("txtId");
			Integer idLivro = Integer.parseInt(txtIdLivro);
			String txtIdUsuario = (String) request.getSession().getAttribute("usuarioID");
			Integer idUsuario = Integer.parseInt(txtIdUsuario);
			Pedido p = mapaUsuarios.get(idUsuario);
			if (resultado.getMsg() == null) {
				for (int i = 0; i < p.getItem().size(); i++) {
					Livros l = p.getItem().get(i).getLivro();
					if (l.getId() == idLivro) {
						Integer qtde;
						if (operacao.equals("SUBTRAIR")) {
							qtde = p.getItem().get(i).getQuantidade() - 1;
						} else {
							qtde = p.getItem().get(i).getQuantidade() + 1;
						}

						p.getItem().get(i).setQuantidade(qtde);
						break;
					}
				}

				mapaUsuarios.replace(idUsuario, p);

			}

			if (resultado.getMsg() != null) {

				List<EntidadeDominio> ed = resultado.getEntidades();
				Item item = (Item) ed.get(0);
				p = mapaUsuarios.get(idUsuario);
				Integer qtdeLivrosRestantes = item.getQuantidade();

				for (int i = 0; i < p.getItem().size(); i++) {
					Livros l = p.getItem().get(i).getLivro();
					if (l.getId() == idLivro) {
						if (operacao.equals("SUBTRAIR")
								&& qtdeLivrosRestantes == p.getItem().get(i).getQuantidade()) {
							
							Integer qtdeItem = p.getItem().get(i).getQuantidade() - 1;
							p.getItem().get(i).setQuantidade(qtdeItem);
						} else {
							p.getItem().get(i).setQuantidade(qtdeLivrosRestantes);
						}

						break;
					}
				}

				mapaUsuarios.replace(idUsuario, p);

			}
			
			request.getSession().setAttribute("resultadoLivro", resultado);
			request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
			d = request.getRequestDispatcher("Carrinho.jsp");

		}

		if (operacao.equals("REMOVER")) {
			Map<Integer, Pedido> mapaUsuarios = (HashMap<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
			String txtIdLivro = (String) request.getParameter("id");
			Integer idLivro = Integer.parseInt(txtIdLivro);
			String txtIdUsuario = (String) request.getSession().getAttribute("usuarioID");
			Integer idUsuario = Integer.parseInt(txtIdUsuario);
			Pedido p = mapaUsuarios.get(idUsuario);

			for (int i = 0; i < p.getItem().size(); i++) {
				Livros l = p.getItem().get(i).getLivro();
				if (l.getId() == idLivro) {
					p.getItem().remove(i);
					break;
				}
			}

			mapaUsuarios.replace(idUsuario, p);
			request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
			request.getSession().setAttribute("resultadoLivro", resultado);
			d = request.getRequestDispatcher("Carrinho.jsp");

		}

		d.forward(request, response);

	}

}
