package livro.core.impl.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import livro.dominio.Cartao;
import livro.dominio.Cliente;
import livro.dominio.EntidadeDominio;
import livro.dominio.Pedido;

public class PedidoDAO extends AbstractJdbcDAO {
	public PedidoDAO() {
		// TODO Auto-generated constructor stub
		super("Pedidos","id_pedido");
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
			sql.append("INSERT INTO pedidos(qtde_itens, dtpedido, status, id_cup, id_cliente, id_endereco, total) "
					+ "VALUES (?,?,?,?,?,?,?)");

			pst = connection.prepareStatement(sql.toString());
			Date date = new Date(pedido.getDtPedido().getTime());
			pst.setInt(1, pedido.getQtdItens() );
			pst.setDate(2, date);
			pst.setString(3, pedido.getStatus());
			if(pedido.getCupom() == null) {
				pst.setTimestamp(4, null);
			}else {
			pst.setInt(4, pedido.getCupom().getId());
			}
			pst.setInt(5, pedido.getIdCliente());
			pst.setInt(6, pedido.getEntrega().getId());
			pst.setDouble(7, pedido.getPrecoTotal());

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
	public void alterar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
