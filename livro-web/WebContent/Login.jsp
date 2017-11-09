<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Faça Login</title>
<link rel="stylesheet" type="text/css" href="resources/css/login.css">
  

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script language="JavaScript" src="resources/js/teste.js"></script>
</head>
<body>
<div class="teste">
<form  action="Login" method="post" align="">
<div class="lo">

		<div class="form-group">
		<label for="username">Login:</label>
		<input type="text" id="username" name="username" required="true" style="margin-right: 10px" />
		</div>
		
		<div class="form-group">
		<label for="senha">Senha:</label>
		<input type="text" id="senha" name="senha" required="true" style="margin-right: 10px" />
		</div>
					<input  type='submit' id='operacao' name='operacao' value='LOGAR' class='btn btn-primary'/>
		
		</div>
		
	
		
</form>



</div>
</body>
</html>