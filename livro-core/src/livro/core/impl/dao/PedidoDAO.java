package livro.core.impl.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import livro.dominio.Cartao;
import livro.dominio.Cidade;
import livro.dominio.Cliente;
import livro.dominio.CupomDesconto;
import livro.dominio.Endereco;
import livro.dominio.EntidadeDominio;
import livro.dominio.Estado;
import livro.dominio.Item;
import livro.dominio.Livros;
import livro.dominio.Pais;
import livro.dominio.Pedido;

public class PedidoDAO extends AbstractJdbcDAO {
	public PedidoDAO() {
		// TODO Auto-generated constructor stub
		super("pedidos","id_pedido");
	}

	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {
		openConnection();
		PreparedStatement pst = null;
		Pedido pedido = (Pedido)entidade;
		
		

		try {
			connection.setAutoCommit(false);
			//ClienteDAO cliDAO = new ClienteDAO();
			//cliDAO.connection = connection;
			//cliDAO.ctrlTransaction = false;
			//cliDAO.salvar(cliente);		
			
			

			StringBuilder sql = new StringBuilder();
			sql.append("INSERT INTO pedidos(qtde_itens, dtpedido, status,  id_cliente, id_endereco, total, frete) "
					+ "VALUES (?,?,?,?,?,?,?)");

			pst = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			Date date = new Date(pedido.getDtPedido().getTime());
			pst.setInt(1, pedido.getQtdItens() );
			pst.setDate(2, date);
			pst.setString(3, pedido.getStatus());
			
			pst.setInt(4, pedido.getIdCliente());
			pst.setInt(5, pedido.getEntrega().getId());
			pst.setDouble(6, pedido.getPrecoTotal());
			pst.setDouble(7, pedido.getFrete());

			pst.executeUpdate();
			
			
			ResultSet rs = pst.getGeneratedKeys();
			int idPedido = 0;
			if(rs.next())
				idPedido = rs.getInt(1);
			pedido.setId(idPedido);
			for (int i = 0; i < pedido.getItem().size(); i++) {
				Item item = pedido.getItem().get(i);
				Livros l = pedido.getItem().get(i).getLivro();
				pst = connection.prepareStatement(
						"INSERT INTO itens( id_pedido, quantidade, id_livro, valor_item) VALUES (?, ?, ?, ?)");
				pst.setInt(1, pedido.getId());
				pst.setInt(2, item.getQuantidade());
				pst.setInt(3, l.getId());
				pst.setDouble(4, item.getValorItem());
				
				
				pst.executeUpdate();
			}
			int id = 0;
			if (rs.next())
				id = rs.getInt(1);
		
			

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
	public void alterar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		openConnection();
		PreparedStatement pst = null;
		Pedido pedido = (Pedido)entidade;
		int idPedido = pedido.getId();
		try {
			connection.setAutoCommit(false);

			pst = connection.prepareStatement("UPDATE pedidos SET status = ? WHERE id_pedido = " + idPedido);
			pst.setString(1, pedido.getStatus());
			pst.executeUpdate();
			if(pedido.getCartao() != null)
			{
				for(int i = 0; i < pedido.getCartao().size() ; i ++)
				{
					Cartao c = pedido.getCartao().get(i);
					pst = connection.prepareStatement("INSERT INTO cartao_pedido (id_cartao, id_pedido, valor_compra) VALUES(?,?,?)");
					pst.setInt(1, c.getId());
					pst.setInt(2, idPedido);
					pst.setDouble(3, c.getValorCompra());
					pst.executeUpdate();
				}
			}
			if(pedido.getCupom() != null)
			{

				CupomDesconto c = pedido.getCupom();
				pst = connection.prepareStatement("INSERT INTO cupom_pedido (id_cupom, id_pedido) VALUES(?,?)");
				pst.setInt(1, c.getId());
				pst.setInt(2, idPedido);
				pst.executeUpdate();
								
			}		
			connection.commit();		
		} catch (SQLException e) {
			try {
				pst.close();
				connection.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();			
		}finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		try {
			openConnection();
			Pedido p = (Pedido)entidade;
			
			PreparedStatement pst = null;
			pst = connection.prepareStatement("SELECT * FROM pedidos "
					+ "INNER JOIN endereco on (endereco.id = pedidos.id_endereco) WHERE 1=1 ");
			ResultSet pstPedido = pst.executeQuery();
			List<EntidadeDominio> pedidos = new ArrayList<EntidadeDominio>();
			while(pstPedido.next())
			{
				Endereco e = new Endereco();
				Pedido pedido = new Pedido();
				e.setLogradouro(pstPedido.getString("logradouro"));
				e.setBairro(pstPedido.getString("bairro"));
				e.setCep(pstPedido.getString("numero"));
				Cidade cidade = new Cidade();
				cidade.setNome(pstPedido.getString("cidade"));
				Estado estado = new Estado();
				estado.setNome(pstPedido.getString("estado"));
				Pais pais = new Pais();
				pais.setNome(pstPedido.getString("pais"));
				estado.setPais(pais);
				cidade.setEstado(estado);
				e.setCidade(cidade);
				pedido.setEntrega(e);
				pedido.setId(pstPedido.getInt("id_pedido"));
				pedido.setId(pstPedido.getInt("qtde_itens"));
				pedido.setDtPedido(pstPedido.getDate("dtPedido"));
				pedido.setStatus(pstPedido.getString("status"));
				pedido.setIdCliente(pstPedido.getInt("id_cliente"));
				pedido.setPrecoTotal(pstPedido.getDouble("total"));
				pedido.setFrete(pstPedido.getDouble("frete"));
				
				
				pst = connection.prepareStatement("SELECT * FROM itens"
						+ " INNER JOIN livros ON "
						+ "(itens.id_livro = livros.id) WHERE 1=1");
				ResultSet itensPedido = pst.executeQuery();
				List<Item> itens = new ArrayList<Item>();
				while(itensPedido.next())
				{
					Livros l = new Livros();
					Item i = new Item();
					i.setQuantidade(itensPedido.getInt("quantidade"));
					i.setValorItem(itensPedido.getDouble("valor_item"));
					l.setTitulo(itensPedido.getString("titulo"));
					l.setValor(itensPedido.getDouble("valor"));
					i.setLivro(l);
					itens.add(i);
				}
				itensPedido.close();
				pedido.setItem(itens);
				pedidos.add(pedido);
			}
			pstPedido.close();
	
			return pedidos;
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
			connection.close();
		}
		return null;
	}

}
