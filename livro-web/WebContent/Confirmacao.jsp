<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%
	//declarações de sessão
	Cliente c = (Cliente) request.getSession().getAttribute("cli");
	Resultado resultadoPedido = (Resultado) request.getSession().getAttribute("resultadoConsultaPedido");
	String usuario = (String) request.getSession().getAttribute("username");
	Map<Integer, Pedido> map = (Map<Integer, Pedido>) request.getSession().getAttribute("mapaUsuarios");
	String txtId = (String) request.getSession().getAttribute("usuarioID");
	int id = Integer.parseInt(txtId);
	String indice = request.getParameter("txtIndice");
	String idPedido = request.getParameter("txtIdPedido");
	int i = Integer.parseInt(indice);
	Pedido p = c.getPedido().get(i);
	List<Item> item = new ArrayList<Item>();
%>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmação</title>

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/shop-item.css" rel="stylesheet">

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
<body>
<%
	if(resultadoPedido != null){
		System.out.println(p.getStatus());
		if(p.getStatus().trim().equals("APROVADA")){
			out.print("<h2 style='color:green'>Compra: APROVADA" );
		
		}else if(p.getStatus().trim().equals("REPROVADA")){
			out.print("<h2 style='color:red'>Compra: REPROVADA");
		}
	}

%>
 <META HTTP-EQUIV="Refresh" CONTENT="3;URL=Painel.jsp"> 

</body>
</html>