package livro.core.impl.controle;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import livro.core.IDAO;
import livro.core.IFachada;
import livro.core.IStrategy;
import livro.core.aplicacao.Resultado;
import livro.core.impl.dao.ClienteDAO;
import livro.core.impl.dao.CupomDAO;
import livro.core.impl.dao.EnderecoDAO;
import livro.core.impl.dao.LivroDAO;
import livro.core.impl.dao.PedidoDAO;
import livro.core.impl.dao.TelefoneDAO;
import livro.core.impl.negocio.ValidarEstoqueCarrinho;
import livro.core.impl.negocio.VrDataCupomDesconto;
import livro.core.impl.negocio.vrDadosObrigatoriosLivro;
import livro.core.impl.negocio.vrQuantidadeCupomPedido;
import livro.core.util.ConsultaEntidades;
import livro.core.util.ConverteDate;
import livro.dominio.Cliente;
import livro.dominio.CupomDesconto;
import livro.dominio.Endereco;
import livro.dominio.EntidadeDominio;
import livro.dominio.Item;
import livro.dominio.Livros;
import livro.dominio.Pedido;
import livro.dominio.Telefone;

public class Fachada implements IFachada {
	/**
	 * Mapa de DAOS, será indexado pelo nome da entidade O valor é uma instância do
	 * DAO para uma dada entidade;
	 */
	private Map<String, IDAO> daos;

	/**
	 * Mapa para conter as regras de negócio de todas operações por entidade; O
	 * valor é um mapa que de regras de negócio indexado pela operação
	 */
	private Map<String, Map<String, List<IStrategy>>> rns;

	private Resultado resultado;

	public Fachada() {
		/* Intânciando o Map de DAOS */
		daos = new HashMap<String, IDAO>();
		/* Intânciando o Map de Regras de Negócio */
		rns = new HashMap<String, Map<String, List<IStrategy>>>();

		/* Criando instâncias dos DAOs a serem utilizados */
		LivroDAO livroDAO = new LivroDAO();
		ClienteDAO clienteDAO = new ClienteDAO();
		TelefoneDAO telDAO = new TelefoneDAO();
		EnderecoDAO endDAO = new EnderecoDAO();
		CupomDAO cupomDAO = new CupomDAO();
		PedidoDAO pedidoDAO = new PedidoDAO();

		/* Adicionando cada dao no MAP indexando pelo nome da classe */
		daos.put(Livros.class.getName(), livroDAO);
		daos.put(Cliente.class.getName(), clienteDAO);
		daos.put(Telefone.class.getName(), telDAO);
		daos.put(Endereco.class.getName(), endDAO);
		daos.put(CupomDesconto.class.getName(), cupomDAO);
		daos.put(Pedido.class.getName(), pedidoDAO);

		/* Criando instâncias de regras de negócio a serem utilizados */
		vrDadosObrigatoriosLivro vrDadosObrigatorioLivro = new vrDadosObrigatoriosLivro();
		ValidarEstoqueCarrinho vQtdeEstoque = new ValidarEstoqueCarrinho();
		vrQuantidadeCupomPedido vrQuantidadeCupom = new vrQuantidadeCupomPedido();
		VrDataCupomDesconto vrDataCupom = new VrDataCupomDesconto();

		/*
		 * Criando uma lista para conter as regras de negócio de livros quando a
		 * operação for salvar
		 */
		List<IStrategy> rnsSalvarLivro = new ArrayList<IStrategy>();
		List<IStrategy> rnsSalvarCliente = new ArrayList<IStrategy>();
		List<IStrategy> rnsValidarCarrinho = new ArrayList<IStrategy>();
		List<IStrategy> rnsValidarCupom = new ArrayList<IStrategy>();
		/* Adicionando as regras a serem utilizadas na operação salvar do fornecedor */
		rnsSalvarLivro.add(vrDadosObrigatorioLivro);

		/*
		 * Adicionando as regras a serem utilizadas na operação de validar quantidade
		 * carrinho
		 */
		rnsValidarCarrinho.add(vQtdeEstoque);

		/*
		 * Adicionando as regras a serem utilizadas na operação de validar quantidade de
		 * cupons no pedido
		 */

		/*
		 * Adicionando as regras a serem utilizadas na operação de validar a data de
		 * cupons no pedido
		 */
		rnsValidarCupom.add(vrDataCupom);

		/*
		 * Cria o mapa que poderá conter todas as listas de regras de negócio específica
		 * por operação do livro
		 */

		Map<String, List<IStrategy>> rnsLivro = new HashMap<String, List<IStrategy>>();
		Map<String, List<IStrategy>> rnsCliente = new HashMap<String, List<IStrategy>>();
		Map<String, List<IStrategy>> rnsCarrinho = new HashMap<String, List<IStrategy>>();
		Map<String, List<IStrategy>> rnsCupom = new HashMap<String, List<IStrategy>>();

		/*
		 * Adiciona a listra de regras na operação salvar no mapa do fornecedor (lista
		 * criada na linha 70)
		 */
		rnsLivro.put("SALVAR", rnsSalvarLivro);
		rnsCliente.put("SALVAR", rnsSalvarCliente);
		rnsCarrinho.put("COMPRAR", rnsValidarCarrinho);
		rnsCupom.put("APLICAR", rnsValidarCupom);

		/*
		 * Adiciona a listra de regras na operação Alterar no mapa do livro (lista
		 * criada na linha 70)
		 */
		rnsLivro.put("ALTERAR", rnsSalvarLivro);

		/*
		 * Adiciona o mapa(criado na linha 79) com as regras indexadas pelas operações
		 * no mapa geral indexado pelo nome da entidade
		 */
		rns.put(Livros.class.getName(), rnsLivro);
		rns.put(Item.class.getName(), rnsCarrinho);
		rns.put(CupomDesconto.class.getName(), rnsCupom);
		


	}

	

