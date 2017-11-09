package livro.dominio;

public class Cartao extends EntidadeDominio{
	private String numero;
	private String titular;
	private String codigo;
	private String validade;
	private Cliente cliente;
	private String bandeira;
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getTitular() {
		return titular;
	}
	public void setTitular(String titular) {
		this.titular = titular;
	}
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getValidade() {
		return validade;
	}
	public void setValidade(String vallidade) {
		this.validade = vallidade;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public String getBandeira() {
		return bandeira;
	}
	public void setBandeira(String bandeira) {
		this.bandeira = bandeira;
	}

}
