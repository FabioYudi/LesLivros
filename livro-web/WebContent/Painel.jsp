<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" href="resources/css/hover.css" rel="stylesheet">


<%
	String usuario = (String) request.getSession().getAttribute("username");
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="JavaScript" src="resources/js/teste.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link type="text/css" href="css/shop-homepage.css" rel="stylesheet">

<title>Área do cliente</title>


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
			<li class="nav-item"><a class="nav-link" href="Carrinho.jsp"><i class="material-icons">local_grocery_store</i></a>
			</li>

		</ul>
	</div>
</div>
</nav>
<!-- Navigation -->

</head>
<body>
	
				<div>
							<a data-toggle='modal' href='#ModalCupom'> <img class="box"
								src="https://cuponomia-a.akamaihd.net/blog/wp-content/uploads/2016/02/icone-desconto.png">
							</a>
							
						

				</div>





	<script src="resources/js/Mascara.js"></script>

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



<!-- Modal Cupom -->
<div id="ModalCupom" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="padding-right: 30px">Login</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>

			</div>
			<div class="modal-body">

			<form action="SalvarCupom" method="post" style="padding-left: 20%">

					<div class="form-group">
						<label for="txtNumCupom">Código:</label> <input size="21"
							type="text" id="txtNumCupom" name="txtNumCupom" required="true" />
					</div>

					<div class="form-group">
						<label for="txtValor" style="padding-left: 11px">Valor:</label> <input
							size="21" type="text" id="txtValor" name="txtValor" required="true"
							style="margin-right: 10px" />
					</div>
					<div class="form-group">
						<label for="txtData" style="padding-left: 11px">Data de Expiração:</label> 
						<input size="21" type="text" id="txtData" name="txtData" required="true" maxlenght="9"
							style="margin-right: 10px" onkeypress="mascaraData(this, event)">
					</div>
					<input type='submit' id='operacao' name='operacao' value='SALVAR'
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


<!-- Modal Cupom -->

</html>