package livro.dominio;

public class Telefone extends EntidadeDominio{
	private String numero;
	private String codArea;
	private int tp;
	private Cliente cliente;
	
	
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getCodArea() {
		return codArea;
	}
	public void setCodArea(String codArea) {
		this.codArea = codArea;
	}
	
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public int getTp() {
		return tp;
	}
	public void setTp(int tp) {
		this.tp = tp;
	}
}
