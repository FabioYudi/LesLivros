<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
	List<Livros> livros = (List<Livros>)request.getSession().getAttribute("livros");	
	Map<Integer, Integer> map = (Map<Integer, Integer>) request.getSession().getAttribute("mapaCarrinho");
	
	if(request.getSession().getAttribute("url") == "/livro-web/Carrinho") {
		pageContext.forward("SalvarLivro?operacao=CONSULTARLIVRO");
			return;
	}
	%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Meu Carrinho</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">    

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"  >
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Les Livros</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp">Home
                <span class="sr-only">(current)</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Login.jsp">Login</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container">
    <div class="card card-outline-secondary my-4">
    	<div class="card-header">
              Carrinho de compras
        </div>
        <div class="card-body">
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<th><h3>Meu carrinho</h3></th>
					</thead>
					<tbody>
						<tr>
							<td>Item</td>
							<td>Preço</td>
							<td align="center">Quantidade</td>
							<td>Subtotal</td>
						</tr>
						<%
						if(livros!= null)
						{
							
							StringBuilder sb = new StringBuilder();
							for(int i = 0; i < map.size(); i++)	
							{
								sb.setLength(0);
								Livros l = livros.get(i);
								
							
								sb.append("<tr>");
								sb.append("<td>");
								sb.append(l.getTitulo());
								sb.append("</td>");
								sb.append("<td>");
								sb.append(l.getValor());
								sb.append("</td>");
								sb.append("<td align='center'>");
								sb.append("</div><form action='Carrinho' method='POST'>");
								sb.append("<button type='submit' name='operacao' value='SOMAR'  class='btn btn-primary' style='margin-left: 30px'><i class='material-icons'>add</i></button>");
								sb.append("<br");
								sb.append("</form>");
								sb.append("<h5 style='margin-left: 30px; border-color: #000000'>");
								sb.append(map.get(l.getId()));
								sb.append("</h5>");
								sb.append("<button type='submit' name='operacao' value='SUBTRAIR' class='btn btn-primary' style='margin-left: 30px'><i class='material-icons' >remove</i></button>");
								sb.append("</a>");
								sb.append("<input type='hidden' name='txtId' value='"+ l.getId() +"'>");             
								sb.append("</td>");
								sb.append("<td>");
							//	sb.append(map.get(l.getId()) * l.getPreco());
								sb.append("</td>");
								sb.append("</tr>");	
								out.print(sb.toString());										
							
						}
							request.getSession().setAttribute("mapaCarrinho", map);
						}
						if(livros == null || livros.size() == 0)
						{
							double precoTotal = 0;
							out.print("<tr><td>Não há itens no seu carrinho</td></tr>");
						}
						
						%>	
						<p>Used on a button:</p>
					</tbody>
				</table>
			</div>
         </div>
     </div>  
     </div> 
</body>
</html>