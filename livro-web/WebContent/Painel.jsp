<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script>
	$("a").click(function() {
		$("div").removeClass('in');
	});
</script>

<link type="text/css" href="resources/css/hover.css" rel="stylesheet">
<link type="text/css" href="resources/css/navlateral.css"
	rel="stylesheet">


<% 
String usuario = (String) request.getSession().getAttribute("username");
	Cliente c = (Cliente) request.getSession().getAttribute("cli");




Resultado resultado = (Resultado) session.getAttribute("resultadoConsultaPedido");
    		StringBuilder sb = new StringBuilder();

  		if(resultado == null)
  		{
  			pageContext.forward("Finalizar?operacao=CONSULTARPEDIDO");
  			return;
  		}
  		
 	%>
	

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script language="JavaScript" src="resources/js/teste.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link type="text/css" href="vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">


<!-- Custom styles for this template -->
<link type="text/css" href="css/shop-homepage.css" rel="stylesheet">

<title>Área do cliente</title>


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
			<li class="nav-item"><a class="nav-link" href="Carrinho.jsp"><i
					class="material-icons">local_grocery_store</i></a></li>

		</ul>
	</div>
</div>
</nav>
<!-- Navigation -->

<!-- LEFT NAVBAR -->







		
	
</head>
<body>
	<ul class="nav nav-tabs" role="tablist" style="background-color:#F0E68C">
		
  			<li class="nav-item">
    			<a class="nav-link active" data-toggle="tab" href="#home" role="tab"><i class="material-icons">notifications</i>Home</a>
  			</li>
  			<li class="nav-item">
   				 <a class="nav-link" data-toggle="tab" href="#profile" role="tab"><i class="material-icons">person</i>Perfil</a>
 			</li>
 			<li class="nav-item">
   				 <a class="nav-link" data-toggle="tab" href="#cupom" role="tab"><i class="material-icons">card_giftcard</i>Cupom</a>
 			</li>
 			<li class="nav-item">
   				 <a class="nav-link" data-toggle="tab" href="#pedidos" role="tab"><i class="material-icons">add_shopping_cart</i>Pedidos</a>
 			</li>
  		</ul>


		
