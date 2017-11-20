<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fa�a Login</title>
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
  

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script language="JavaScript" src="resources/js/teste.js"></script>
  <%
  	String usuario = (String)request.getSession().getAttribute("username");
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

  
</head>
<body>
<div align="center" style="padding-top:5%"> 
<h2> Fa�a Login</h2>
</div>

<form  action="Login" method="post" style="padding-left:20%">
<div class="lo">
		
			
		<div class="form-group">
		<label for="username">Login:</label>
		<input size="21" type="text" id="username" name="username" required="true" style="margin-right: 15px" />
		</div>
		
		<div class="form-group">
		<label for="senha">Senha:</label>
		<input size="21" type="text" id="senha" name="senha" required="true" style="margin-right: 10px" />
		</div>
					<input  type='submit' id='operacao' name='operacao' value='LOGAR' class='btn btn-primary' style="margin-left:80px"/>
		
		</div>
		
	
		
</form>



</body>
</html>