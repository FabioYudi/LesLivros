package livro.dominio;

import java.util.Date;

public class CupomDesconto extends EntidadeDominio {
	private String cupom;
	private double valor;
	private Date dtExpiracao;
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
	public Date getDtExpiracao() {
		return dtExpiracao;
	}
	public void setDtExpiracao(Date dtExpiracao) {
		this.dtExpiracao = dtExpiracao;
	}

}
