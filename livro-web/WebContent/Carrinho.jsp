<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	Cliente c = (Cliente) request.getSession().getAttribute("cli");

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
								<td style="padding-left:30%">Quantidade</td>
								<td>Subtotal</td>
								<td></td>
								<%
									if (res != null) {
										if (res.getMsg() == null) {
											out.print("");
										} else
											out.print("<h5 class='text-warning'>" + res.getMsg() + "</h5>");
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
											sb.append(
													"<button type='submit' name='operacao' value='SUBTRAIR'  class='btn btn-primary' style='margin-left: 40px'><i class='material-icons'>remove</i></button>");
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
											double frete = 0;
											frete += (item.get(i).getLivro().getAltura() + item.get(i).getLivro().getLargura()
													+ item.get(i).getLivro().getProfundidade());
											p.setFrete(frete);
											
											sb.append("<td  id='subtotal" + i + "'>");
											subTotal = qtdeLivro * preco;
											precoTotal = precoTotal + qtdeLivro * preco;
											sb.append("R$" + String.format("%.2f", subTotal));

											sb.append("<script>$('#subtotal" + i + "').html('" + String.format("%.2f", subTotal)
													+ "R$');</script>");

											sb.append("<td><a href='Carrinho?operacao=REMOVER&id=" + l.getId() + "'>Remover</a>");
											sb.append("</td>");
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


						</tbody>
					</table>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<th><h5>Endereço de entrega</h5></th>
							</thead>
							<tbody>
								
								<%
									String txtId = (String) request.getSession().getAttribute("usuarioID");
									int id = Integer.parseInt(txtId);
									Pedido p = map.get(id);
									item = p.getItem();
									if (usuario == null) {
										out.print("<td><h5 style='color:red'>Faça login para calcular o frete e finalizar a compra</h5>");
										out.print("<a class='nav-link' data-toggle='modal' href='#myModal'>Fazer Login</a></td>");
									} else if(usuario != null && request.getSession().getAttribute("selecionado")== null){

										out.print("<tr><td>");
										out.print("<a class='nav-link' data-toggle='modal' href='#endereco'>");
										out.print("<button class='btn btn-danger'>Selecione um endereço para entrega</button></a>");
										out.print("</td></tr>");
										//out.print("<button class='btn btn-danger'>Selecione um endereço para entrega</button></a></td></tr>");
										}else if(usuario != null && request.getSession().getAttribute("selecionado").equals("true")){
											String indice = (String)request.getSession().getAttribute("i");
											int j = Integer.parseInt(indice);
											String cep = c.getEndereco().get(j).getCep().substring(c.getEndereco().get(j).getCep().length() -2);
											double numCep = Double.parseDouble(cep);
											p.setFrete(p.getFrete() + numCep);
											out.print("<tr>");
											out.print("<td>");
											out.print("<h5><address>");
											out.print(c.getNome() + "<br>");
											out.print(c.getEndereco().get(j).getTipoLogradouro() + " "
													+ c.getEndereco().get(j).getLogradouro() + ", " + c.getEndereco().get(j).getNumero()
													+ "<br>");
											out.print(
													c.getEndereco().get(j).getBairro() + " - " + c.getEndereco().get(j).getCidade().getNome()
															+ " - " + c.getEndereco().get(j).getCidade().getEstado().getNome() + "<br>");
											out.print(c.getEndereco().get(j).getCep());
											
											out.print("</address></h5>");
											out.print("<br>");
											out.print("<a class='nav-link' data-toggle='modal' href='#endereco'>");
											out.print("<button class='btn btn-danger'>Selecionar outro endereço</button></a>");
											out.print("</td>");
											out.print("<td>");
											out.print("<h6 style='color:red; padding-right:200px;'>Frete= "+"R$" + String.format("%.2f", p.getFrete()) +" </h6>");
											out.print("</td></tr>");
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
											out.print("<button name='operacao' type='submit' class='btn btn-warning' value='SELECIONAR'>Selecionar</button>");
											out.print("</form>");
											out.print("</td>");
											out.print("</tr>");

										}
									}
								}

								/*<form action="Login" method="post" style="padding-left: 20%">
								
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
								
								
								
								</form>*/
							%>
							</tbody>
						
						
					</table>
					<div align="center">
						<a class='nav-link' data-toggle='modal' href="#CadastroEndereco"><button class="btn btn-danger">Cadastrar novo endereço</button></a>
					</div>

				</div>


			</div>
		</div>
	</div>


	<!-- Modal LISTAGEM DE ENDEREÇOS -->
	
	
	
	<!-- Modal CADASTRO DE ENDEREÇO -->
		<div id="CadastroEndereco" class="modal fade" >
	<div class="modal-dialog" >
		<div class="modal-content" style="height:10%; width:200%" >
			<div class="modal-header">
				<h5 style="padding-right: 30px">Endereço de entrega</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>

			</div>


			<div class="modal-body" > 
			
			<form  action="SalvarEndereco" method="post" align="center">		<!-- ENDEREÇO -->	
		<div class="container">
     
		<div class="form-group" align="center">
		
		<label for="txtNomeRua">Nome Do Endereço (Ex: Entrega, cobrança)</label>
		<input type="text" id="txtNomeRua" name="txtNomeRua" maxlength="9" required="true" style="margin-bottom: 20px" >
		
    	<div class="form-group" align="center">
     
		<label for="txtTpLog">Tipo Logradouro:</label>
		<input type="text" id="txtTpLog" name="txtTpLog" maxlength="9" required="true" size="2" style="margin-bottom: 20px">
		
		<label for="txtLogradouro">Logradouro:</label>
		<input type="text" id="txtLogradouro" name="txtLogradouro" maxlength="40" required="true" style="margin-bottom: 20px" >
		
		<label for="txtNumero">Número:</label>
		<input type="text" id="txtNumero" name="txtNumero" maxlength="4" required="true" style="margin-bottom: 20px" >
		
		</div>
		
		<div class="form-group" align="center">
		<label for="txtCep">CEP:</label>
		<input type="text" id="txtCep" name="txtCep" maxlength="8" size="10px" required="true" style="margin-bottom: 20px">
		
		<label for="txtBairro">Bairro:</label>
		<input type="text" id="txtBairro" name="txtBairro" maxlength="40" required="true" style="margin-bottom: 20px">
		
		<label for="txtComplemento">Complemento:</label>
		<input type="text" id="txtComplemento" name="txtComplemento" maxlength="40" required="true" style="margin-bottom: 20px">
		
		</div>
		<div class="form-group" align="center">
		<label for="txtTpRes">Tipo de Residência:</label>
		<input type="text" id="txtTpRes" name="txtTpRes" maxlength="40" required="true" style="margin-bottom: 20px">
		
		<label for="txtCidade">Cidade:</label>
		<input type="text" id="txtCidade" name="txtCidade" maxlength="40" required="true" style="margin-bottom: 20px">
		
		<label for="txtEstado">Estado:</label>
		<input type="text" id="txtEstado" name="txtEstado" maxlength="40" required="true" style="margin-bottom: 20px">
		
		<label for="txtPais">Pais:</label>
		<input type="text" id="txtPais" name="txtPais" maxlength="40" required="true" style="margin-bottom: 20px">
			
		</div>
			
			<div align="center">
						<a href="#CadastroEndereco" style="font-color: red; font-size: 15px"><button class="btn btn-danger">Cadastrar novo endereço</button></a>
					</div>

				</div>

			</div>
			</form>
		</div>
	</div>
	</div>
	</div>
	
	
	
</html>