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
import livro.dominio.Item;
import livro.dominio.Livros;
import livro.dominio.Pais;
import livro.dominio.Pedido;
import livro.dominio.Telefone;

public class ClienteDAO extends AbstractJdbcDAO {

	public ClienteDAO() {
		super("cliente", "id");
	}

	public void salvar(EntidadeDominio entidade) {
		openConnection();
		PreparedStatement pst = null;
		Cliente cliente = (Cliente) entidade;
		//Telefone tel = cliente.getTelefone();
		//Endereco end = cliente.getEndereco();
		//Cartao car = cliente.getCartao();
		try {
			connection.setAutoCommit(false);

			StringBuilder sql = new StringBuilder();
			sql.append(
					"INSERT INTO clientes(nome, nascimento, genero, cpf, email, senha, status) VALUES(?,?,?,?,?,?,?)");

			pst = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			pst.setString(1, cliente.getNome());
			pst.setString(2, cliente.getNascimento());
			pst.setString(3, cliente.getGenero());
			pst.setString(4, cliente.getCpf());
			pst.setString(5, cliente.getEmail());
			pst.setString(6, cliente.getSenha());
			pst.setBoolean(7, true);

			pst.executeUpdate();
			

			ResultSet rs = pst.getGeneratedKeys();
			for (int i = 0; i < cliente.getEndereco().size(); i++) {
				Endereco e = cliente.getEndereco().get(i);
				pst = connection.prepareStatement(
						"INSERT INTO endereco(logradouro, bairro, cep, numero, complemento, nome, tipo_residencia, "
								+ "tipo_logradouro, cidade, estado, pais, id_cliente) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
				pst.setString(1, e.getLogradouro());
				pst.setString(2, e.getBairro());
				pst.setString(3, e.getCep());
				pst.setString(4, e.getNumero());
				pst.setString(5, e.getComplemento());
				pst.setString(6, e.getNome());
				pst.setString(7, e.getTipoResidencia());
				pst.setString(8, e.getTipoLogradouro());
				pst.setString(9, e.getCidade().getNome());
				pst.setString(10, e.getCidade().getEstado().getNome());
				pst.setString(11, e.getCidade().getEstado().getPais().getNome());
				pst.setInt(12, cliente.getId());
				pst.executeUpdate();
			}
			int id = 0;
			if (rs.next())
				id = rs.getInt(1);
		//	tel.setId(id);
		//	end.setId(id);
		//	car.setId(id);
			TelefoneDAO telDAO = new TelefoneDAO();
			EnderecoDAO endDAO = new EnderecoDAO();
			CartaoDAO carDAO = new CartaoDAO();

			connection.commit();
		//	telDAO.salvar(tel);
		//	endDAO.salvar(end);
		//	carDAO.salvar(car);
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
		Livros livro = (Livros) entidade;

		try {
			connection.setAutoCommit(false);
			StringBuilder sb = new StringBuilder();
			sb.append(
					"UPDATE livros SET codigo_livro=?, autor=?, ano=?, status=?, titulo=?, editora=?, edicao=?, isbn=?, num_paginas=?, sinopse=?, altura=?,"
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
	 * @throws SQLException 
	 * @see fai.dao.IDAO#consulta(fai.domain.EntidadeDominio)
	 */
	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		PreparedStatement pst = null;

		StringBuilder sb = new StringBuilder();
		sb.append("SELECT a.id, a.nome, a.nascimento, a.genero, a.cpf, a.email, a.senha FROM clientes a ");
		sb.append("WHERE 1=1 ");
		if (entidade != null) {
			Cliente cliente = (Cliente) entidade;
			if (cliente.getId() != null) {
				sb.append(" and a.id=" + cliente.getId());
			}

		}

		/*
		 * if(cliente.getPessoa() != null &&
		 * Character.isAlphabetic(cliente.getPessoa().getGenero())){
		 * sb.append(" and a.genero = " + cliente.getPessoa().getGenero()); }
		 */

		try {
			openConnection();
			pst = connection.prepareStatement(sb.toString());
			ResultSet rs = pst.executeQuery();
			List<EntidadeDominio> clientes = new ArrayList<>();
			while (rs.next()) {
				Cliente c = new Cliente();
				c.setId(rs.getInt("id"));
				c.setNome(rs.getString("nome"));
				c.setCpf(rs.getString("cpf"));
				c.setGenero(rs.getString("genero"));
				c.setNascimento("nascimento");
				c.setEmail(rs.getString("email"));
				c.setSenha(rs.getString("senha"));

				/*
				 * t = new Telefone(); t.setArea(rs.getString("area")); t.setNumero(t.getArea()
				 * + "" + rs.getString("numero")); List<Telefone> lst = new ArrayList<>();
				 * lst.add(t); c.setTelefone(lst);
				 */
				pst = connection.prepareStatement("SELECT id, titular, numero, bandeira, codigo, validade"
						+ " FROM cartao_credito WHERE id_cliente = ?");
				pst.setInt(1, c.getId());
				ResultSet rsCard = pst.executeQuery();
				List<Cartao> cartoes = new ArrayList<>();
				while (rsCard.next()) {
					Cartao cc = new Cartao();
					cc.setId(rsCard.getInt("id"));
					cc.setBandeira(rsCard.getString("bandeira"));
					cc.setTitular(rsCard.getString("titular"));
					cc.setNumero(rsCard.getString("numero"));
					cc.setCodigo(rsCard.getString("codigo"));
					cc.setValidade(rsCard.getString("validade"));
					cartoes.add(cc);
				}
				rsCard.close();
				pst = connection.prepareStatement(
						"SELECT  id, logradouro, bairro, cep, numero, complemento, nome, tipo_residencia,"
								+ " tipo_logradouro, cidade, estado, pais FROM endereco WHERE id_cliente = ?");
				pst.setInt(1, c.getId());
				List<Endereco> enderecos = new ArrayList<>();
				ResultSet rsEnd = pst.executeQuery();
				while (rsEnd.next()) {
					Endereco e = new Endereco();
					e.setId(rsEnd.getInt("id"));
					e.setLogradouro(rsEnd.getString("logradouro"));
					e.setBairro(rsEnd.getString("bairro"));
					e.setCep(rsEnd.getString("cep"));
					e.setNumero(rsEnd.getString("numero"));
					e.setComplemento(rsEnd.getString("complemento"));
					e.setNome(rsEnd.getString("nome"));
					e.setTipoLogradouro(rsEnd.getString("tipo_residencia"));
					e.setTipoLogradouro(rsEnd.getString("tipo_logradouro"));
					Cidade cidade = new Cidade();
					cidade.setNome(rsEnd.getString("cidade"));
					Estado estado = new Estado();
					estado.setNome(rsEnd.getString("estado"));
					Pais pais = new Pais();
					pais.setNome(rsEnd.getString("pais"));
					estado.setPais(pais);
					cidade.setEstado(estado);
					e.setCidade(cidade);
					enderecos.add(e);
				}
				rsEnd.close();
				pst = connection.prepareStatement("SELECT * FROM pedidos pe"
						+ " INNER JOIN endereco e on e.id = id_endereco " 
						+ " INNER JOIN itens i on i.id_pedido = pe.id_pedido"
						+ " INNER JOIN livros l on l.id = i.id_livro"
						+ " WHERE pe.id_cliente = ?");
				pst.setInt(1, c.getId());
				ResultSet rsPedido = pst.executeQuery();
				List<Pedido> pedidos = new ArrayList<>();
				List<Item> itens = new ArrayList<>();
				while (rsPedido.next()) {
					Endereco en = new Endereco();
					Pedido p = new Pedido();
					Item i = new Item();
					Livros l = new Livros();
					
					System.out.println(pst);
					i.setId(rsPedido.getInt("id"));
					l.setCodigoLivro(rsPedido.getString("codigo_livro"));
					l.setAutor(rsPedido.getString("autor"));
					l.setAno(rsPedido.getString("ano"));
					l.setStatus(rsPedido.getBoolean("status"));
					l.setTitulo(rsPedido.getString("titulo"));
					l.setEditora(rsPedido.getString("editora"));
					l.setEdicao(rsPedido.getString("edicao"));
					l.setIsbn(rsPedido.getString("isbn"));
					l.setNumPg(rsPedido.getString("num_paginas"));
					l.setSinopse(rsPedido.getString("sinopse"));
					l.setAltura(rsPedido.getDouble("altura"));
					l.setPeso(rsPedido.getDouble("peso"));
					l.setProfundidade(rsPedido.getDouble("profundidade"));
					l.setValor(rsPedido.getDouble("valor"));
					l.setEstoque(rsPedido.getInt("estoque"));
					l.setLargura(rsPedido.getDouble("largura"));
					i.setLivro(l);
					itens.add(i);
					p.setItem(itens);
					en.setLogradouro(rsPedido.getString("logradouro"));
					en.setBairro(rsPedido.getString("bairro"));
					en.setCep(rsPedido.getString("cep"));
					en.setNumero(rsPedido.getString("numero"));
					en.setComplemento(rsPedido.getString("complemento"));
					en.setNome(rsPedido.getString("nome"));
					en.setTipoLogradouro(rsPedido.getString("tipo_residencia"));
					en.setTipoLogradouro(rsPedido.getString("tipo_logradouro"));
					Cidade cidade = new Cidade();
					cidade.setNome(rsPedido.getString("cidade"));
					Estado estado = new Estado();
					estado.setNome(rsPedido.getString("estado"));
					Pais pais = new Pais();
					pais.setNome(rsPedido.getString("pais"));
					estado.setPais(pais);
					cidade.setEstado(estado);
					en.setCidade(cidade);
					p.setId(rsPedido.getInt("id_pedido"));
					p.setQtdItens(rsPedido.getInt("qtde_itens"));
					p.setDtPedido(rsPedido.getDate("dtpedido"));
					p.setStatus(rsPedido.getString("status"));
					p.setIdCliente(rsPedido.getInt("id_cliente"));
					p.setEntrega(en);
					p.setPrecoTotal(rsPedido.getDouble("total"));
					pedidos.add(p);
				}
				rsCard.close();
				c.setCartao(cartoes);
				
				c.setEndereco(enderecos);
				
				c.setPedido(pedidos);
				
				clientes.add(c);
			}
			return clientes;
		} catch (SQLException ex) {
			ex.printStackTrace();
		} finally {
			connection.close();
		}
		return null;
	}
	

}