	@Override
	public Resultado salvar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();

		String msg = executarRegras(entidade, "SALVAR");

		if (msg == null) {
			IDAO dao = daos.get(nmClasse);
			try {

				dao.salvar(entidade);
				List<EntidadeDominio> entidades = new ArrayList<EntidadeDominio>();
				entidades.add(entidade);
				resultado.setEntidades(entidades);
			} catch (SQLException e) {
				e.printStackTrace();
				resultado.setMsg("Não foi possível realizar o registro!");

			}
		} else {
			resultado.setMsg(msg);
		}
		return resultado;
	}

	@Override
	public Resultado consultar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();

		if (entidade instanceof Item) {
			Item itemCarrinho = (Item) entidade;
			Livros livroCarrinho = itemCarrinho.getLivro();
			if (livroCarrinho != null) {

				LivroDAO dao = new LivroDAO();
				List<EntidadeDominio> entidadeLivro = dao.consultar(livroCarrinho);

				Livros l = (Livros) entidadeLivro.get(0);
				itemCarrinho.setLivro(l);

				List<EntidadeDominio> itens = new ArrayList<EntidadeDominio>();
				itens.add(itemCarrinho);

				resultado.setEntidades(itens);

				String msg = executarRegras(itemCarrinho, "COMPRAR");

				resultado.setMsg(msg);
				if (resultado.getMsg() != null) {
					itemCarrinho.setQuantidade(l.getEstoque());
				}
			}
		} else {

			String msg = executarRegras(entidade, "CONSULTAR");

			if (msg == null) {
				IDAO dao = daos.get(nmClasse);
				try {

					resultado.setEntidades(dao.consultar(entidade));
				} catch (SQLException e) {
					e.printStackTrace();
					resultado.setMsg("Não foi possível realizar a consulta!");

				}
			} else {
				resultado.setMsg(msg);
			}
			if (entidade instanceof CupomDesconto) {
				ConsultaEntidades.VerificaCupom(entidade);
				msg = executarRegras(entidade, "APLICAR");
				resultado.setMsg(msg);
				return resultado;
			}
		}

		return resultado;

	}

	@Override
	public Resultado visualizar(EntidadeDominio entidade) {
		resultado = new Resultado();
		resultado.setEntidades(new ArrayList<EntidadeDominio>(1));
		resultado.getEntidades().add(entidade);
		return resultado;

	}

	private String executarRegras(EntidadeDominio entidade, String operacao) {
		String nmClasse = entidade.getClass().getName();
		StringBuilder msg = new StringBuilder();

		Map<String, List<IStrategy>> regrasOperacao = rns.get(nmClasse);

		if (regrasOperacao != null) {
			List<IStrategy> regras = regrasOperacao.get(operacao);

			if (regras != null) {
				for (IStrategy s : regras) {
					String m = s.processar(entidade);

					if (m != null) {
						msg.append(m);
						msg.append("\n");
					}
				}
			}

		}

		if (msg.length() > 0)
			return msg.toString();
		else
			return null;
	}

	
	@Override
	public Resultado alterar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		resultado = new Resultado();
		String nmClass = entidade.getClass().getName();
		String msg = executarRegras(entidade, "ALTERAR");

		if (msg == null) {
			IDAO dao = daos.get(nmClass);
			try {
				dao.alterar(entidade);
				List<EntidadeDominio> entidades = new ArrayList<>();
				entidades.add(entidade);
				resultado.setEntidades(entidades);
			} catch (SQLException e) {
				e.printStackTrace();
				resultado.setMsg("Nao foi possivel realizar o registro!");
			}
		} else {
			resultado.setMsg(msg);
		}
		return resultado;

	}

	@Override
	public Resultado excluir(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		return null;
	}

	
}