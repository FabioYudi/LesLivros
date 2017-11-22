package livro.controle.web.vh.impl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.dominio.Cidade;
import livro.dominio.Cliente;
import livro.dominio.Endereco;
import livro.dominio.EntidadeDominio;
import livro.dominio.Estado;
import livro.dominio.Pais;

public class EnderecoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String operacao = request.getParameter("operacao");

		Endereco endereco = null;
		Cliente cliente = null;

		if (operacao.equals("SALVAR")) {
			String logradouro = request.getParameter("txtLogradouro");
			String bairro = request.getParameter("txtBairro");
			String cep = request.getParameter("txtCep");
			String numero = request.getParameter("txtNumero");
			String complemento = request.getParameter("txtComplemento");
			String nomeRua = request.getParameter("txtNomeRua");
			String tpRes = request.getParameter("txtTpRes");
			String tpLog = request.getParameter("txtTpLog");
			String cidade = request.getParameter("txtCidade");
			String estado = request.getParameter("txtEstado");
			String pais = request.getParameter("txtPais");
			String idRua = request.getParameter("txtIdRU");
			String id = request.getParameter("txtId");
			cliente = new Cliente();
			endereco = new Endereco();

			cliente.setEndereco(new Endereco());
			cliente.getEndereco().setCidade(new Cidade());
			cliente.getEndereco().getCidade().setEstado(new Estado());
			cliente.getEndereco().getCidade().getEstado().setPais(new Pais());


				cliente.getEndereco().setId(Integer.parseInt(idRua));
				cliente.getEndereco().setBairro(bairro);
				cliente.getEndereco().setLogradouro(logradouro);
				cliente.getEndereco().setCep(cep);
				cliente.getEndereco().setNumero(numero);
				cliente.getEndereco().setComplemento(complemento);
				cliente.getEndereco().setNome(nomeRua);
				cliente.getEndereco().setTipoResidencia(tpRes);
				cliente.getEndereco().setTipoLogradouro(tpLog);
				cliente.getEndereco().setTipoLogradouro(tpLog);
				cliente.getEndereco().getCidade().setNome(cidade);
				cliente.getEndereco().getCidade().getEstado().setNome(estado);
				cliente.getEndereco().getCidade().getEstado().getPais().setNome(pais);
				
				

			

			
		} 
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
RequestDispatcher d=null;
		
		String operacao = request.getParameter("operacao");

		if(operacao.equals("SALVAR"))
		{
			
				request.getSession().setAttribute("resultado", resultado);
				d = request.getRequestDispatcher("index.jsp"); 							
			

		}
		
		d.forward(request,response);
	}

	}


