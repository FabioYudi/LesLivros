package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;
import livro.dominio.Estado;
import livro.dominio.Pais;
import livro.dominio.Telefone;
import livro.dominio.Cartao;
import livro.dominio.Cidade;
import livro.dominio.Cliente;
import livro.dominio.Endereco;

public class ClienteViewHelper implements IViewHelper {
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		String operacao = request.getParameter("operacao");
		Cliente cliente = null;
		Telefone t = null;
		Endereco e = null;
		Cidade ci = null;
		Estado es = null;
		Pais p = null;
		Cartao car = null;
		
		
		

		if (!operacao.equals("VISUALIZAR")) {
			
			cliente = new Cliente();
			t = new Telefone();
			e = new Endereco();
			ci = new Cidade();
			es = new Estado();
			p = new Pais();
			car = new Cartao();
			String id = request.getParameter("txtId");
			String status = request.getParameter("txtStatus");
			String nome = request.getParameter("txtNome");
			String genero = request.getParameter("txtGenero");
			String cpf = request.getParameter("txtCpf");
			String email = request.getParameter("txtEmail");
			String senha = request.getParameter("txtSenha");
			String numTelefone = request.getParameter("txtTelefone");
			String tipoTel = request.getParameter("txtTipo");
			String codigo = request.getParameter("txtCodigo");
			String idTel = request.getParameter("txtIdTel");
			
			String nascimento = request.getParameter("txtDtNasc");
			String titular = request.getParameter("txtTitular");
			String numeroCar = request.getParameter("txtNumCar");
			String codigoCar = request.getParameter("txtCodigoCar");
			String validade = request.getParameter("txtValidade");
			String bandeira = request.getParameter("txtBandeira");
			String idCartao = request.getParameter("txtIdCar");
			
			
		
			
			
			
			

			if (id != null && !id.trim().equals("")) {
				cliente.setId(Integer.parseInt(id));
				cliente.getTelefone().setId(Integer.parseInt(idTel));
				cliente.getCartao().setId(Integer.parseInt(idCartao));
			}
			

			if (status != null && !status.trim().equals("")) {
				if (status.equals("true")) {
					cliente.setStatus(true);
				} else if(status.equals("false")) {
					cliente.setStatus(false);
				}else {
					
					cliente.setStatus(null);
				}
			}

			
			if (nome != null && !nome.trim().equals("")) {
				cliente.setNome(nome);

			}
			
			if (genero != null && !genero.trim().equals("")) {
				cliente.setGenero(genero);

			}
			
			if (cpf != null && !cpf.trim().equals("")) {
				cliente.setCpf(cpf);

			}
			if(tipoTel !=null && !tipoTel.trim().equals("")) {
				if(tipoTel.equals("1")) {
					cliente.setTelefone(t);
					cliente.getTelefone().setTp(1);

				}
				else {
					cliente.getTelefone().setTp(0);
					
				}
				

			}
			
				cliente.setStatus(Boolean.parseBoolean(status));
				cliente.setNome(nome);
				
				
				
			
				cliente.setEndereco(e);
				cliente.getEndereco().setCidade(ci);
				cliente.getEndereco().getCidade().setEstado(es);
				cliente.getEndereco().getCidade().getEstado().setPais(p);
				cliente.setNascimento(nascimento);
				cliente.setEmail(email);
				cliente.setSenha(senha);
				cliente.setTelefone(new Telefone());
				cliente.getTelefone().setNumero(numTelefone);
				cliente.getTelefone().setCodArea(codigo);
				
				cliente.setCartao(car);
				cliente.setCartao(new Cartao());
				cliente.getCartao().setNumero(numeroCar);
				cliente.getCartao().setTitular(titular);
				cliente.getCartao().setCodigo(codigoCar);
				cliente.getCartao().setBandeira(bandeira);
				cliente.getCartao().setValidade(validade);
			

		} else {
			HttpSession session = request.getSession();
			Resultado resultado = (Resultado) session.getAttribute("resultado");
			int txtId = Integer.parseInt(request.getParameter("txtId"));

			for (EntidadeDominio c : resultado.getEntidades()) {
				if (c.getId() == txtId) {
					cliente = (Cliente) c;
				}
			}
		}
			return cliente;
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
		request.getSession().setAttribute("resultado", resultado);
		request.getSession().setAttribute("cliente", resultado);
		request.getSession().setAttribute("telefone", resultado);
		request.getSession().setAttribute("endereco", resultado);
		request.getSession().setAttribute("cartao", resultado);
		String operacao = request.getParameter("operacao");
		
		
		if(resultado.getMsg() == null && operacao.equals("SAIR")){
			request.getSession().removeAttribute("username");
			d = request.getRequestDispatcher("index.jsp");

			
		}
		if (resultado.getMsg() == null) {
			if (operacao.equals("SALVAR")) {
				resultado.setMsg("Cliente cadastrado com sucesso!");
			}

			request.getSession().setAttribute("resultado", resultado);
			d = request.getRequestDispatcher("FormConsultaCliente.jsp");
		}
		
		if(operacao.equals("LOGAR")) {
			List<EntidadeDominio> entidades = resultado.getEntidades();
			for (int i = 0; i < entidades.size(); i++) {
				Cliente c = (Cliente) entidades.get(i);
				

				if(request.getParameter("username").trim().equals(c.getEmail().trim()))
				{
					System.out.println(c.getEmail());

					HttpSession sessao = request.getSession();
					sessao.setAttribute("username",request.getParameter("username"));
					sessao.setAttribute("usuarioID", c.getId());
					

					
					d = request.getRequestDispatcher("index.jsp");
					break;
				}else {
					System.out.println("Usuario incorreto");
					d = request.getRequestDispatcher("Login.jsp");


				}
				
				
			}
		}
		
		

		if (resultado.getMsg() == null && operacao.equals("ALTERAR")) {

			d = request.getRequestDispatcher("FormConsultaCliente.jsp");
		}

		if (resultado.getMsg() == null && operacao.equals("VISUALIZAR")) {

			request.setAttribute("cliente", resultado.getEntidades().get(0));
			d = request.getRequestDispatcher("FormCliente.jsp");
		}

		if (resultado.getMsg() == null && operacao.equals("EXCLUIR")) {

			request.getSession().setAttribute("resultado", null);
			d = request.getRequestDispatcher("FormConsultaCliente.jsp");
		}

		if (resultado.getMsg() != null) {
			if (operacao.equals("SALVAR") || operacao.equals("ALTERAR")) {
				request.getSession().setAttribute("resultado", resultado);
				d = request.getRequestDispatcher("FormConsultaCliente.jsp");
			}
		}

		d.forward(request, response);

	}
}
