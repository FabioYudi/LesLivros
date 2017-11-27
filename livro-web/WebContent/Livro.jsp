<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Item - Start Bootstrap Template</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/shop-item.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
  </head>

  <body>
<%
Resultado resultado = (Resultado) session.getAttribute("resultadoConsultaLivroCompra");
    		String usuario = (String)request.getSession().getAttribute("username");

if(resultado == null)
{
	pageContext.forward("index.jsp");
}
List<EntidadeDominio> entidades = resultado.getEntidades();
Livros l = (Livros)entidades.get(0);

		Livros livro = (Livros) request.getAttribute("livro");
		request.getSession().setAttribute("livro", l);

%>
	
	

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
     <!-- Navigation -->

    <!-- Page Content -->
    <div class="container">

      <div class="row">

       </div>
          <div class="table-responsive">
					<table class="table table-striped">
					<tbody>
					<tr>
					<td>
      
        <!-- /.col-lg-3 -->

        <div class="col-lg-7">

          <div class="card mt-4">
            <img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">
            <div class="card-body">
              <h3 class="card-title"><%out.print(l.getTitulo());%></h3>
              <h4><%out.print("R$" + String.format("%.2f", l.getValor())); %></h4>
              <p class="card-text">SINOPSE: <%out.print(l.getSinopse()); %></p>
              <span class="text-warning"> <a href='Carrinho?operacao=COMPRAR' class='btn btn-danger'>Comprar</a></span>
              
              
            </div>
          </div>
          <!-- /.card -->	
         </div>
         </td>
         <td>
           
        	
         </td>
         </tr>
						
					</tbody>
					</table>
			</div>
	  <%
	  /* 	if(l.getEstoque() == 0)
              	{
              		out.print("<a href='' class='btn btn-danger' disabled>Esgotado</a>");
              	}
              	else
              	{
              		out.print("<a href='Carrinho?operacao=COMPRAR' class='btn btn-danger'>Comprar</a>");
              	}
	  */
	  out.print("<div class='card-img-top' align='right'>");
	  out.print("</div>");
	  
	  %>
        
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->
    
     <div class="card card-outline-secondary my-4">
            <div class="card-header">
              Características do Livro
            </div>
            <div class="card-body">
				<div class="table-responsive">
					<table class="table table-striped">
					<thead>
						<th><h3>Características</h3></th>
					</thead>
					<tbody>
						
							<tr><td>Ano</td>
							<td><%out.print(l.getAno()); %></td></tr>
						
						
							<tr><td>Editora</td>
							<td><%out.print(l.getEditora()); %></td></tr>
						
						
							<tr><td>Edição</td>
							<td><%out.print(l.getEdicao()); %></td></tr>
						
						
							<tr><td>ISBN</td>
							<td><%out.print(l.getIsbn()); %></td></tr>
						
						
							<tr><td>Nº Páginas</td>
							<td><%out.print(l.getNumPg()); %></td></tr>
						
						
							<tr><td>Altura</td>
							<td><%out.print(l.getAltura()); %></td></tr>
						
						
							<tr><td>Largura</td>
							<td><%out.print(l.getLargura()); %></td></tr>
						
						
							<tr><td>Profundidade</td>
							<td><%out.print(l.getProfundidade()); %></td></tr>
						
							<tr><td>Peso</td>
							<td><%out.print(l.getPeso()); %></td></tr>
																																																			
					</tbody>
					</table>
				</div>
              
            </div>
          </div>
          <!-- /.card -->

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2017</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

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
</html>