<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Bootstrap core CSS -->
<link type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link type="text/css" href="css/shop-homepage.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>:::: CONSULTAR Livro::::</title>

<%String usuario = (String)request.getSession().getAttribute("username"); %>

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
<br>
	<%
		Resultado resultado = (Resultado) session.getAttribute("resultado");
	%>

	<form action="SalvarLivro" method="post" align="center">

		
		 <label for="txtTitulo">Titulo: </label> 
		 <input type="text" id="txtTitulo" name="txtTitulo"  /> 
		 Status:
		 <select id="txtStatus" name="txtStatus">
            <option>Todos</option>
            <option value="true">Ativos</option>
            <option value="false">Inativos</option>
        </select>
		 <label for="txtCodigoLivro">codigo livro: </label>
		 <input type="text" id="txtCodigoLivro" name="txtCodigoLivro"/>
		 <label for="txtEditora">Editora: </label>
		 <input type="text" id="txtEditora" name="txtEditora"/>
		 <label for="txtEdicao">Edição: </label>
		 <input type="text" id="txtEdicao" name="txtEdicao"/>
		 </br>
		 <label for="txtSinopse">Sinopse: </label>
		 <input type="text" id="txtSinopse" name="txtSinopse"/>
		 <label for="txtAutor">Autor: </label>
		 <input type="text" id="txtAutor" name="txtAutor"/>
		 <label for="txtIsbn">ISBN</label>
		 <input type="text" id="txtIsbn" name="txtIsbn"/>
		 
		 <input type="submit" id="operacao" name="operacao" value="CONSULTAR" class='btn btn-primary' />
	</form>

	


	<%
	
	if(resultado !=null && resultado.getMsg() != null){
		out.print(resultado.getMsg());
	}
	
	%>
<BR>

<TABLE BORDER="5"    WIDTH="50%"   CELLPADDING="4" CELLSPACING="3" class="table">

   <TR>
      <TH COLSPAN="14"><BR>
      	<H3>Livros</H3>
      </TH>
   </TR>
   
   <TR>
 
   
      <TH>ID:</TH>
      <TH>Codigo Do Livro:</TH>
      <TH>Autor::</TH>
      <TH>Ano:</TH>
      <TH>Status:</TH>
      <TH>Titulo:</TH>
      <TH>Editora:</TH>
      <TH>Edicao:</TH>
      <TH>ISBN:</TH>
      <TH>Num de paginas:</TH>
      <TH>Sinopse:</TH>
      <TH>Altura:</TH>
      <TH>Peso:</TH>
      <TH>Profundidade:</TH>
      
   </TR>
   
   
   <%
   
   if (resultado != null) {
		List<EntidadeDominio> entidades = resultado.getEntidades();
		StringBuilder sbRegistro = new StringBuilder();
		StringBuilder sbLink = new StringBuilder();
		
		
		if(entidades != null){
			for (int i = 0; i < entidades.size(); i++) {
				Livros l = (Livros) entidades.get(i);
				sbRegistro.setLength(0);
				sbLink.setLength(0);
				
			//	<a href="nome-do-lugar-a-ser-levado">descrição</a>
				
				sbRegistro.append("<TR ALIGN='CENTER'>");
				
				sbLink.append("<a href=SalvarLivro?");
					sbLink.append("txtId=");
					sbLink.append(l.getId());						
					sbLink.append("&");
					sbLink.append("operacao=");
					sbLink.append("VISUALIZAR");
					
				sbLink.append(">");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());	
				sbRegistro.append(l.getId() == null ? ' ' : l.getId());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());	
				sbRegistro.append(l.getCodigoLivro());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getAutor());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getAno());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getStatus() == true ? "Ativo" : "Inativo");
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getTitulo());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getEditora());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getEdicao());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getIsbn());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getNumPg());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getSinopse());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getAltura());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getPeso());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(l.getProfundidade());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
			
				
				sbRegistro.append("</TR>");
				
				out.print(sbRegistro.toString());
				
			}
		}
		

	}
   
   %>
   
   
      
  
</TABLE>


</body>
</html>