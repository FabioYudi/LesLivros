<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		TESTANDO
<%
ArrayList lista = new ArrayList();
 lista = (ArrayList) session.getAttribute("lista");
 	Iterator i = lista.iterator();
 	while ( i.hasNext()){
 		out.println( i.next());
 	}
%>
</body>
</html>