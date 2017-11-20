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

  </head>

  <body>
<%
Resultado resultado = (Resultado) session.getAttribute("resultadoConsultaLivroCompra");
<<<<<<< Upstream, based on origin/master
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
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="index.jsp">Les Livros</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ml-auto">
            <li class="nav-item active">
              <a class="nav-link" href="Index.jsp">Home
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
              <a class="nav-link" href="#">Contact</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
          <h1 class="my-4">LES LIVROS</h1>
          <div class="list-group">
            <a href="#" class="list-group-item active">Category 1</a>
            <a href="#" class="list-group-item">Category 2</a>
            <a href="#" class="list-group-item">Category 3</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div class="card mt-4">
            <img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">
            <div class="card-body">
              <h3 class="card-title"><%out.print(l.getTitulo());%></h3>
              <h4>$24.99</h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus!</p>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
            </div>
          </div>
          <!-- /.card -->	
	<form action="Carrinho" method="post" align="center">
        		<input  type='submit' id='operacao' name='operacao' value='COMPRAR' class='btn btn-primary'/>
</form>
        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->

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
=======
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
            		out.print(" <a class='nav-link' href='Painel.jsp'>�rea do Cliente</a>");
            		out.print(" </li>");
            		out.print("<li class='nav-item'>");
            		out.print(" <a class='nav-link' href='Login?operacao=SAIR'>Sair</a>");
            		out.print(" </li>");
            		out.print("<li class='nav-item' style='padding-left:50px; padding-top:10px'>");
            		out.print("<h6 style='color:white'> Ol�, ");
            		out.print(" " + usuario + "</h6>");
            		out.print("</li>");

            	}
            %>
              
           
          </ul>
        </div>
      </div>
    </nav>
     <!-- Navigation -->


    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">
          <h1 class="my-4">LES LIVROS</h1>
          <div class="list-group">
            <a href="#" class="list-group-item active">Category 1</a>
            <a href="#" class="list-group-item">Category 2</a>
            <a href="#" class="list-group-item">Category 3</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div class="card mt-4">
            <img class="card-img-top img-fluid" src="http://placehold.it/900x400" alt="">
            <div class="card-body">
              <h3 class="card-title"><%out.print(l.getTitulo());%></h3>
              <h4>$24.99</h4>
              <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sapiente dicta fugit fugiat hic aliquam itaque facere, soluta. Totam id dolores, sint aperiam sequi pariatur praesentium animi perspiciatis molestias iure, ducimus!</p>
              <span class="text-warning">&#9733; &#9733; &#9733; &#9733; &#9734;</span>
              4.0 stars
            </div>
          </div>
          <!-- /.card -->	
	<form action="Carrinho" method="post" align="center">
        		<input  type='submit' id='operacao' name='operacao' value='COMPRAR' class='btn btn-primary'/>
</form>
        </div>
        <!-- /.col-lg-9 -->

      </div>

    </div>
    <!-- /.container -->

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
                <p class="bg-info" align="center"><small>N�o possui cadastro? Cadastre-se <a href="FormCliente.jsp" style="color:red; font-size:15px">AQUI</a></small></p>
            </div>
            
        </div>
    </div>
</div>


<!-- Modal HTML -->

>>>>>>> 07f8a07 Sistema de sessão de login e sair da conta implementados, carrinho terminado
</html>