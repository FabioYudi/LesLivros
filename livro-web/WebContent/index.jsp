<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

  <script language="JavaScript" src="resources/js/teste.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Les Livros</title>

    <!-- Bootstrap core CSS -->
    <link type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link type="text/css"  href="css/shop-homepage.css" rel="stylesheet">

  </head>

  <body>

   	<%
  		Resultado resultado = (Resultado) session.getAttribute("resultadoConsultaLivro");
    		
  		if(resultado == null)
  		{
  			pageContext.forward("SalvarLivro?operacao=CONSULTARLIVRO");
  			return;
  		}
  		
  		%>


	
	

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
      <div class="container">
        <a class="navbar-brand" href="#">Vendas</a>
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
              <a class="nav-link" href="FormCliente.jsp">Cadastre-se</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="Login.jsp">Login</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Page Content -->
    <div class="container">

      <div class="row">

        <div class="col-lg-3">

          <h1 class="my-4">Les Livros</h1>
          <div class="list-group">
            <a href="#" class="list-group-item">Category 1</a>
            <a href="#" class="list-group-item">Category 2</a>
            <a href="#" class="list-group-item">Category 3</a>
          </div>

        </div>
        <!-- /.col-lg-3 -->

        <div class="col-lg-9">

          <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="http://placehold.it/900x350" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>

          

          <div class="row">

    
   
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
				
				
				sbLink.append("<a href=Compra?");
					sbLink.append("txtId=");
					sbLink.append(l.getId());						
					sbLink.append("&");
					sbLink.append("operacao=");
					sbLink.append("MOSTRAR");
				sbLink.append(">");
				
				if(l.getStatus() == true){
					sbRegistro.append("<div class='col-lg-4 col-md-6 mb-4'>");
					sbRegistro.append("<div class='card h-100'>");	
					sbRegistro.append("<a href='#'><img class='card-img-top' src='http://placehold.it/700x400' alt=''></a>");
					sbRegistro.append("<div class='card-body'>");
					sbRegistro.append("<h4 class='card-title'>");
					sbRegistro.append(sbLink.toString());				
					sbRegistro.append(l.getTitulo());
					sbRegistro.append("</a>");	
					sbRegistro.append("</h4>");
					sbRegistro.append("<h5>$24.99</h5>");
					sbRegistro.append("<p class='card-text'></p>");
					sbRegistro.append("<form  action='Compra' method='post' align='left'>");
					sbRegistro.append("	<input  type='submit' id='operacao' name='operacao' value='COMPRAR' class='btn btn-primary'/>");
					sbRegistro.append("</form>");
					sbRegistro.append("</div>");
					sbRegistro.append("<div class='card-footer'>");
					sbRegistro.append("<small class='text-muted'>&#9733; &#9733; &#9733; &#9733; &#9734;</small>");
					sbRegistro.append("</div>");
					sbRegistro.append("</div>");
					sbRegistro.append("</div>");

					

				}
				

			
				
				out.print(sbRegistro.toString());
				
			}
		}
		

	}
   
   %>
			
			
			
			

          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

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

</html>
