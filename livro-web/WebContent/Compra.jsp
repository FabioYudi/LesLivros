<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carrinho</title>
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script language="JavaScript" src="resources/js/teste.js"></script>
</head>
<body>


<%
Resultado resultado = (Resultado) session.getAttribute("resultadoConsultaLivroCompra");
session.removeAttribute("resultadoConsultaLivro");
if(resultado == null)
{
	pageContext.forward("Home.jsp");
}
List<EntidadeDominio> entidades = resultado.getEntidades();
Livros l = (Livros)entidades.get(0);

		Livros livro = (Livros) request.getAttribute("livro");
if (l != null)
	out.print(l.getTitulo());
else
	out.print("Não achou livro");%>
	
	
	

		<input  type='submit' id='operacao' name='operacao' value='ADICIONAR' class='btn btn-primary'/>
		
				
</body>
</html>