<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String usuario = (String)request.getSession().getAttribute("username");
%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script language="JavaScript" src="resources/js/teste.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- Bootstrap core CSS -->
    <link type="text/css" href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    

    <!-- Custom styles for this template -->
    <link type="text/css"  href="css/shop-homepage.css" rel="stylesheet">
    
<title>�rea do cliente</title>


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
            		out.print(" <a class='nav-link' href='Sair?operacao=SAIR'>Sair</a>");
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

</head>
<body>



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

</html>