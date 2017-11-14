<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
		List<Item> itensCarrinho = (List<Item>)request.getSession().getAttribute("carrinho");
	%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Meu Carrinho</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
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
							<td>Quantidade</td>
							<td>Subtotal</td>
						</tr>
						<%
						if(itensCarrinho != null)
						{
							Map<Integer, Integer> map = new HashMap<Integer, Integer>();
							List<Livros> livros = new ArrayList<Livros>();
							StringBuilder sb = new StringBuilder();
							for(int i = 0; i < itensCarrinho.size(); i++)	
							{
								sb.setLength(0);
								Item item = itensCarrinho.get(i);
								Livros l = item.getLivro();
								if(!map.containsKey(l.getId()))
								{
									map.put(l.getId(), 0);
									livros.add(l);
								}
								if(map.containsKey(l.getId()))
								{
									map.put(l.getId(), map.get(l.getId()) + 1);
								}
								
														
							}
							
							for(int i = 0; i < livros.size(); i ++)
							{
								sb.setLength(0);
								Livros l = livros.get(i);
								sb.append("<tr>");
								sb.append("<td>");
								sb.append(l.getTitulo());
								sb.append("</td>");
								sb.append("<td>");
								//sb.append(l.getPreco().toString());
								sb.append("</td>");
								sb.append("<td>");
								sb.append("<form  action='Carrinho' method='post' align='center'>");
								sb.append("<button type='button' class='btn btn-default'>");
								sb.append("<span class='glyphicon glyphicon-plus' aria-hidden='true'></span>");
								sb.append("</button>");         
								sb.append("</form>");
								sb.append(map.get(l.getId()));
								sb.append("<form  action='Carrinho' method='post' align='center'>");
								sb.append("<button type='button' class='btn btn-default'>");
								sb.append("<span class='glyphicon glyphicon-minus' aria-hidden='true'></span>");
								sb.append("</button>");           
								sb.append("</form>");
								sb.append("</td>");
								sb.append("<td>");
							//	sb.append(map.get(l.getId()) * l.getPreco());
								sb.append("</td>");
								sb.append("</tr>");	
								out.print(sb.toString());										
							}
						}
						else
						{
							out.print("<tr><td>Não há itens no seu carrinho</td></tr>");
						}
						%>																																				
					</tbody>
				</table>
			</div>
         </div>
     </div>  
     </div> 
</body>
</html>