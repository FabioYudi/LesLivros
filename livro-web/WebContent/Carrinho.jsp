<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link type="text/css" href="resources/estilo.css" rel="stylesheet">
<link type="text/css" href="resources/css/cupom.css" rel="stylesheet">

<%
	Cliente c = (Cliente) request.getSession().getAttribute("cli");
	CupomDesconto cup = (CupomDesconto) request.getSession().getAttribute("cupom");
	

	String stringId = (String) request.getSession().getAttribute("usuarioID");
	if (stringId == null) {
		stringId = "0";
	}
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

<title>Finalizar Compra</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-item.css" rel="stylesheet">



<!-- Navigation -->
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
</head>
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
								<td>teste</td>
								<td>Item</td>
								<td>Preço</td>
								<td style="padding-left: 5%">Quantidade</td>
								<td>Subtotal</td>
								<td></td>

								<%
									if (res != null) {
										if (res.getMsg() == null) {
											out.print("");
										} else
											out.print("<h5 class='text-warning'>" + res.getMsg() + "</h5>");
									}
								
									if(cupom != null){
										if(cupom.getMsg() == null){
											out.print("");
										}else
											out.print("<h5 class='text-warning'>" + cupom.getMsg() + "</h5>");
										
									}
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
									int qt = 0;
									if (item.size() != 0) {

										for (int i = 0; i < item.size(); i++) {
											
											
											sb.setLength(0);
											Item it = item.get(i);
											Livros l = it.getLivro();
											qt += it.getQuantidade();
											item.get(i).setValorItem(l.getValor());
											sb.append("<tr>");
											sb.append("<td class='col-xs-6 col-md-3'>");
											sb.append("<div>");
											sb.append(
													"<img style='width:80px;' src='https://images-submarino.b2w.io/produtos/01/00/item/123806/5/123806573_1GG.jpg' class='img-thumbnail' ");
											sb.append("</div>");
											sb.append("</td>");
											sb.append("<td style='padding-right: 35%'; position: absolute>");
											sb.append(l.getTitulo());
											sb.append("</td>");
											sb.append("<td style='padding-right: 11%'; position: absolute>");
											sb.append("R$" + String.format("%.2f", l.getValor()));
											sb.append("</td>");

											//quantidade
											if (it.getQuantidade() < 0) {
												it.setQuantidade(0);
											}
											sb.append("<td>");
											sb.append("<div class='row'>");
											sb.append("<form action='Carrinho' method='POST'>");
											sb.append(
													"<button type='submit' name='operacao' value='SUBTRAIR'  class='btn btn-primary' style='margin-right: 30px'><i class='material-icons'>remove</i></button>");
											sb.append("<input type='hidden' name='txtId' value='" + l.getId() + "'>");
											sb.append("</form>");
											sb.append(it.getQuantidade());
											sb.append("<form action='Carrinho' method='POST' style='padding-right: 100px; '>");
											sb.append("<input type='hidden' name='txtId' value='" + l.getId() + "'>");

											sb.append(
													"<button type='submit' name='operacao' value='SOMAR' class='btn btn-primary' style='' ><i class='material-icons' >add</i></button>");
											sb.append("</form>");

											sb.append("</div>");
											sb.append("</td>");
											//quantidade
											
											int qtdeLivro = it.getQuantidade();
											double preco = it.getLivro().getValor();
											double frete = 0;
											frete += (item.get(i).getLivro().getAltura() + item.get(i).getLivro().getLargura()
													+ item.get(i).getLivro().getProfundidade()) * qt;
											p.setFrete(frete);

											sb.append("<td  id='subtotal" + i + "'>");
											subTotal = qtdeLivro * preco;
											precoTotal = precoTotal + subTotal;
											p.setPrecoTotal(precoTotal);
											sb.append("R$" + String.format("%.2f", subTotal));

											sb.append("<script>$('#subtotal" + i + "').html('" + String.format("%.2f", subTotal)
													+ "R$');</script>");

											sb.append("<td><a href='Carrinho?operacao=REMOVER&id=" + l.getId() + "'>Remover</a>");
											sb.append("</td>");
											sb.append("</td>");
											sb.append("</tr>");
											out.print(sb.toString());
											
											


										}
										p.setQtdItens(qt);
										request.getSession().setAttribute("mapaCarrinho", map);

									}
									request.getSession().setAttribute("pe", p);

								}
								if (map == null || map.size() == 0 || item.size() == 0) {
									out.print("<tr><td>Não há itens no seu carrinho</td></tr>");
								}
							%>


						</tbody>
					</table>
					<div class="table-responsive">
						<table class="table table-striped">
							<tbody>
								<div style="float: left">
									<form action="SalvarCupom" method="post">

										<input class="input-class"
											placeholder="Aplicar Cupom De Desconto" type="text"
											id="txtCup" name="txtCup" size="25px">

										<button type='submit' name='operacao' value='APLICAR'
											class='btn btn-danger'
											style='margin-left: 10px; height: 47px'>Aplicar</button>
									</form>
								</div>
							</tbody>
						</table>
					</div>

					<div class="table-responsive">
						<table class="table ">
							<tbody>

								<%
									String txtId = (String) request.getSession().getAttribute("usuarioID");
									StringBuilder sb = new StringBuilder();
									int id = Integer.parseInt(stringId);
									if (map == null || map.size() == 0 || item.size() == 0) {
										out.print("<tr><td></td></tr>");
									} else {
										Pedido p = map.get(id);
										if (cup != null) {
											p.setCupom(cup);
											String codigo = (String) cup.getCupom();
											double cupo = cup.getValor();
											p.getCupom().setCupom(codigo);
											p.getCupom().setValor(cupo);
											out.print("<tr>");
											out.print("<td>");
											out.print("Cupom Aplicado: <b>" + p.getCupom().getCupom() + "</b>");
											out.print("</td>");
											out.print("<td style='padding-right:50%'>");
											out.print("Desconto: <b style='color:green' >" + "R$"
													+ String.format("%.2f", p.getCupom().getValor()) + "</b>");
											out.print("</td>");
											if (p.getPrecoTotal() < 0) {
												p.setPrecoTotal(0);
											}
											out.print("</tr>");

										} else {

											if (request.getSession().getAttribute("selecionado") != null) {

												String indice = (String) request.getSession().getAttribute("i");
												int j = Integer.parseInt(indice);
												String cep = c.getEndereco().get(j).getCep()
														.substring(c.getEndereco().get(j).getCep().length() - 2);
												double numCep = Double.parseDouble(cep);
												p.setFrete(p.getFrete() + numCep);
												p.setPrecoTotal(p.getPrecoTotal() + p.getFrete());
												if (p.getPrecoTotal() < 0) {
													p.setPrecoTotal(0);
												}
												out.print("<td style='padding-left:80%'><h4>Total:</h4> " + "<h2 style='color:red'>" + "R$"
														+ String.format("%.2f", p.getPrecoTotal()) + "</h2>");
												out.print("<form action='Finalizar' method='POST'><button type='submit' name='operacao' class='btn btn-warning' value='FINALIZAR'>Finalizar Compra</button></td></form>");


											} else {
												
												out.print("<td style='padding-left:80%'><h4>Total:</h4> " + "<h2 style='color:red'>" + "R$"
														+ String.format("%.2f", p.getPrecoTotal()) + "</h2>");
												out.print("<form action='Finalizar' method='POST'><button type='submit' name='operacao' class='btn btn-warning' disabled='true' value='FINALIZAR'>Finalizar Compra</button></td></form>");
												out.print("<tr><td><h6 align='center'>Selecione um endereço para finalizar a compra</p></h6></tr>");


											}
										}
										out.print("<tr>");
										out.print("</tr>");
										out.print("<td>");

										out.print("</td>");
										out.print("<div style='padding-left:80%'>");
										if (cup != null) {
											p.setPrecoTotal(p.getPrecoTotal());
											if (p.getPrecoTotal() < 0) {
												p.setPrecoTotal(0);
											}
											if (request.getSession().getAttribute("selecionado") != null) {
												String indice = (String) request.getSession().getAttribute("i");
												int j = Integer.parseInt(indice);
												String cep = c.getEndereco().get(j).getCep()
														.substring(c.getEndereco().get(j).getCep().length() - 2);
												double numCep = Double.parseDouble(cep);
												p.setFrete(p.getFrete() + numCep);
												p.setPrecoTotal(p.getPrecoTotal() + p.getFrete());
												if (p.getPrecoTotal() < 0) {
													p.setPrecoTotal(0);
												}
												out.print("<h4>Total:</h4> " + "<strike><h2 style='color:red'>" + "R$"
														+ String.format("%.2f", p.getPrecoTotal()) + "</h2></strike>");

											} else {
												
												out.print("<h4>Total:</h4> " + "<strike><h2 style='color:red'>" + "R$"
														+ String.format("%.2f", p.getPrecoTotal()) + "</h2></strike>");
												
											}
											p.setPrecoTotal(p.getPrecoTotal() - p.getCupom().getValor());
											p.setCupom(cup);
											if (p.getPrecoTotal() < 0) {
												p.setPrecoTotal(0);
											}
											out.print("" + "<h2 style='color:green'>" + "-R$" + String.format("%.2f", p.getCupom().getValor())
													+ "</h2>");
											out.print("________________________ " + "<h2 style='color:red'>" + "R$"
													+ String.format("%.2f", p.getPrecoTotal()) + "</h2>");
											if(usuario != null){
												if (request.getSession().getAttribute("selecionado") != null) {
												out.print("<form action='Finalizar' method='POST'><button type='submit' name='operacao' class='btn btn-warning'  value='FINALIZAR'>Finalizar Compra</button></form>");
												}
												else{
													out.print("<form action='Finalizar' method='POST'><button type='submit' name='operacao' class='btn btn-warning' disabled='true' value='FINALIZAR'>Finalizar Compra</button></form>");
													out.print("<tr><td><h4 align='center'>Selecione um endereço para finalizar a compra</p></h4></tr>");
												}
											}else{
												out.print("<form action='Finalizar' method='POST'><button type='submit' name='operacao' class='btn btn-warning' disabled='true' value='FINALIZAR'>Finalizar Compra</button></form>");
												out.print("<tr><td><h4 align='center'>Selecione um endereço para finalizar a compra</p></h4></tr>");


											}

									} else {
										p.setCupom(null);
										

									}
										out.print("</div>");

									}
								%>




							</tbody>
						</table>
					</div>

					<div class="table-responsive">
						<table class="table table-striped">

							<thead>
								<th><h5>Endereço de entrega</h5></th>
							</thead>
							<tbody>




								<%
									if (map == null || map.size() == 0 || item.size() == 0) {
										out.print("<tr><td>Não há itens no seu carrinho</td></tr>");
									} else {
										Pedido p = map.get(id);
										item = p.getItem();
										if (usuario == null) {
											out.print("<td><h5 style='color:red'>Faça login para calcular o frete e finalizar a compra</h5>");
											out.print("<a class='nav-link' data-toggle='modal' href='#myModal'>Fazer Login</a></td>");
										} else if (usuario != null && request.getSession().getAttribute("selecionado") == null) {
											
											out.print("<tr><td>");
											out.print("<a  class='nav-link' data-toggle='modal' href='#endereco'>");
											out.print(
													"<button  style='position: absolute;' class='btn btn-danger'>Selecione um endereço para entrega</button></a>");
											out.print("</td></tr>");
											//out.print("<button class='btn btn-danger'>Selecione um endereço para entrega</button></a></td></tr>");
										} else if (usuario != null && request.getSession().getAttribute("selecionado").equals("true")) {
											String indice = (String) request.getSession().getAttribute("i");
											int j = Integer.parseInt(indice);
											p.setEntrega(c.getEndereco().get(j));
											p.setIdCliente(id);
											out.print("<tr>");
											out.print("<td>");
											out.print("<h5><address>");
											out.print(c.getNome() + "<br>");
											out.print(c.getEndereco().get(j).getTipoLogradouro() + " " + c.getEndereco().get(j).getLogradouro()
													+ ", " + c.getEndereco().get(j).getNumero() + "<br>");
											out.print(c.getEndereco().get(j).getBairro() + " - " + c.getEndereco().get(j).getCidade().getNome()
													+ " - " + c.getEndereco().get(j).getCidade().getEstado().getNome() + "<br>");
											out.print(c.getEndereco().get(j).getCep());

											out.print("</address></h5>");
											out.print("<br>");
											out.print("<a class='nav-link' data-toggle='modal' href='#endereco'>");
											out.print("<button class='btn btn-danger'>Selecionar outro endereço</button></a>");
											out.print("</td>");
											out.print("<td>");
											out.print("<h6 style='color:red; padding-right:100px;'>Frete= " + "R$"
													+ String.format("%.2f", p.getFrete()) + " </h6>");
											out.print("</td>");

											out.print("</tr>");
										

										}
									}
								%>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>

