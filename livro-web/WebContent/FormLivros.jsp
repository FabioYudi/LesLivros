<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>


<!DOCTYPE html>
<html>
<head>
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

<title>:::: CADASTRO DE PRODUTO::::</title>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<a class="navbar-brand" href="#">LIVROS</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
		<div class="navbar-nav">
			<a class="nav-item nav-link active" href="FormLivros.jsp">Cadastrar</a>
			<a class="nav-item nav-link active" href="FormConsultaLivro.jsp">Consultar</a>
		</div>
	</div>

</nav>
</head>
<body>

	<%
		Livros livro = (Livros) request.getAttribute("livro");
	%>



	<form action="SalvarLivro" method="post" align="center">
		<div class="form-group">
			<label for="txtcodigoLivro">Codigo do livro:</label> <input
				type="text" id="txtCodigoLivro" name="txtCodigoLivro"
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
		<div class="form-group">
			<div class="form-check">
				<label class="txtStatus" for="txtStatus">Status:</label> <br> <select
					id="txtStatus" name="txtStatus" required="true">
					<option value="true" ${livro.getStatus() == true? 'selected' : ''}>Ativo</option>
					<option value="false"
						${livro.getStatus() ==  false ? 'selected' : ''}>Inativo</option>
				</select>

			</div>
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

			<input type="hidden" id="txtId" name="txtId"
				value=<%if (livro != null)
				out.print("'" + livro.getId() + "'>");
			else
				out.print(">");%></input>
				
				<input type="hidden" id="txtIdLog" name="txtIdLog"
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