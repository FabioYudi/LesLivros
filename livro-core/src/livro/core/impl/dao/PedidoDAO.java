package livro.core.impl.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import livro.dominio.Cartao;
import livro.dominio.Cliente;
import livro.dominio.Endereco;
import livro.dominio.EntidadeDominio;
import livro.dominio.Item;
import livro.dominio.Livros;
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
			sql.append("INSERT INTO pedidos(qtde_itens, dtpedido, status,  id_cliente, id_endereco, total) "
					+ "VALUES (?,?,?,?,?,?)");

			pst = connection.prepareStatement(sql.toString(), Statement.RETURN_GENERATED_KEYS);
			Date date = new Date(pedido.getDtPedido().getTime());
			pst.setInt(1, pedido.getQtdItens() );
			pst.setDate(2, date);
			pst.setString(3, pedido.getStatus());
			
			pst.setInt(4, pedido.getIdCliente());
			pst.setInt(5, pedido.getEntrega().getId());
			pst.setDouble(6, pedido.getPrecoTotal());

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
						"INSERT INTO itens( id_pedido, quantidade, id_livro) VALUES (?, ?, ?)");
				pst.setInt(1, pedido.getId());
				pst.setInt(2, item.getQuantidade());
				pst.setInt(3, l.getId());
				
				
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
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
