package livro.dominio;

public class CupomDesconto extends EntidadeDominio {
	private String cupom;
	private double valor;
	public String getCupom() {
		return cupom;
	}
	public void setCupom(String cupom) {
		this.cupom = cupom;
	}
	public double getValor() {
		return valor;
	}
	public void setValor(double valor) {
		this.valor = valor;
	}

}