<!-- Modal LOGIN -->
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



<!-- Modal LOGIN -->




<!-- Modal LISTAGEM DE ENDEREÇOS-->
<div id="endereco" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="padding-right: 30px">Endereço de entrega</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>

			</div>


			<div class="modal-body">
				<div class="container">

					<table class="table table-hover">
						<thead>
							<tr>
								<th>Endereço</th>
								<th></th>

							</tr>
						</thead>
						<tbody>
							<%
								if (!stringId.trim().equals("0")) {
									if (c.getEndereco().size() == 0) {
										out.print("<h6 align='center'>Você não possui endereços cadastrados</h6>");
										out.print("");
									}

									boolean cadastrar = false;
									if (cadastrar == false) {

										for (int i = 0; i < c.getEndereco().size(); i++) {
											out.print("<tr>");
											out.print("<td>");
											out.print("<address>");
											out.print(c.getNome() + "<br>");
											out.print(c.getEndereco().get(i).getTipoLogradouro() + " "
													+ c.getEndereco().get(i).getLogradouro() + ", " + c.getEndereco().get(i).getNumero()
													+ "<br>");
											out.print(
													c.getEndereco().get(i).getBairro() + "-" + c.getEndereco().get(i).getCidade().getNome()
															+ "-" + c.getEndereco().get(i).getCidade().getEstado().getNome() + "<br>");
											out.print(c.getEndereco().get(i).getCep());

											out.print("</address>");
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
									}
								}

								
							%>
						</tbody>


					</table>
					<div align="center">
						<a href="FormEndereco.jsp"><button class="btn btn-danger">Cadastrar
								novo endereço</button></a>
					</div>

				</div>


			</div>
		</div>
	</div>


	<!-- Modal LISTAGEM DE ENDEREÇOS -->



	
</html>