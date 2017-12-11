package livro.controle.web.vh.impl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import livro.controle.web.vh.IViewHelper;
import livro.core.aplicacao.Resultado;
import livro.core.util.ConfirmarADM;
import livro.dominio.Cartao;
import livro.dominio.Cliente;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class StatusViewHelper implements IViewHelper{

	@Override
	public EntidadeDominio getEntidade(HttpServletRequest request) {
		// TODO Auto-generated method stub
		ArrayList<Cartao> cartoes = new ArrayList<>();
		String operacao = request.getParameter("operacao");
		Cliente c = (Cliente) request.getSession().getAttribute("cli");
		Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
		String txtId = (String) request.getSession().getAttribute("usuarioID");
		int id = Integer.parseInt(txtId);
		
		
		if(operacao.equals("TRANSPORTAR")) {
			
			
			String indice = request.getParameter("txtI");
			int i = Integer.parseInt(indice);
			Pedido p = map.get(id);
			p.setStatus("APROVADA");
			ConfirmarADM.setAdm(true);
			return p;
			

		}
		return null;
	}

	@Override
	public void setView(Resultado resultado, HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
	}

}
