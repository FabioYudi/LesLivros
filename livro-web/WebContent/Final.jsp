<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="resources/css/final.css" rel="stylesheet">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Meu Carrinho</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-item.css" rel="stylesheet">



<!-- Navigation -->

<%
	//declarações de sessão
	Cliente c = (Cliente) request.getSession().getAttribute("cli");

	String usuario = (String) request.getSession().getAttribute("username");
	Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
	String txtId = (String) request.getSession().getAttribute("usuarioID");
	int id = Integer.parseInt(txtId);
	Pedido p = map.get(id);
	List<Item> item = new ArrayList<Item>();
%>



<nav class="navbar navbar-expand-lg navbar-light bg-warning fixed-top">
<div class="container">
	<a class="navbar-brand" href="index.jsp">LES LIVROS</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarResponsive" aria-controls="navbarResponsive"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
		<ul class="navbar-nav ml-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp">Home
					<span class="sr-only">(current)</span>
			</a></li>


			<%
				if (request.getSession().getAttribute("username") == null) {
					out.print("<li class='nav-item'>");
					out.print(" <a class='nav-link' href='FormCliente.jsp'>Cadastre-se</a>");
					out.print(" </li>");
					out.print("<li class='nav-item'>");
					out.print(" <a class='nav-link' data-toggle='modal' href='#myModal'>Login</a>");
					out.print(" </li>");
				} else {
					out.print("<li class='nav-item'>");
					out.print(" <a class='nav-link' href='Painel.jsp'>Área do Cliente</a>");
					out.print(" </li>");
					out.print("<li class='nav-item'>");
					out.print(" <a class='nav-link' href='Sair?operacao=SAIR'>Sair</a>");
					out.print(" </li>");
					out.print("<li class='nav-item' style='padding-left:50px; padding-top:10px'>");
					out.print("<h6 style='color:white'> Olá, ");
					out.print(" " + usuario + "</h6>");
					out.print("</li>");

				}
			%>
			<li class="nav-item"><a class="nav-link" href="Carrinho.jsp"><i
					class="material-icons">local_grocery_store</i></a></li>

		</ul>
	</div>
</div>
</nav>
<title>Finalização</title>
</head>
<body>
	<div class="container">
		<table class="table table-striped "
			style="height: 100px; width: 400px">
			<thead class="bg-inverse">
				<th  style="color: red"><h4 align="right">Resumo do Pedido</h4></th>
				<tr>
					<th>PRODUTOS</th>
					<th>Valor</th>

				</tr>
			</thead>
			<tbody>


				<div style="height: 100px; width: 400px; float: right">
					<h2 align="center" style="color: red">Pagamento</h2>
					<div align="center">
					<h5>Selecione a forma de pagamento</h5>
					<a  data-toggle="modal" href="#car">
					<button align="center" class="btn btn-danger">
						Selecionar cartões
					</button>
					</a>
					<button align="center" class="btn btn-danger">
						Selecionar Cupons de troca
					</button>
					</div>
				</div>






				<%
					int tam = c.getPedido().size();
					int i = c.getPedido().size() - 1;

					for (int j = 0; j < c.getPedido().get(i).getItem().size(); j++) {
						out.print("<tr'>");
						out.print("<td class='bg-warning text-black' >");
						out.print("<h6>" + c.getPedido().get(i).getItem().get(j).getLivro().getTitulo() + " x "
								+ c.getPedido().get(i).getItem().get(j).getQuantidade() + "</h6>");
						out.print("</td>");
						out.print("<td class='bg-warning text-black' >");
						out.print("<h6>R$" + String.format("%.2f", c.getPedido().get(i).getItem().get(j).getLivro().getValor())
								+ "</h6>");
						out.print("</td>");

						out.print("</tr>");
					}
					out.print("<tr'>");

					out.print("<td class='bg-faded' >");
					if (c.getPedido().get(i).getCupom() == null) {
						out.print("Não foi utilizado cupom");

					} else {
						out.print("<h6>Cupom Utilizado:  " + c.getPedido().get(i).getCupom().getCupom() + "<br> Valor: R$"
								+ String.format("%.2f", c.getPedido().get(i).getCupom().getValor()) + "</h6>");
					}
					out.print("</td>");

					out.print("</tr>");
					out.print("<tr>");
					out.print("<td class='bg-info text-white'>");
					out.print("Frete: R$" + String.format("%.2f", c.getPedido().get(i).getFrete()));
					out.print("<td class='bg-danger text-white'>Total: R$"
							+ String.format("%.2f", c.getPedido().get(i).getPrecoTotal()) + "</td></td>");
					out.print("</tr>");

					out.print("<address>");

					out.print("</address>");
					out.print("<tr>");

					out.print("</tr>");
				%>


			</tbody>
		</table>

	</div>


	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

<!-- MODAL DE CARTÕES DO CLIENTE  -->
<div id="car" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="padding-right: 30px">Cartões</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>

			</div>
			<div class="modal-body">
				<div class="container">

					<table class="table table-hover">
						<thead>
							<tr>
								<th></th>
								<th></th>

							</tr>
						</thead>
						<tbody>

							<%
								for (int k = 0; k < c.getCartao().size(); k++) {
									out.print("<tr>");
									out.print("<td>");
									
									out.print("<strong>Titular:</strong> " + c.getCartao().get(k).getTitular() + "<br>");
									out.print("<strong>Número:</strong> " + c.getCartao().get(k).getNumero() + "<br>");
									out.print("<strong>Validade:</strong> " + c.getCartao().get(k).getValidade());
									out.print(" <strong> CV:</strong> " + c.getCartao().get(k).getCodigo());

									

									out.print("</td>");
									out.print("<td>");
									out.print("<form action='Carrinho' method='post' style='margin-left:30%; padding-top:20%' >");
									out.print("<input type='hidden' name='txtIndice' value='" + i + "' >");
									out.print(
											"<button name='operacao' type='submit' class='btn btn-warning' value='SELECIONAR'>Selecionar</button>");
									out.print("</form>");
									out.print("</td>");
									out.print("</tr>");
								}
							%>
						</tbody>


					</table>
					<div align="center">
						<a href="FormEndereco.jsp"><button class="btn btn-danger">Cadastrar
								novo cartão</button></a>
					</div>

				</div>


			</div>
		</div>
	</div>
</div>





</html>