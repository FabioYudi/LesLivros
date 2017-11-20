package livro.controle.web.vh.impl;

import java.io.IOException;

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
import livro.dominio.Telefone;

public class EnderecoViewHelper implements IViewHelper {

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		String operacao = request.getParameter("operacao");

		Endereco endereco = null;
		Cliente cliente = null;

		if (!operacao.equals("VISUALIZAR")) {
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
			cliente = new Cliente();
			endereco = new Endereco();

			cliente.setEndereco(new Endereco());
			cliente.getEndereco().setCidade(new Cidade());
			cliente.getEndereco().getCidade().setEstado(new Estado());
			cliente.getEndereco().getCidade().getEstado().setPais(new Pais());

			if (idRua != null && !idRua.trim().equals("")) {

				cliente.getEndereco().setId(Integer.parseInt(idRua));
			}

			if (bairro != null && !bairro.trim().equals("")) {
				cliente.getEndereco().setBairro(bairro);

			}

			if (cep != null && !cep.trim().equals("")) {
				cliente.getEndereco().setCep(cep);

			}

			if (numero != null && !numero.trim().equals("")) {
				cliente.getEndereco().setNumero(numero);

			}

			if (complemento != null && !complemento.trim().equals("")) {
				cliente.getEndereco().setComplemento(complemento);

			}

			if (nomeRua != null && !nomeRua.trim().equals("")) {
				cliente.getEndereco().setNome(nomeRua);

			}
			
			if (tpRes != null && !tpRes.trim().equals("")) {
				cliente.getEndereco().setTipoResidencia(tpRes);

			}
			
			if (tpLog != null && !tpLog.trim().equals("")) {
				cliente.getEndereco().setTipoLogradouro(tpLog);

			}
			
			if (tpLog != null && !tpLog.trim().equals("")) {
				cliente.getEndereco().setTipoLogradouro(tpLog);

			}
			
			if (cidade != null && !cidade.trim().equals("")) {
				cliente.getEndereco().getCidade().setNome(cidade);

			}
			
			if (estado != null && !pais.trim().equals("")) {
				cliente.getEndereco().getCidade().getEstado().setNome(estado);

			}
			
			if (cidade != null && !cidade.trim().equals("")) {
				cliente.getEndereco().getCidade().getEstado().getPais().setNome(pais);

			}

			
		} else{
			HttpSession session = request.getSession();
			Resultado resultado = (Resultado) session.getAttribute("resultado");
			int txtId = Integer.parseInt(request.getParameter("txtIdRU"));

			for (EntidadeDominio e : resultado.getEntidades()) {
				if (e.getId() == txtId) {
					endereco = (Endereco) e;
				}
			}

		}
		return endereco;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub

	}

}
