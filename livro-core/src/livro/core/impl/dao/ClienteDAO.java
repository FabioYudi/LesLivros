package livro.core.impl.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;
import java.util.List;

import livro.dominio.Cartao;
import livro.dominio.Cidade;
import livro.dominio.Cliente;
import livro.dominio.Endereco;
import livro.dominio.EntidadeDominio;
import livro.dominio.Estado;
import livro.dominio.Livros;
import livro.dominio.Pais;
import livro.dominio.Telefone;

public class ClienteDAO extends AbstractJdbcDAO {
	

	public ClienteDAO() {
		super("cliente", "id");
	}

	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst = null;
		Cliente cliente = (Cliente) entidade;
		Telefone tel = cliente.getTelefone();
		Endereco end = cliente.getEndereco();
		Cartao car = cliente.getCartao();
		try {
			connection.setAutoCommit(false);
			

			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO clientes(nome, nascimento, genero, cpf, email, senha, status) VALUES(?,?,?,?,?,?,?)");
			
			pst = connection.prepareStatement(sql.toString(),Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, cliente.getNome());
			pst.setString(2,cliente.getNascimento());
			pst.setString(3,cliente.getGenero());
			pst.setString(4, cliente.getCpf());
			pst.setString(5, cliente.getEmail());
			pst.setString(6, cliente.getSenha());
			pst.setBoolean(7, cliente.getStatus());
			
			pst.executeUpdate();
			
			ResultSet rs = pst.getGeneratedKeys();
			int id=0;
			if(rs.next())
				id = rs.getInt(1);
			tel.setId(id);
			end.setId(id);
			car.setId(id);
			TelefoneDAO telDAO = new TelefoneDAO();
			EnderecoDAO endDAO = new EnderecoDAO();
			CartaoDAO carDAO = new CartaoDAO();
			
			connection.commit();
			telDAO.salvar(tel);
			endDAO.salvar(end);
			carDAO.salvar(car);
		} catch (SQLException e) {
			try {
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	}
	
	@Override
	public void alterar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		openConnection();
		PreparedStatement pst = null;
		Livros livro = (Livros)entidade;
		
		try {
			connection.setAutoCommit(false);
			StringBuilder sb = new StringBuilder();
			sb.append("UPDATE livros SET codigo_livro=?, autor=?, ano=?, status=?, titulo=?, editora=?, edicao=?, isbn=?, num_paginas=?, sinopse=?, altura=?,"
					+ " peso=?, profundidade=? WHERE id=?");
			pst = connection.prepareStatement(sb.toString());
			pst.setString(1, livro.getCodigoLivro());
			pst.setString(2, livro.getAutor());
			pst.setString(3, livro.getAno());
			pst.setBoolean(4, livro.getStatus());
			pst.setString(5, livro.getTitulo());
			pst.setString(6, livro.getEditora());
			pst.setString(7, livro.getEdicao());
			pst.setString(8, livro.getIsbn());
			pst.setString(9, livro.getNumPg());
			pst.setString(10, livro.getSinopse());
			pst.setDouble(11, livro.getAltura());
			pst.setDouble(12, livro.getPeso());
			pst.setDouble(13, livro.getProfundidade());
			pst.setInt(14, livro.getId());
			pst.executeUpdate();
			connection.commit();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

	/**
	 * TODO Descrição do Método
	 * 
	 * @param entidade
	 * @return
	 * @see fai.dao.IDAO#consulta(fai.domain.EntidadeDominio)
	 */
	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) {
		// TODO Auto-generated method stub
		PreparedStatement pst = null;
		Cliente cliente = (Cliente) entidade;
		// List<Categoria> categorias = new ArrayList<>();
		StringBuilder sql = new StringBuilder();

		if (cliente.getNome() == null) {
			cliente.setNome("");
		}

		if (cliente.getNascimento() == null) {
			cliente.setNascimento("");
		}

		if (cliente.getGenero() == null) {
			cliente.setGenero("");
		}

		if (cliente.getCpf() == null) {
			cliente.setCpf("");
		}

		if (cliente.getEmail() == null) {
			cliente.setEmail("");
		}

	
		
		sql.append("SELECT * FROM clientes INNER JOIN "
				+ "telefone ON (clientes.id = telefone.id_cliente)"
				+ "INNER JOIN endereco ON (clientes.id = endereco.id_cliente) "
				+ "INNER JOIN cartao_credito on (clientes.id = cartao_credito.id_cliente) where 1=1");
		
		
		if (cliente.getId() != null && cliente.getId() > 0) {
			sql.append(" AND cliente.id ilike '%" + cliente.getId() + "%'");
		}
		if (cliente.getNome() != null && cliente.getNome().length() > 0) {
			sql.append(" AND cliente.nome ilike '%" + cliente.getNome() + "%'");
		}
		if (cliente.getNascimento() != null && cliente.getNascimento().length() > 0) {
			sql.append(" AND cliente.nascimento ilike '%" + cliente.getNascimento() + "%'");
		}
		if (cliente.getGenero() != null && cliente.getGenero().length() > 0) {
			sql.append(" AND cliente.genero ilike '%" + cliente.getGenero() + "%'");
		}
		if (cliente.getCpf() != null && cliente.getCpf().length() > 0) {
			sql.append(" AND cliente.cpf ilike '%" + cliente.getCpf() + "%'");
		}
		if (cliente.getEmail() != null && cliente.getEmail() .length() > 0) {
			sql.append(" AND cliente.email ilike '%" + cliente.getEmail()  + "%'");
		}
	
		
		
		
		// if(livro.getGrupoPrecificacao().getId() != null){
		// sql.append(" and a.id_grupo_precificacao = " +
		// livro.getGrupoPrecificacao().getId());
		// }

		try {
			openConnection();
			pst = connection.prepareStatement(sql.toString());
			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			List<EntidadeDominio> clientes = new ArrayList<EntidadeDominio>();
			
			
			
			while (rs.next()) {
				Cliente c = new Cliente();
				Telefone t = new Telefone();
				Endereco e = new Endereco();
				Cidade ci = new Cidade();
				Estado es = new Estado();
				Pais p = new Pais();
				Cartao car = new Cartao();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setNascimento(rs.getString("nascimento"));
				c.setGenero(rs.getString("genero"));
				c.setCpf(rs.getString("cpf"));
				c.setEmail(rs.getString("email"));
				c.setSenha(rs.getString("senha"));
				c.setStatus(rs.getBoolean("status"));
				c.setTelefone(t);
				c.getTelefone().setNumero(rs.getString("numero"));
				c.getTelefone().setTp(rs.getInt("tipo"));
				c.getTelefone().setCodArea(rs.getString("codigo"));
				c.setEndereco(e);
				c.getEndereco().setLogradouro(rs.getString("logradouro"));
				c.getEndereco().setBairro(rs.getString("bairro"));
				c.getEndereco().setCep(rs.getString("cep"));
				c.getEndereco().setNumero(rs.getString("numero"));
				c.getEndereco().setComplemento(rs.getString("complemento"));
				c.getEndereco().setNome(rs.getString("nome"));
				c.getEndereco().setTipoResidencia(rs.getString("tipo_residencia"));
				c.getEndereco().setTipoLogradouro(rs.getString("tipo_logradouro"));
				c.getEndereco().setCidade(ci);
				c.getEndereco().getCidade().setNome(rs.getString("cidade"));
				c.getEndereco().getCidade().setEstado(es);
				c.getEndereco().getCidade().getEstado().setNome(rs.getString("estado"));
				c.getEndereco().getCidade().getEstado().setPais(p);
				c.getEndereco().getCidade().getEstado().getPais().setNome("pais");
				c.setCartao(car);
				c.getCartao().setTitular(rs.getString("titular"));
				c.getCartao().setNumero(rs.getString("numero"));
				c.getCartao().setCodigo(rs.getString("codigo"));
				c.getCartao().setValidade(rs.getString("validade"));
				c.getCartao().setBandeira(rs.getString("bandeira"));
				
				
				clientes.add(c);

			}
			return clientes;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	


}
