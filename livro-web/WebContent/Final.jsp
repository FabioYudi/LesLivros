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
<div class="container" >
<div class="row" >
<br><br>
</div>
<div class="row" >
<div class="col" >
<div class="resumo">
Resumo do Pedido
<div class="rouw">
Produtos:

<%
int tam = c.getPedido().size();
int i =  c.getPedido().size() - 1;
	out.print("<tr>");
	out.print("<td>");
	out.print("<address>");
	out.print(c.getNome() + "<br>");
	out.print(c.getPedido().get(i).getPrecoTotal() + " "
			+ c.getPedido().get(i).getStatus() + ", "  
			+ "<br>");
	
	

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


%>

</div>

</div>
</div>
</div>
</div>



</body>
</html>