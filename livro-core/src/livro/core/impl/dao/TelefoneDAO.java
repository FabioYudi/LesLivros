package livro.core.impl.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import livro.dominio.Cliente;
import livro.dominio.EntidadeDominio;
import livro.dominio.Livros;
import livro.dominio.Telefone;

public class TelefoneDAO extends AbstractJdbcDAO {
	
	public TelefoneDAO() {
		super("table", "idTable");
		// TODO Auto-generated constructor stub
	}

	
	
	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst = null;
		Telefone telefone = (Telefone)entidade;
		Cliente cliente = telefone.getCliente();
		

		try {
			connection.setAutoCommit(false);
			//ClienteDAO cliDAO = new ClienteDAO();
			//cliDAO.connection = connection;
			//cliDAO.ctrlTransaction = false;
			//cliDAO.salvar(cliente);		
			
			

			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO telefone(codigo, numero, tipo, id_cliente) "
					+ "VALUES (?,?,?,?)");

			pst = connection.prepareStatement(sql.toString());
			System.out.println(pst);
			pst.setString(1, telefone.getCodArea());
			pst.setString(2, telefone.getNumero());
			pst.setInt(3, telefone.getTp());;
			pst.setInt(4, telefone.getId());
			pst.executeUpdate();
			connection.commit();
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
		Livros livro = (Livros) entidade;
		// List<Categoria> categorias = new ArrayList<>();
		StringBuilder sql = new StringBuilder();

		if (livro.getCodigoLivro() == null) {
			livro.setCodigoLivro("");
		}

		if (livro.getAutor() == null) {
			livro.setAutor("");
		}

		if (livro.getAno() == null) {
			livro.setAno("");
		}

		if (livro.getTitulo() == null) {
			livro.setTitulo("");
		}

		if (livro.getEditora() == null) {
			livro.setEditora("");
		}

		if (livro.getEdicao() == null) {
			livro.setEdicao("");
		}

		if (livro.getIsbn() == null) {
			livro.setIsbn("");
		}
		if (livro.getNumPg() == null) {
			livro.setNumPg("");
		}

		if (livro.getSinopse() == null) {
			livro.setSinopse("");
		}

		sql.append(
				"SELECT DISTINCT  a.id, a.codigo_livro, a.autor, a.ano, a.status, a.titulo, a.editora, a.edicao, a.isbn, a.num_paginas, a.sinopse, a.altura,");
		sql.append(" a.peso, a.profundidade FROM livros a ");
		sql.append(" WHERE 1=1 ");
		if (livro.getId() != null && livro.getId() > 0) {
			sql.append(" AND a.id ilike '%" + livro.getId() + "%'");
		}
		if (livro.getTitulo() != null && livro.getTitulo().length() > 0) {
			sql.append(" AND a.titulo ilike '%" + livro.getTitulo() + "%'");
		}
		if (livro.getCodigoLivro() != null && livro.getCodigoLivro().length() > 0) {
			sql.append(" AND a.codigo_livro ilike '%" + livro.getCodigoLivro() + "%'");
		}
		if (livro.getAutor() != null && livro.getAutor().length() > 0) {
			sql.append(" AND a.autor ilike '%" + livro.getAutor() + "%'");
		}
		if (livro.getEdicao() != null && livro.getEdicao().length() > 0) {
			sql.append(" AND a.edicao ilike '%" + livro.getEdicao() + "%'");
		}
		if (livro.getIsbn() != null && livro.getIsbn().length() > 0) {
			sql.append(" AND a.isbn ilike '%" + livro.getIsbn() + "%'");
		}
		
		if (livro.getSinopse() != null && livro.getSinopse().length() > 0) {
			sql.append(" AND a.sinopse ilike '%" + livro.getSinopse() + "%'");
		}
		if (livro.getAno() != null && livro.getAno().length() > 0) {
			sql.append(" and a.ano ilike '%" + livro.getAno() + "%'");
		}
		if (livro.getNumPg() != null && livro.getNumPg().length() > 0) {
			sql.append(" and a.npaginas = " + livro.getNumPg());
		}
		
		if(livro.getStatus() != null){
		 sql.append(" and a.status = " + livro.getStatus());
		 }
		if (livro.getEditora() != null && livro.getEditora().length() > 0) {
			sql.append(" and a.editora ilike '%" + livro.getEditora() + "%'");
		}
		// if(livro.getGrupoPrecificacao().getId() != null){
		// sql.append(" and a.id_grupo_precificacao = " +
		// livro.getGrupoPrecificacao().getId());
		// }

		try {
			openConnection();
			pst = connection.prepareStatement(sql.toString());
			ResultSet rs = pst.executeQuery();
			List<EntidadeDominio> livros = new ArrayList<EntidadeDominio>();
			
			
			
			while (rs.next()) {
				Livros l = new Livros();
				l.setId(rs.getInt("id"));
				l.setCodigoLivro(rs.getString("codigo_livro"));
				l.setAutor(rs.getString("autor"));
				l.setAno(rs.getString("ano"));
				l.setStatus(rs.getBoolean("status"));
				l.setTitulo(rs.getString("titulo"));
				l.setEditora(rs.getString("editora"));
				l.setEdicao(rs.getString("edicao"));
				l.setIsbn(rs.getString("isbn"));
				l.setNumPg(rs.getString("num_paginas"));
				l.setSinopse(rs.getString("sinopse"));
				l.setAltura(rs.getDouble("altura"));
				l.setPeso(rs.getDouble("peso"));
				l.setProfundidade(rs.getDouble("profundidade"));
				
				livros.add(l);

			}
			return livros;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	


}
