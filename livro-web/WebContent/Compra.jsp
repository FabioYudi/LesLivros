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
		Resultado resultado = (Resultado) session.getAttribute("resultado");
		Item item = (Item)request.getAttribute("lista");
	%>
<TABLE BORDER="2"    WIDTH="20%"   CELLPADDING="2" CELLSPACING="1" class="table">

   <TR class="carrinho">
      <TH COLSPAN="40"><BR>
      	<H3>Carrinho</H3>
      </TH>
   </TR>
   
   <TR>
 
   
      
      <TH>Titulo:</TH>
      
      <TH>Quantidade</TH>
      
      <TH>Preço</TH>
      
     
      
   </TR>
 <%
   if (resultado != null) {
		List<EntidadeDominio> entidades = resultado.getEntidades();
		StringBuilder sbRegistro = new StringBuilder();
		StringBuilder sbLink = new StringBuilder();
		
		ArrayList<Livros> lista = new ArrayList<Livros>();
		 lista = (ArrayList) session.getAttribute("lista");
		 	Iterator i = lista.iterator();
		 	while ( i.hasNext()){
		 		out.println( i.next());
		 	}
   }
		%>
			</TABLE>
			
			<label value=""></label>
</body>
</html>