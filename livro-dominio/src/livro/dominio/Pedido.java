package livro.dominio;

import java.util.Date;
import java.util.List;

public class Pedido extends EntidadeDominio {
	
	private List<Item> item;
	private int qtdItens;
	private Date dtPedido;
	private String status;
	private CupomDesconto cupom;
	private double frete;
	private Endereco entrega;
	private double precoTotal;
	private List<Cartao> cartao;
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
	public int getQtdItens() {
		return qtdItens;
	}
	public void setQtdItens(int qtdItens) {
		this.qtdItens = qtdItens;
	}
	public Endereco getEntrega() {
		return entrega;
	}
	public void setEntrega(Endereco entrega) {
		this.entrega = entrega;
	}
	public List<Cartao> getCartao() {
		return cartao;
	}
	public void setCartao(List<Cartao> cartao) {
		this.cartao = cartao;
	}

}