<div class="tab-content">
  <div class="tab-pane active" id="home" role="tabpanel">LUCAAAS</div>
  
  
  <div class="tab-pane" id="profile" role="tabpanel">mensagem </div>

  
  
  
  
  
  
  
  
  
  <!--  cupom  -->
  <div class="tab-pane" id="cupom" role="tabpanel"> 
  
  <ul class="nav nav-tabs" role="tablist" style="background-color:white">
  <%
  			if(c.getAdm() == true){
  				out.print("<li class='nav-item'>");
    			out.print("<a class='nav-link' data-toggle='tab' href=''#cadCup' role='tab'><i class='material-icons'></i>Cadastrar Cupom Promocional</a>");
  				out.print("</li>");
  			}
  				
  			
  			
  		%>
  			
  			<li class="nav-item">
    			<a class="nav-link" data-toggle="tab" href="#teste" role="tab"><i class="material-icons"></i>Visualizar Cupons de Troca</a>
  			</li>
  			
  		</ul>
  		<div class="tab-content">
  		<%
  			if(c.getAdm() == true){
  			out.print("<div class='tab-pane active' id='cadCup' role='tabpanel'>");
  			out.print("cupom");
  			
  
  			out.print("</div>");
  			}
  		%>
 		
 		<div class="tab-pane" id="teste" role="tabpanel">
  
  		TESTE
  
  
 		</div>
 		</div>
  
  </div>
  
  <!-- cupom fim -->
  
  
  
  <!-- PEDIDOS -->
  
  <div class="tab-pane" id="pedidos" role="tabpanel"> 
  
    <ul class="nav nav-tabs" role="tablist" style="background-color:white">
    
    
    
 	 </ul>
  <div class="tab-content">
    <%
    
	StringBuilder sbRegistro = new StringBuilder();
	StringBuilder sbLink = new StringBuilder();
	
	
	
    	
  			if(c.getAdm() == true){
  				out.print("<h3>PEDIDOS</h3>");
  				out.print("<div");
  				out.print("<div id='accordion' role='tablist'>");
  				out.print("<div class='card'>");
  				out.print("<div class='card-header' role='tab' id='headingOne'>");
  				out.print("<h5 class='mb-0'>");
  				out.print("<a data-toggle='collapse' href='#collapseOne' aria-expanded='true' aria-controls='collapseOne'>");
  				out.print("Pedidos EM PROCESSO");
  				out.print("</a>");
  				out.print("</h5>");
  				out.print("</div>");

  				out.print("<div id='collapseOne' class='collapse show' role='tabpanel' aria-labelledby='headingOne' data-parent='#accordion'>");
  				out.print("<div class='card-body'>");
  				if(resultado != null){
  				    List<EntidadeDominio> entidades = resultado.getEntidades();
  				    
  				    for(int i = 0; i < entidades.size(); i++){
  				    Pedido p = (Pedido) entidades.get(i);
  				    		out.print("Pedido");
  				    		out.print(p.getStatus());
  				    		out.print("<br>");
  				   		 }
  				    }
  			
  				
  				out.print("</div>");
  				out.print("</div>");
  				out.print("</div>");
  				out.print("</div>");
    			
  			}else{
  				out.print("<h3>MEUS PEDIDOS</h3>");
  				List<Pedido> pedidos = c.getPedido();
  				if(c.getPedido().size() == 0){
  					out.print("<h4 style='color:red'> Você não possui pedidos</h4>");
  				}else{
  						for(int i = 0; i < c.getPedido().size(); i++){
  							for (int j = 0; j < c.getPedido().get(i).getItem().size(); j++){
  								out.print(c.getPedido().get(i).getItem().get(j).getLivro().getTitulo() + " Valor: " + c.getPedido().get(i).getItem().get(j).getValorItem() + "<br>");
  								
  								
  							}
  							out.print("Total: " + pedidos.get(i).getPrecoTotal() + "<br>");
  							out.print("--------------<br>");	
  						
					  					
  					}
  				}
  			}
  				
  			
  			
  	%>
  	<div style='padding-left:50%'>
  	
  	teste
  	</div>
  
  </div>
  
  </div>
  
  <!-- FIM PEDIDOS -->
  
 
   
 
 
  
   </div>
   
  
  <!--CUPOM-->

  
 

 
  






		

  <!-- FIM CUPOM -->
  
  
  
  
  
	











	<script src="resources/js/Mascara.js"></script>

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
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>

			</div>
			<div class="modal-body">

				<form action="Login" method="post" style="padding-left: 20%">

					<div class="form-group">
						<label for="username">Usuario:</label> <input size="21"
							type="text" id="username" name="username" required="true" />
					</div>

					<div class="form-group">
						<label for="senha" style="padding-left: 11px">Senha:</label> <input
							size="21" type="password" id="senha" name="senha" required="true"
							style="margin-right: 10px" />
					</div>
					<input type='submit' id='operacao' name='operacao' value='LOGAR'
						class='btn btn-primary' style="margin-left: 110px" />
			



			</form>
			</div>
			<p class="bg-info" align="center">
				<small>Não possui cadastro? Cadastre-se <a
					href="FormCliente.jsp" style="color: red; font-size: 15px">AQUI</a></small>
			</p>
		</div>

	</div>
</div>
</div>


<!-- Modal HTML -->



<!-- Modal Cupom -->
<div id="ModalCupom" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 style="padding-right: 30px">Login</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>

			</div>
			<div class="modal-body">

				
			<p class="bg-info" align="center">
				<small>Não possui cadastro? Cadastre-se <a
					href="FormCliente.jsp" style="color: red; font-size: 15px">AQUI</a></small>
			</p>
		</div>

	</div>
</div>
</div>


<!-- Modal Cupom -->

</html>