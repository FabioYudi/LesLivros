package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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
		String stringId = (String) request.getSession().getAttribute("usuarioID");
		String operacao = request.getParameter("operacao");
		List<Endereco> enderecos = new ArrayList<Endereco>();
		Endereco endereco = null;
		Cliente cliente = null;
		Cidade cidade = null;
		Estado estado = null;
		Pais pais = null;

		if (operacao.equals("SALVAR")) {
			String logradouro = request.getParameter("txtLogradouro");
			String bairro = request.getParameter("txtBairro");
			String cep = request.getParameter("txtCep");
			String numero = request.getParameter("txtNumero");
			String complemento = request.getParameter("txtComplemento");
			String nomeRua = request.getParameter("txtNomeRua");
			String tpRes = request.getParameter("txtTpRes");
			String tpLog = request.getParameter("txtTpLog");
			String cidadeNome = request.getParameter("txtCidade");
			String estadoNome = request.getParameter("txtEstado");
			String paisNome = request.getParameter("txtPais");
			String idRua = request.getParameter("txtIdRU");
			String id = request.getParameter("txtId");
			endereco = new Endereco();
			cliente = new Cliente();
			cidade = new Cidade();
			estado = new Estado();
			pais = new Pais();
			endereco.setCidade(cidade);
			endereco.getCidade().setEstado(estado);
			endereco.getCidade().getEstado().setPais(pais);
			cliente.setEndereco(enderecos);

			endereco.setLogradouro(logradouro);
			endereco.setBairro(bairro);
			endereco.setCep(cep);
			endereco.setNumero(numero);
			endereco.setComplemento(complemento);
			endereco.setNome(nomeRua);
			endereco.setTipoResidencia(tpRes);
			endereco.setTipoLogradouro(tpLog);
			endereco.getCidade().setNome(cidadeNome);
			endereco.getCidade().getEstado().setNome(estadoNome);
			endereco.getCidade().getEstado().getPais().setNome(paisNome);
			endereco.setId(Integer.parseInt(stringId));
			enderecos.add(endereco);

			// cliente.getEndereco().setId(Integer.parseInt(idRua));
			cliente.setEndereco(enderecos);

			Cliente c = (Cliente) request.getSession().getAttribute("cli");

			c.getEndereco().add(endereco);

			return endereco;

		}
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		Cliente c = (Cliente) request.getSession().getAttribute("cli");

		String stringId = (String) request.getSession().getAttribute("usuarioID");

		RequestDispatcher d = null;

		String operacao = request.getParameter("operacao");

		if (operacao.equals("SALVAR")) {

			request.getSession().setAttribute("resultado", resultado);

			d = request.getRequestDispatcher("Carrinho.jsp");

		}

		d.forward(request, response);
	}

}
