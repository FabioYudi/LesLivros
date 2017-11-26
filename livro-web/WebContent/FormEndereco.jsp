<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

String usuario = (String) request.getSession().getAttribute("username");
String stringId = (String) request.getSession().getAttribute("usuarioID");


%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Cadastro de endereço</title>

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
</head>
<body>
<form  action="SalvarEndereco" method="post" align="center" style="margin-top: 10px">	
   
     
		<div class="form-group" align="center">
		
		<label for="txtNomeRua">Nome Do Endereço(Ex: Entrega, cobrança):</label>
		<input type="text" id="txtNomeRua" name="txtNomeRua" maxlength="9" required="true" style="margin-bottom: 20px">
		
		
		</div>
		
		
		
     	
     <div class="form-group" align="center">
     
		<label for="txtTpLog">Tipo Logradouro:</label>
		<input type="text" id="txtTpLog" name="txtTpLog" maxlength="9" required="true" size="5px" style="margin-bottom: 20px">
		
		
	
		
		<label for="txtLogradouro">Logradouro:</label>
		<input type="text" id="txtLogradouro" name="txtLogradouro" maxlength="40" required="true" style="margin-bottom: 20px">
		
	
		
		<label for="txtNumero">Número:</label>
		<input type="text" id="txtNumero" name="txtNumero" maxlength="4" required="true" style="margin-bottom: 20px">
		
		
	
		
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
		<input type="text" id="txtPais" name="txtPais" maxlength="40" required="true" style="margin-bottom: 20px"/>
	
		
		
		
		
		
		</div>
		
		
		
		
		
			
	<div align="center">
    <input  type='submit' id='operacao' name='operacao' value='SALVAR' class='btn btn-primary'/>
			
				
				
		</div>
		
	
		
	</form>

</body>
</html>