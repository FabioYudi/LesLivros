<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<%
	List<Livros> livros = (List<Livros>)request.getSession().getAttribute("livros");	
	Map<Integer, Integer> map = (Map<Integer, Integer>) request.getSession().getAttribute("mapaCarrinho");
<<<<<<< Upstream, based on origin/master
	
	
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
							<td></td>
							
							
							
						</tr>
						<tr>
						</tr>
						
						
						
						
						<%
						double subTotal = 0;
						double desconto = 0;
						double precoTotal = 0;
						double precoFrete = 0;
						if(livros!= null)
						{
							
							StringBuilder sb = new StringBuilder();
							for(int i = 0; i < map.size(); i++)	
							{
								sb.setLength(0);
								Livros l = livros.get(i);
								Integer qtdeEstoque = l.getEstoque() - map.get(l.getId());
								sb.append("<tr style='border-color:red'>");
								sb.append("<td>");
								sb.append(l.getTitulo());
								sb.append("</td>");
								
								sb.append("<td>");
								sb.append("R$" + String.format("%.2f", l.getValor()));
								sb.append("</td>");
								
								//quantidade
								
								sb.append("<td style='padding-left:105px'>");
								sb.append("<form action='Carrinho' method='POST'>");
								sb.append("<div class='row'>");
								sb.append("<button type='submit' name='operacao' value='SOMAR'  class='btn btn-primary' style='margin-left: 40px'><i class='material-icons'>add</i></button>");
								sb.append("<input type='hidden' name='txtId' value='"+ l.getId() +"'>");     
								sb.append("</form>");
								sb.append("<h5 style='padding-left: 30px; border-color: #000000'>");
								sb.append(map.get(l.getId()));
								sb.append("</h5>");
								sb.append("<form action='Carrinho' method='POST'>");
								sb.append("<input type='hidden' name='txtId' value='"+ l.getId() +"'>");     
								sb.append("<button type='submit' name='operacao' value='SUBTRAIR' class='btn btn-primary' style='margin-left: 30px'><i class='material-icons' >remove</i></button>");
								sb.append("</form>");	
								sb.append("</a>");        
								sb.append("</td>");	
								sb.append("</div>");
								//quantidade


								
								
								sb.append("<td  id='subtotal" + i +"'>");
								subTotal =  map.get(l.getId()) * l.getValor();
								precoTotal = precoTotal + map.get(l.getId()) * l.getValor();
								sb.append("R$" + String.format("%.2f", subTotal));

								sb.append("<script>$('#subtotal" + i + "').html('" + String.format("%.2f" , map.get(l.getId()) * l.getValor()) + "R$');</script>");
								
								sb.append("<td><a href='Carrinho?operacao=REMOVER&id=" + l.getId() +"'>Remover</a></td>");
								sb.append("</td>");
								sb.append("</tr>");	
								out.print(sb.toString());	
							
						}
							request.getSession().setAttribute("mapaCarrinho", map);
							precoTotal = precoTotal + precoFrete;
						}
						if(livros == null || livros.size() == 0)
						{
							precoTotal = 0;
							out.print("<tr><td>Não há itens no seu carrinho</td></tr>");
						}
						
						%>	
												<td><input type="text"></input> </td>
						
						<p>Used on a button:</p>
					</tbody>
				</table>
			</div>
         </div>
     </div>  
     </div> 
