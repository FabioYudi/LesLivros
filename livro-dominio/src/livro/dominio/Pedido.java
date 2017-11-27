package livro.dominio;

import java.util.Date;
import java.util.List;

public class Pedido extends EntidadeDominio {
	
	private List<Item> item;
	private Date dtPedido;
	private String status;
	private Pessoa usuario;
	private CupomDesconto cupom;
	private double frete;
	private List<Endereco> entrega;
	private double precoTotal;
	public List<Item> getItem() {
		return item;
	}
	public void setItem(List<Item> item) {
		this.item = item;
	}
	public Date getDtPedido() {
		return dtPedido;
	}
	public void setDtPedido(Date dtPedido) {
		this.dtPedido = dtPedido;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getPrecoTotal() {
		return precoTotal;
	}
	public void setPrecoTotal(double precoTotal) {
		this.precoTotal = precoTotal;
	}
	public Pessoa getUsuario() {
		return usuario;
	}
	public void setUsuario(Pessoa usuario) {
		this.usuario = usuario;
	}
	public List<Endereco> getEntrega() {
		return entrega;
	}
	public void setEntrega(List<Endereco> entrega) {
		this.entrega = entrega;
	}
	public double getFrete() {
		return frete;
	}
	public void setFrete(double frete) {
		this.frete = frete;
	}
	public CupomDesconto getCupom() {
		return cupom;
	}
	public void setCupom(CupomDesconto cupom) {
		this.cupom = cupom;
	}

}
