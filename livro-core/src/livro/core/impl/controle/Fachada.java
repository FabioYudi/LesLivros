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
import livro.core.impl.dao.LivroDAO;
import livro.core.impl.dao.TelefoneDAO;
import livro.core.impl.negocio.vrDadosObrigatoriosLivro;
import livro.dominio.Cliente;
import livro.dominio.EntidadeDominio;
import livro.dominio.Livros;
import livro.dominio.Telefone;


public class Fachada implements IFachada {
	/** 
	 * Mapa de DAOS, será indexado pelo nome da entidade 
	 * O valor é uma instância do DAO para uma dada entidade; 
	 */
	private Map<String, IDAO> daos;
	
	/**
	 * Mapa para conter as regras de negócio de todas operações por entidade;
	 * O valor é um mapa que de regras de negócio indexado pela operação
	 */
	private Map<String, Map<String, List<IStrategy>>> rns;
	
	private Resultado resultado;
	
	
	public Fachada(){
		/* Intânciando o Map de DAOS */
		daos = new HashMap<String, IDAO>();
		/* Intânciando o Map de Regras de Negócio */
		rns = new HashMap<String, Map<String, List<IStrategy>>>();
		
		/* Criando instâncias dos DAOs a serem utilizados*/
		LivroDAO livroDAO = new LivroDAO();
		ClienteDAO clienteDAO = new ClienteDAO();
		TelefoneDAO telDAO = new TelefoneDAO();
		
		/* Adicionando cada dao no MAP indexando pelo nome da classe */
		daos.put(Livros.class.getName(), livroDAO);
		daos.put(Cliente.class.getName(), clienteDAO);
		daos.put(Telefone.class.getName(), telDAO);
		
		/* Criando instâncias de regras de negócio a serem utilizados*/
		vrDadosObrigatoriosLivro vrDadosObrigatorioLivro = new vrDadosObrigatoriosLivro();
		
		/* Criando uma lista para conter as regras de negócio de livros
		 * quando a operação for salvar
		 */
		List<IStrategy> rnsSalvarLivro = new ArrayList<IStrategy>();
		List<IStrategy> rnsSalvarCliente = new ArrayList<IStrategy>();
		/* Adicionando as regras a serem utilizadas na operação salvar do fornecedor*/
		rnsSalvarLivro.add(vrDadosObrigatorioLivro);
	
		/* Cria o mapa que poderá conter todas as listas de regras de negócio específica 
		 * por operação  do livro
		 */
		
		Map<String, List<IStrategy>> rnsLivro = new HashMap<String, List<IStrategy>>();
		Map<String, List<IStrategy>> rnsCliente = new HashMap<String, List<IStrategy>>();
		/*
		 * Adiciona a listra de regras na operação salvar no mapa do fornecedor (lista criada na linha 70)
		 */
		rnsLivro.put("SALVAR", rnsSalvarLivro);	
		rnsCliente.put("SALVAR", rnsSalvarCliente);
		
		
		/*
		 * Adiciona a listra de regras na operação salvar no mapa do fornecedor (lista criada na linha 70)
		 */
		rnsLivro.put("ALTERAR", rnsSalvarLivro);	
		
		/* Adiciona o mapa(criado na linha 79) com as regras indexadas pelas operações no mapa geral indexado 
		 * pelo nome da entidade
		 */
		rns.put(Livros.class.getName(), rnsLivro);
	}
	public Resultado logar(EntidadeDominio entidade) {
		
	return resultado;
		
	}
	
	@Override
	public Resultado salvar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();	
		
		String msg = executarRegras(entidade, "SALVAR");
		
		
		if(msg == null){
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
		}else{
			resultado.setMsg(msg);
		}
		return resultado;
	}

	@Override
	public Resultado consultar(EntidadeDominio entidade) {
		resultado = new Resultado();
		String nmClasse = entidade.getClass().getName();	
		
		String msg = executarRegras(entidade, "CONSULTAR");
		
		
		if(msg == null){
			IDAO dao = daos.get(nmClasse);
			try {
				
				resultado.setEntidades(dao.consultar(entidade));
			} catch (SQLException e) {
				e.printStackTrace();
				resultado.setMsg("Não foi possível realizar a consulta!");
				
			}
		}else{
			resultado.setMsg(msg);
			
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

	
	private String executarRegras(EntidadeDominio entidade, String operacao){
		String nmClasse = entidade.getClass().getName();		
		StringBuilder msg = new StringBuilder();
		
		Map<String, List<IStrategy>> regrasOperacao = rns.get(nmClasse);
		
		
		if(regrasOperacao != null){
			List<IStrategy> regras = regrasOperacao.get(operacao);
			
			if(regras != null){
				for(IStrategy s: regras){			
					String m = s.processar(entidade);			
					
					if(m != null){
						msg.append(m);
						msg.append("\n");
					}			
				}	
			}			
			
		}
		
		if(msg.length()>0)
			return msg.toString();
		else
			return null;
	}
	
	public Resultado comprar(EntidadeDominio entidade) {
		System.out.println("Livro adicionado ao carrinho");
		return resultado;
		
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