</body>
=======
	String usuario = (String)request.getSession().getAttribute("username");
	
	
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
    
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">LES LIVROS</a>
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
           
          <%
            	if(request.getSession().getAttribute("username") == null){
            		out.print("<li class='nav-item'>");
            		out.print(" <a class='nav-link' href='FormCliente.jsp'>Cadastre-se</a>");
            		out.print(" </li>");
            		out.print("<li class='nav-item'>");
            		out.print(" <a class='nav-link' data-toggle='modal' href='#myModal'>Login</a>");
            		out.print(" </li>");
            	}else{
            		out.print("<li class='nav-item'>");
            		out.print(" <a class='nav-link' href='Painel.jsp'>Área do Cliente</a>");
            		out.print(" </li>");
            		out.print("<li class='nav-item'>");
            		out.print(" <a class='nav-link' href='Login?operacao=SAIR'>Sair</a>");
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
     <!-- Navigation -->

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
							<td></td>
							
							
							
						</tr>
						<tr>
						</tr>
						
						
						
						
						<%
						double subTotal = 0;
						double desconto = 0;
						double precoTotal = 0;
						double precoFrete = 0;
						if(livros!= null)
						{
							
							StringBuilder sb = new StringBuilder();
							for(int i = 0; i < map.size(); i++)	
							{
								sb.setLength(0);
								Livros l = livros.get(i);
								Integer qtdeEstoque = l.getEstoque() - map.get(l.getId());
								sb.append("<tr>");
								sb.append("<td>");
								sb.append(l.getTitulo());
								sb.append("</td>");
								
								sb.append("<td>");
								sb.append("R$" + String.format("%.2f", l.getValor()));
								sb.append("</td>");
								
								//quantidade
								
								sb.append("<td style='padding-left:105px'>");
								sb.append("<form action='Carrinho' method='POST'>");
								sb.append("<div class='row'>");
								sb.append("<button type='submit' name='operacao' value='SOMAR'  class='btn btn-primary' style='margin-left: 40px'><i class='material-icons'>add</i></button>");
								sb.append("<input type='hidden' name='txtId' value='"+ l.getId() +"'>");     
								sb.append("</form>");
								sb.append("<div >");
								sb.append("<h5 style='padding-left: 30px; border-color: #000000'>");
								sb.append(map.get(l.getId()));
								sb.append("</h5>");
								sb.append("</div>");
								sb.append("<form action='Carrinho' method='POST'>");
								sb.append("<input type='hidden' name='txtId' value='"+ l.getId() +"'>");     
								sb.append("<button type='submit' name='operacao' value='SUBTRAIR' class='btn btn-primary' style='margin-left: 30px'><i class='material-icons' >remove</i></button>");
								sb.append("</form>");	
								sb.append("</a>");        
								sb.append("</td>");	
								sb.append("</div>");
								//quantidade
								
								double freteLivro = (l.getAltura() * 
										l.getProfundidade() * 
										l.getLargura()) / 200;
								precoFrete = precoFrete + freteLivro;

								
								
								sb.append("<td  id='subtotal" + i +"'>");
								subTotal =  map.get(l.getId()) * l.getValor();
								precoTotal = precoTotal + map.get(l.getId()) * l.getValor();
								sb.append("R$" + String.format("%.2f", subTotal));

								sb.append("<script>$('#subtotal" + i + "').html('" + String.format("%.2f" , map.get(l.getId()) * l.getValor()) + "R$');</script>");
								precoTotal = precoTotal + map.get(l.getId()) * l.getValor();
								sb.append("<td><a href='Carrinho?operacao=REMOVER&id=" + l.getId() +"'>Remover</a></td>");
								sb.append("</td>");
								sb.append("</tr>");	
								out.print(sb.toString());	
							
						}
							request.getSession().setAttribute("mapaCarrinho", map);
							precoTotal = precoTotal + precoFrete;
						}
						if(livros == null || livros.size() == 0)
						{
							precoTotal = 0;
							out.print("<tr><td>Não há itens no seu carrinho</td></tr>");
						}
						
						%>	
						
												
					</tbody>
				</table>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<th><h5>Endereço de entrega</h5></th>
					</thead>
					<tbody>
						<tr>
							<td>Endereços Cadastrados</td>
							
							
							
							
						</tr>
						<tr>
						</tr>
						
						
						
						
						<%
						
						if(livros!= null)
						{
							
							StringBuilder sb = new StringBuilder();
							for(int i = 0; i < map.size(); i++)	
							{
								sb.setLength(0);
								Livros l = livros.get(i);
								Integer qtdeEstoque = l.getEstoque() - map.get(l.getId());
								sb.append("<tr>");
								sb.append("<td>");
								sb.append(l.getTitulo());
								sb.append("</td>");
								
								sb.append("<td>");
								sb.append("R$" + String.format("%.2f", l.getValor()));
								sb.append("</td>");
								
								//quantidade
								
								sb.append("<td style='padding-left:105px'>");
								sb.append("<form action='Carrinho' method='POST'>");
								sb.append("<div class='row'>");
								sb.append("<button type='submit' name='operacao' value='SOMAR'  class='btn btn-primary' style='margin-left: 40px'><i class='material-icons'>add</i></button>");
								sb.append("<input type='hidden' name='txtId' value='"+ l.getId() +"'>");     
								sb.append("</form>");
								sb.append("<div >");
								sb.append("<h5 style='padding-left: 30px; border-color: #000000'>");
								sb.append(map.get(l.getId()));
								sb.append("</h5>");
								sb.append("</div>");
								sb.append("<form action='Carrinho' method='POST'>");
								sb.append("<input type='hidden' name='txtId' value='"+ l.getId() +"'>");     
								sb.append("<button type='submit' name='operacao' value='SUBTRAIR' class='btn btn-primary' style='margin-left: 30px'><i class='material-icons' >remove</i></button>");
								sb.append("</form>");	
								sb.append("</a>");        
								sb.append("</td>");	
								sb.append("</div>");
								//quantidade
								
								double freteLivro = (l.getAltura() * 
										l.getProfundidade() * 
										l.getLargura()) / 200;
								precoFrete = precoFrete + freteLivro;

								
								
								sb.append("<td  id='subtotal" + i +"'>");
								subTotal =  map.get(l.getId()) * l.getValor();
								precoTotal = precoTotal + map.get(l.getId()) * l.getValor();
								sb.append("R$" + String.format("%.2f", subTotal));

								sb.append("<script>$('#subtotal" + i + "').html('" + String.format("%.2f" , map.get(l.getId()) * l.getValor()) + "R$');</script>");
								precoTotal = precoTotal + map.get(l.getId()) * l.getValor();
								sb.append("<td><a href='Carrinho?operacao=REMOVER&id=" + l.getId() +"'>Remover</a></td>");
								sb.append("</td>");
								sb.append("</tr>");	
								out.print(sb.toString());	
							
						}
							request.getSession().setAttribute("mapaCarrinho", map);
							precoTotal = precoTotal + precoFrete;
						}
						if(livros == null || livros.size() == 0)
						{
							precoTotal = 0;
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

 <!-- Modal HTML -->
<div id="myModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               <h5 style="padding-right: 30px">Login</h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
             
            </div>
            <div class="modal-body">
                
                <form  action="Login" method="post" style="padding-left:20%">
		
		<div class="form-group" >
		<label for="username" >Usuario:</label>
		<input size="21" type="text" id="username" name="username" required="true"/>
		</div>
		
		<div class="form-group">
		<label for="senha" style="padding-left:11px">Senha:</label>
		<input size="21" type="password" id="senha" name="senha" required="true" style="margin-right: 10px" />
		</div>
					<input  type='submit' id='operacao' name='operacao' value='LOGAR' class='btn btn-primary' style="margin-left:110px"/>
		
		</div>
		
	
		
</form>
                <p class="bg-info" align="center"><small>Não possui cadastro? Cadastre-se <a href="FormCliente.jsp" style="color:red; font-size:15px">AQUI</a></small></p>
            </div>
            
        </div>
    </div>
</div>


<!-- Modal HTML -->

>>>>>>> 07f8a07 Sistema de sessÃ£o de login e sair da conta implementados, carrinho terminado
</html>