package livro.core.impl.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import livro.core.util.ConverteDate;
import livro.dominio.Cliente;
import livro.dominio.CupomDesconto;
import livro.dominio.EntidadeDominio;


public class CupomDAO extends AbstractJdbcDAO {

	public CupomDAO() {
		super("cupom_desconto", "id_cupom");
	}
		// TODO Auto-generated constructor stub
		

	

	@Override
	public void salvar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		openConnection();
		PreparedStatement pst = null;
	
		CupomDesconto cupom = (CupomDesconto) entidade;
		
		
		try {
			connection.setAutoCommit(false);
			StringBuilder sql = new StringBuilder();
			
			
			sql.append("INSERT INTO cupom_desconto (num_cupom, valor, data_expiracao)" + 
					"    VALUES (?, ?, ?);");
			Date date = new Date(cupom.getDtExpiracao().getTime());
			pst = connection.prepareStatement(sql.toString());
			pst.setString(1, cupom.getCupom());
			pst.setDouble(2, cupom.getValor());
			pst.setDate(3, date);
			pst.executeUpdate();
			connection.commit();
		}catch(SQLException ex) {
			connection.rollback();
			ex.printStackTrace();
		}finally {
			connection.close();
		}
		
	}

	@Override
	public void alterar(EntidadeDominio entidade) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<EntidadeDominio> consultar(EntidadeDominio entidade) throws SQLException {
		PreparedStatement pst = null;
		
		StringBuilder sql = new StringBuilder();
		
		sql.append("SELECT * from cupom_desconto WHERE 1=1");
		
		CupomDesconto cupom = (CupomDesconto) entidade;
		if (cupom.getId() != null) {
			sql.append(" and id_cupom =" + cupom.getId());
		}
		try {
			openConnection();
			pst = connection.prepareStatement(sql.toString());
			ResultSet rs = pst.executeQuery();
			List<EntidadeDominio> cupons = new ArrayList<EntidadeDominio>();
			
			
			
			while (rs.next()) {
			CupomDesconto c = new CupomDesconto();
			c.setId(rs.getInt("id_cupom"));
				c.setCupom(rs.getString("num_cupom"));
				c.setValor(rs.getDouble("valor"));
				c.setDtExpiracao(rs.getDate("data_expiracao"));
				
				
				
				cupons.add(c);

			}
			return cupons;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
}
