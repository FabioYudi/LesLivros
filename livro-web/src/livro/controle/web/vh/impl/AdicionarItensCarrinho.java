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
				Livros l = (Livros) request.getSession().getAttribute("livro");
				List<Livros> carrinhoLivros = (List<Livros>) request.getSession().getAttribute("livros"); 
				Map<Integer, Integer> m = (Map<Integer, Integer>)request.getSession().getAttribute("mapaCarrinho");
				
				String operacao = (String)request.getParameter("operacao");

					
				if(mapaUsuarios == null)
				{
					mapaUsuarios = new HashMap<Integer, Pedido>();
					Pedido p = new Pedido();
					p.setItem(new ArrayList<Item>());
					Item i = new Item();
					i.setLivro(l);
					i.setId(1);
					p.getItem().add(i);
					int idUsuario = Integer.parseInt(stringId);
					mapaUsuarios.put(idUsuario, p);
					return i;
				}
				
				
				
				
				
				
			
				
				
				
				if(carrinhoLivros != null) // Se o carrinho ja existir
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
		String strId = (String)request.getSession().getAttribute("usuarioID");
		
		
		if(strId == null)
		{
			request.getSession().setAttribute("usuarioID", "0");
			request.getSession().setAttribute("usuariodeslogado", true);
			strId = "0";
		}
		if(!strId.trim().equals("0"))
		{
			System.out.println("ID não é 0");
			if(request.getSession().getAttribute("usuariodeslogado") != null)
			{
				Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
				Pedido p = mapaUsuarios.get(0);
				mapaUsuarios.put(Integer.parseInt(strId), p);
				request.getSession().removeAttribute("usuariodeslogado");
				request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
			}
		}
		
		
		
		
		
	
		
		if(operacao.equals("COMPRAR")){
			
			Livros l = (Livros) request.getSession().getAttribute("livro");
			Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");	
			String txtId = (String)request.getSession().getAttribute("usuarioID");
			Integer id = Integer.parseInt(txtId);
			if(mapaUsuarios == null)
			{
				mapaUsuarios = new HashMap<Integer, Pedido>();
			}
			String msg1 = "Nao ha mais livros restantes no estoque";
			msg1.trim();
			System.out.println("to no setview comprar");
			System.out.println(resultado.getMsg());
			if(resultado.getMsg() == null || resultado.getMsg().trim().equals(msg1))
			{
				if(mapaUsuarios.containsKey(id)) //se o usuário já existe
				{
					List<EntidadeDominio> e = resultado.getEntidades();  //pegando o resultado que retorna da fachada
														// cast da lista de entidade dominio para item(só é possível ter um item na lista
					Item item = (Item)e.get(0);//pega o único item que retornou da fachada
					Pedido p = mapaUsuarios.get(id); //pega o pedido que está associado com a id do usuário
					if(p.getItem().size() == 0)      //se não existe uma lista de itens no pedido
					{
						p.setItem(new ArrayList<Item>()); 
						p.getItem().add(item);  
					}
					
					else // se o pedido ja possui item
					{
						for(int i = 0; i < p.getItem().size(); i++ )
						{
							int idLivroFachada = p.getItem().get(i).getLivro().getId(); 
							int idItemLivro = item.getLivro().getId();
							if(idLivroFachada == idItemLivro)
							{
								p.getItem().get(i).setQuantidade(p.getItem().get(i).getQuantidade() + 1);
								break;
							}
							else //se não
							{
								p.getItem().add(item); //adiciona na lista
								break;
							}
							
						}//for
						mapaUsuarios.replace(id, p);  //pega o id atual do usuário e inserw pedido para ele
						request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
					}// if lista de item maior q 0
				}//if contains key
				
				
			
			}// if getMsg == null
			
			
			
			request.getSession().setAttribute("resultadoLivro", resultado);	
			d= request.getRequestDispatcher("Carrinho.jsp");  
		} //operacação == VERIFICAR
				
			
			
			
				
		
		if(operacao.equals("SOMAR") || operacao.equals("SUBTRAIR"))
		{
			Map<Integer, Pedido> mapaUsuarios = (HashMap<Integer,Pedido>)request.getSession().getAttribute("mapaUsuarios");
			//mapaResultado = (Map<Integer, Resultado>)request.getSession().getAttribute("mapaResultado");
			String txtIdLivro = (String) request.getParameter("txtId");
			Integer idLivro = Integer.parseInt(txtIdLivro);
			String txtIdUsuario = (String)request.getSession().getAttribute("usuarioID");
			Integer idUsuario = Integer.parseInt(txtIdUsuario);
			Pedido p = mapaUsuarios.get(idUsuario);
			if(resultado.getMsg() == null)
			{
				for(int i = 0; i < p.getItem().size(); i ++)
				{
					Livros l = p.getItem().get(i).getLivro();
					if(l.getId() == idLivro)
					{
						Integer qtde;
						if(operacao.equals("SUBTRAIR"))
						{
							qtde = p.getItem().get(i).getQuantidade() - 1;
						}
						else
						{
							qtde = p.getItem().get(i).getQuantidade() + 1;
						}
						
						p.getItem().get(i).setQuantidade(qtde);
						break;
					}
				}
				
				mapaUsuarios.replace(idUsuario, p);
				
			}
			
			if(resultado.getMsg() != null)
			{

				List<EntidadeDominio> ed = resultado.getEntidades();
				Item item = (Item)ed.get(0);
				p = mapaUsuarios.get(idUsuario);
				Integer qtdeLivrosRestantes = item.getQuantidade();
				
				for(int i = 0; i < p.getItem().size(); i ++)
				{
					Livros l = p.getItem().get(i).getLivro();
					if(l.getId() == idLivro)
					{
						if(operacao.equals("subtrairItem") && qtdeLivrosRestantes == p.getItem().get(i).getQuantidade())
						{
							System.out.println(qtdeLivrosRestantes);
							System.out.println(p.getItem().get(i).getQuantidade());
							Integer qtdeItem = p.getItem().get(i).getQuantidade() - 1;
							p.getItem().get(i).setQuantidade(qtdeItem);
						}
						else
						{
							p.getItem().get(i).setQuantidade(qtdeLivrosRestantes);
						}
						
						break;					
					}
				}
				
				mapaUsuarios.replace(idUsuario, p);
							
			}
			//List<Livro> livros = (List<Livro>)request.getSession().getAttribute("livros");
			//request.getSession().setAttribute("mapaCarrinho", m);
			request.getSession().setAttribute("resultadoLivro", resultado);
			request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
			d = request.getRequestDispatcher("Carrinho.jsp");
			
		}

		if(operacao.equals("REMOVER"))
		{
			Map<Integer, Pedido> mapaUsuarios = (HashMap<Integer,Pedido>)request.getSession().getAttribute("mapaUsuarios");
			String txtIdLivro = (String) request.getParameter("id");
			Integer idLivro = Integer.parseInt(txtIdLivro);
			String txtIdUsuario = (String)request.getSession().getAttribute("UsuarioID");
			Integer idUsuario = Integer.parseInt(txtIdUsuario);
			Pedido p = mapaUsuarios.get(idUsuario);
			
			for(int i = 0; i < p.getItem().size(); i ++)
			{
				Livros l = p.getItem().get(i).getLivro();
				if(l.getId() == idLivro)
				{
					p.getItem().remove(i);
					break;
				}
			}
			
			mapaUsuarios.replace(idUsuario, p);
			request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
			request.getSession().setAttribute("resultadoLivro", resultado);
			d = request.getRequestDispatcher("Carrinho.jsp");
			
			
		}
		
		
		
		d.forward(request,response);
		
	}

}

