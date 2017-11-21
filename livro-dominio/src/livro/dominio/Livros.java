package livro.dominio;

public class Livros extends EntidadeDominio {
		private String codigoLivro;
		private String autor;
	 	private String ano;
	 	private Boolean status;
	 	private String titulo;
	 	private String editora;
	 	private String edicao;
	 	private String isbn;
	 	private String numPg;
	 	private String sinopse;
	 	private double altura;
	 	private double peso;
	 	private double profundidade;
	 	private LivroLog livroLog;
	 	private Livros livro;
	 	private double valor;
	 	private int estoque;
	 	
	 	public String getCodigoLivro() {
			return codigoLivro;
		}
		public void setCodigoLivro(String codigoLivro) {
			this.codigoLivro = codigoLivro;
		}
		public String getAutor() {
			return autor;
		}
		public void setAutor(String autor) {
			this.autor = autor;
		}
		public String getAno() {
			return ano;
		}
		public void setAno(String ano) {
			this.ano = ano;
		}
		public Boolean getStatus() {
			return status;
		}
		public void setStatus(Boolean status) {
			this.status = status;
		}
		public String getTitulo() {
			return titulo;
		}
		public void setTitulo(String titulo) {
			this.titulo = titulo;
		}
		public String getEditora() {
			return editora;
		}
		public void setEditora(String editora) {
			this.editora = editora;
		}
		public String getEdicao() {
			return edicao;
		}
		public void setEdicao(String edicao) {
			this.edicao = edicao;
		}
		public String getIsbn() {
			return isbn;
		}
		public void setIsbn(String isbn) {
			this.isbn = isbn;
		}
		public String getNumPg() {
			return numPg;
		}
		public void setNumPg(String numPg) {
			this.numPg = numPg;
		}
		public String getSinopse() {
			return sinopse;
		}
		public void setSinopse(String sinopse) {
			this.sinopse = sinopse;
		}
		public double getAltura() {
			return altura;
		}
		public void setAltura(double altura) {
			this.altura = altura;
		}
		public double getPeso() {
			return peso;
		}
		public void setPeso(double peso) {
			this.peso = peso;
		}
		public double getProfundidade() {
			return profundidade;
		}
		public void setProfundidade(double profundidade) {
			this.profundidade = profundidade;
		}
		public LivroLog getLivroLog() {
			return livroLog;
		}
		public void setLivroLog(LivroLog livroLog) {
			this.livroLog = livroLog;
		}
		public Livros getLivro() {
			return livro;
		}
		public void setLivro(Livros livro) {
			this.livro = livro;
		}
		public double getValor() {
			return valor;
		}
		public void setValor(double valor) {
			this.valor = valor;
		}
		public int getEstoque() {
			return estoque;
		}
		public void setEstoque(int estoque) {
			this.estoque = estoque;
		}
		

}
