<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String stringId = (String) request.getSession().getAttribute("usuarioID");
	if (stringId != null) {
		if (!stringId.trim().equals("0")) {
			if (request.getSession().getAttribute("usuariodeslogado") != null) {
				Map<Integer, Pedido> mapaUsuarios = (Map<Integer, Pedido>) request.getSession()
						.getAttribute("mapaUsuarios");
				Pedido p = mapaUsuarios.get(0);
				mapaUsuarios.put(Integer.parseInt(stringId), p);
				mapaUsuarios.remove(0);
				request.getSession().removeAttribute("usuariodeslogado");
				request.getSession().setAttribute("mapaUsuarios", mapaUsuarios);
			}
		}
	}
	if (request.getSession().getAttribute("redirecionar") == null) {
		request.getSession().setAttribute("redirecionar", "1");
		response.sendRedirect("Carrinho.jsp");
		return;
	}
	request.getSession().setAttribute("redirecionar", null);

	Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
	Resultado cupom = (Resultado) request.getSession().getAttribute("resultadoCupom");
	Resultado res = (Resultado) request.getSession().getAttribute("resultadoLivro");
	List<Item> item = new ArrayList<Item>();
	String usuario = (String) request.getSession().getAttribute("username");
%>
<head>
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
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
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


		</ul>
	</div>
</div>
</nav>
<!-- Navigation -->
<body>

	<div class="container">
		<div class="card card-outline-secondary my-4">
			<div class="card-header">Carrinho de compras</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-striped">
						<thead>
							<th><h3>Meu carrinho</h3></th>
						</thead>
						<tbody>
							<tr>
								<td>Item</td>
								<td>Preço</td>
								<td align="center">Quantidade</td>
								<td>Subtotal</td>
								<td></td>
								<%
									if (res != null) {
										if (res.getMsg() == null) {
											out.print("<td> </td>");
										}else
											out.print(res.getMsg());
									}

									System.out.println(res.getMsg());
								%>



							</tr>
							<tr>
							</tr>




							<%
								double subTotal = 0;
								double desconto = 0;
								double precoTotal = 0;
								double precoFrete = 0;
								if (map != null) {

									String txtId = (String) request.getSession().getAttribute("usuarioID");
									int id = Integer.parseInt(txtId);
									//Map<Integer, Resultado> mapaResultado = (Map<Integer, Resultado>)request.getSession().getAttribute("mapaResultado");
									StringBuilder sb = new StringBuilder();
									Pedido p = map.get(id);
									item = p.getItem();

									if (item.size() != 0) {

										for (int i = 0; i < item.size(); i++) {
											sb.setLength(0);
											Item it = item.get(i);
											Livros l = it.getLivro();
											sb.append("<tr>");
											sb.append("<td>");
											sb.append(l.getTitulo());
											sb.append("</td>");

											sb.append("<td>");
											sb.append("R$" + String.format("%.2f", l.getValor()));
											sb.append("</td>");

											//quantidade

											sb.append("<td style='padding-left:105px'>");
											sb.append("<form action='Carrinho' method='POST'>");
											sb.append("<div class='row'>");
											sb.append("<button type='submit' name='operacao' value='SUBTRAIR'  class='btn btn-primary' style='margin-left: 40px'><i class='material-icons'>remove</i></button>");
											sb.append("<input type='hidden' name='txtId' value='" + l.getId() + "'>");
											sb.append("</form>");
											sb.append("<h5 style='padding-left: 30px; border-color: #000000'>");
											sb.append(it.getQuantidade());
											sb.append("</h5>");
											sb.append("<form action='Carrinho' method='POST'>");
											sb.append("<input type='hidden' name='txtId' value='" + l.getId() + "'>");
											sb.append(
													"<button type='submit' name='operacao' value='SOMAR' class='btn btn-primary' style='margin-left: 30px'><i class='material-icons' >add</i></button>");
											sb.append("</form>");
											sb.append("</a>");
											sb.append("</td>");
											sb.append("</div>");
											//quantidade

											int qtdeLivro = it.getQuantidade();
											double preco = it.getLivro().getValor();

											sb.append("<td  id='subtotal" + i + "'>");
											subTotal = qtdeLivro * preco;
											precoTotal = precoTotal + qtdeLivro * preco;
											sb.append("R$" + String.format("%.2f", subTotal));

											sb.append("<script>$('#subtotal" + i + "').html('" + String.format("%.2f", subTotal)
													+ "R$');</script>");

											sb.append("<td><a href='Carrinho?operacao=REMOVER&id=" + l.getId() + "'>Remover</a></td>");
											sb.append("</td>");
											sb.append("</tr>");
											out.print(sb.toString());

										}

										request.getSession().setAttribute("mapaCarrinho", map);
										precoTotal = precoTotal + precoFrete;
									}
								}
								if (map == null || map.size() == 0 || item.size() == 0) {
									out.print("<tr><td>Não há itens no seu carrinho</td></tr>");
								}
							%>
							<%
								StringBuilder sb = new StringBuilder();
								System.out.println("usu" + usuario);
								if (usuario == null) {
									sb.append("<td><h5>Faça login para calcular o frete e finalizar a compra</h5></td>");
								} else {
									sb.append("<td><a href='Carrinho?operacao=ENDERECO&id=");
									sb.append(stringId);
									sb.append(">");
									sb.append("<button>Selecione um endereço para entrega</button></a></td>");
								}
							%>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

<!-- Modal HTML -->
<div id="myModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="padding-right: 30px">Login</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>

			</div>
			<div class="modal-body">

				<form action="Login" method="post" style="padding-left: 20%">

					<div class="form-group">
						<label for="username">Usuario:</label> <input size="21"
							type="text" id="username" name="username" required="true" />
					</div>

					<div class="form-group">
						<label for="senha" style="padding-left: 11px">Senha:</label> <input
							size="21" type="password" id="senha" name="senha" required="true"
							style="margin-right: 10px" />
					</div>
					<input type='submit' id='operacao' name='operacao' value='LOGAR'
						class='btn btn-primary' style="margin-left: 110px" />
			</div>



			</form>
			<p class="bg-info" align="center">
				<small>Não possui cadastro? Cadastre-se <a
					href="FormCliente.jsp" style="color: red; font-size: 15px">AQUI</a></small>
			</p>
		</div>

	</div>
</div>
</div>


<!-- Modal HTML -->
</html>