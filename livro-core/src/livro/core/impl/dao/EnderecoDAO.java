package livro.core.impl.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import livro.dominio.Cliente;
import livro.dominio.Endereco;
import livro.dominio.EntidadeDominio;
import livro.dominio.Livros;

public class EnderecoDAO extends AbstractJdbcDAO {
	
	public EnderecoDAO() {
		super("endereco", "id");
	}

	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst = null;
		Endereco endereco = (Endereco) entidade;
		Cliente cliente = endereco.getCliente();

		try {
			connection.setAutoCommit(false);
			//ClienteDAO cliDAO = new ClienteDAO();
			//cliDAO.connection = connection;
			//cliDAO.ctrlTransaction = false;
			//cliDAO.salvar(cliente);		

			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO endereco(logradouro, bairro, cep, numero, complemento, nome, "
					+ "tipo_residencia, tipo_logradouro, cidade, estado, pais, id_cliente) "
					+ "VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");

			pst = connection.prepareStatement(sql.toString());

			pst.setString(1, endereco.getLogradouro());
			pst.setString(2, endereco.getBairro());
			pst.setString(3, endereco.getCep());
			pst.setString(4, endereco.getNumero());
			pst.setString(5, endereco.getComplemento());
			pst.setString(6, endereco.getNome());
			pst.setString(7, endereco.getTipoResidencia());
			pst.setString(8, endereco.getTipoLogradouro());
			pst.setString(9, endereco.getCidade().getNome());
			pst.setString(10, endereco.getCidade().getEstado().getNome());
			pst.setString(11, endereco.getCidade().getEstado().getPais().getNome());
			pst.setInt(12, endereco.getId());
			
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
		
		return null;
	}
	


}
