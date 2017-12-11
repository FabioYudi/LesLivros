<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet"

	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css"
	integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
	integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"
	integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<%Resultado resultado = (Resultado) session.getAttribute("resultadoConsultaLivro");
String usuario = (String)request.getSession().getAttribute("username"); %>
<title>:::: CADASTRO DE PRODUTO::::</title>
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
						<li class="nav-item"><a class="nav-link" href="FormConsultaLivro.jsp">Consultar</a></li>
						<li class="nav-item"><a class="nav-link" href="FormLivros.jsp">Cadastrar</a></li>
			
			
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
</head>
<body>

	<%
		Livros livro = (Livros) request.getAttribute("livro");
	%>
<br>
<br><br>
<br><br>
<br>


	<form action="SalvarLivro" method="post" align="center">
		<div class="form-group">
			<label for="txtcodigoLivro">Codigo do livro:</label> 
			<input type="text" id="txtCodigoLivro" name="txtCodigoLivro"
				required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getCodigoLivro() + "'>");
			else
				out.print(">");%></input>

			<label class="txtAutor" for="txtAutor">Autor:</label> <input
				type="text" id="txtAutor" name="txtAutor" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getAutor() + "'>");
			else
				out.print(">");%></input>

			<label class="txtAno" for="txtAno">Ano:</label> <input type="text"
				id="txtAno" name="txtAno" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getAno() + "'>");
			else
				out.print(">");%></input>
		</div>
		
	<%
	if(livro == null){
	out.print("<div class='form-group'>");
	out.print("<div class='form-check'>");
	out.print("<label class='txtStatus' for='txtStatus'>Status:</label> <br> <select id='txtStatus' name='txtStatus' required='true'>");
	out.print("<option value='true' {livro.getStatus() == true? 'selected' : ''} >Ativo</option>");
	out.print("<option value='false'${livro.getStatus() ==  false ? 'selected' : ''}>Inativo</option>");
	out.print("</select>");

	out.print("</div>");
	}else{
		out.print("<div class='form-group'>");
		out.print("<div class='form-check'>");
		out.print("<label class='txtStatus' for='txtStatus'>Status:</label> <br> <select id='txtStatus' name='txtStatus' required='true'>");
		out.print("<option value='true' >Ativo</option>");
		out.print("<option value='false'>Inativo</option>");
		out.print("</select>");

		out.print("</div>");
	}
	%>	
			<label for="txtTitulo">Titulo:</label> <input type="text"
				id="txtTitulo" name="txtTitulo" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getTitulo() + "'>");
			else
				out.print(">");%></input>



			<label for="txtEditora">Editora:</label> <input type="text"
				id="txtEditora" name="txtEditora" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getEditora() + "'>");
			else
				out.print(">");%></input>
				

			<label for="txtEdicao">Edição:</label> <input type="text"
				id="txtEdicao" name="txtEdicao" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getEdicao() + "'>");
			else
				out.print(">");%></input>

			<label for="txtIsbn">ISBN:</label> <input type="text" id="txtIsbn"
				name="txtIsbn" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getIsbn() + "'>");
			else
				out.print(">");%></input>

			<label for="txtNumPg">Num de pgs:</label> <input type="text"
				id="txtNumPg" name="txtNumPg" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getNumPg() + "'>");
			else
				out.print(">");%></input>
				<br><br>
				<label for="txtEstoque">Qtd Estoque:</label> <input type="text"
				id="txtEstoque" name="txtEstoque" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getEstoque() + "'>");
			else
				out.print(">");%></input>
				


		</div>


			
	
		<div class="form-group">
			<label for="txtSinopse">Sinopse:</label> <input type="text"
				id="txtSinopse" name="txtSinopse" required="true"
				value=
				
				<%if (livro != null)
				out.print("'" + livro.getSinopse() + "'>");
			else
				out.print(">")
				;%>
				</input>
				
				<label for="txtValor">Preço:</label> <input type="text"
				id="txtValor" name="txtValor" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getValor() + "'>");
			else
				out.print(">");%></input>




			<label for="txtAltura">Altura:</label> <input type="text"
				id="txtAltura" name="txtAltura" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getAltura() + "'>");
			else
				out.print(">");%></input>


			<label for="txtPeso">Peso:</label> <input type="text" id="txtPeso"
				name="txtPeso" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getPeso() + "'>");
			else
				out.print(">");%></input>

			<label for="txtProfundidade">Profundidade:</label> <input type="text"
				id="txtProfundidade" name="txtProfundidade" required="true"
				value=<%if (livro != null)
				out.print("'" + livro.getProfundidade() + "'>");
			else
				out.print(">");%></input>
				
				
				<label for="txtProfundidade">Largura:</label>
				<input type="text" id="txtLargura" name="txtLargura"
				value=<%if (livro != null)
				out.print("'" + livro.getLargura() + "'>");
			else
				out.print(">");%></input>

			<input type="hidden" id="txtId" name="txtId"
				value=<%if (livro != null)
				out.print("'" + livro.getId() + "'>");
			else
				out.print(">");%></input>
				
				
				


		</div>

		<%
			if (livro != null) {
				out.print(
						"<input type='submit' id='operacao' name='operacao' value='ALTERAR' class='btn btn-primary'/>");
			} else {
				out.print(
						"<input type='submit' id='operacao' name='operacao' value='SALVAR' class='btn btn-primary'/>");
			}
		%>

	</form>
</body>
</html>