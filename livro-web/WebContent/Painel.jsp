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
	request.getSession().setAttribute("cli", c);




Resultado resultado = (Resultado) session.getAttribute("resultadoPedido");
    		StringBuilder sb = new StringBuilder();
if(c.getAdm() == true){
  		if(resultado == null)
  		{
  			pageContext.forward("Finalizar?operacao=CONSULTARPEDIDO");
  			return;
  		}
  		
}
  		else{
  			if(request.getSession().getAttribute("redirecionar") == null)
  			{
  				System.out.println("to no if");
  				String email = c.getEmail();
  				String senha = c.getSenha();
  				String url = "SalvarCliente?operacao=LOGAR&username="+email;
  				request.getSession().setAttribute("redirecionar", "redirecionar");
  				pageContext.forward(url);
  				return;
  			}	
  			request.getSession().setAttribute("redirecionar", null);
  		}
	
 	%>
	<style>
hr{
  border-color:#aaa;
  box-sizing:border-box;
  width:100%;  
}
	
	</style>

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
	
	<%
		if(c.getAdm() == true){
			out.print("<li class='nav-item'>");
			out.print("<a class='nav-link'  href='FormLivros.jsp' role='tab'><i class='material-icons'>notifications</i>Cadastrar Livro</a>");
			out.print("<li class='nav-item'>");
			out.print("<a class='nav-link'  href='FormConsultaLivro.jsp' role='tab'><i class='material-icons'>person</i>Consultar Livros</a>");
			out.print("</li>");
		}
			
	%>
	
		
  			
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
  <div class="tab-pane active" id="home" role="tabpanel">
  
  
  <!--Load the AJAX API-->
    <html>
  <head>
    <!--Load the AJAX API-->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">

      // Load the Visualization API and the controls package.
      google.charts.load('current', {'packages':['corechart', 'controls']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawDashboard);

      // Callback that creates and populates a data table,
      // instantiates a dashboard, a range slider and a pie chart,
      // passes in the data and draws it.
      function drawDashboard() {

        // Create our data table.
        var data = google.visualization.arrayToDataTable([
          ['Name', 'Donuts eaten'],
          ['Lucas' , 5],
          ['Elisa', 7],
          ['Robert', 3],
          ['John', 2],
          ['Jessica', 6],
          ['Aaron', 1],
          ['Margareth', 8]
        ]);

        // Create a dashboard.
        var dashboard = new google.visualization.Dashboard(
            document.getElementById('dashboard_div'));

        // Create a range slider, passing some options
        var donutRangeSlider = new google.visualization.ControlWrapper({
          'controlType': 'NumberRangeFilter',
          'containerId': 'filter_div',
          'options': {
            'filterColumnLabel': 'Donuts eaten'
          }
        });

        // Create a pie chart, passing some options
        var pieChart = new google.visualization.ChartWrapper({
          'chartType': 'PieChart',
          'containerId': 'chart_div',
          'options': {
            'width': 300,
            'height': 300,
            'pieSliceText': 'value',
            'legend': 'right'
          }
        });

        // Establish dependencies, declaring that 'filter' drives 'pieChart',
        // so that the pie chart will only display entries that are let through
        // given the chosen slider range.
        dashboard.bind(donutRangeSlider, pieChart);

        // Draw the dashboard.
        dashboard.draw(data);
      }
    </script>
 
	

    <!--Div that will hold the dashboard-->
    <div id="dashboard_div">
      <!--Divs that will hold each control and chart-->
      <div id="filter_div"></div>
      <div id="chart_div"></div>
    </div>
  
  
  
  
  </div>
  
  
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
	
	
	//PARA ADM
    	
  			if(c.getAdm() == true){
  				out.print("<h3>PEDIDOS</h3>");
  				out.print("<div>");
	  				out.print("<div  id='accordion' role='tablist'>");
	  				out.print("<div class='card'>");
	  				out.print("<div  class='card-header bg-dark text-white' role='tab' id='headingOne'>");
	  				out.print("<h5 class='mb-0'>");
	  				out.print("<a class='text-warning' data-toggle='collapse' href='#collapseOne' aria-expanded='true' aria-controls='collapseOne'>");
	  				out.print("Pedidos EM PROCESSO");
	  				out.print("</a>");
	  				out.print("</h5>");
	  				out.print("</div>");

	  				out.print("<div id='collapseOne' class='collapse ' role='tabpanel' aria-labelledby='headingOne' data-parent='#accordion'>");
	  				out.print("<div class='card-body'>");
	  				out.print("<table class='table table-striped '>");
					out.print("<thead class='bg-inverse'>");
					out.print("<th  style='color: red'><h4 align='right'>Pedidos EM PROCESSO</h4></th>");
				
						out.print("<tr>");
						out.print("<th>PRODUTOS</th>");
						out.print("<th>Status</th>");
						out.print("<th>Valor</th>");
						out.print("<th>Ações</th>");
						
					out.print("</tr>");
				out.print("</thead>");
				out.print("<tbody>");
				if (resultado != null) {
					List<EntidadeDominio> entidades = resultado.getEntidades();
				if(entidades != null){
					for (int i = 0; i < entidades.size(); i++) {
						Pedido p = (Pedido) entidades.get(i);
	  				if(p.getStatus().trim().equals("EM PROCESSO")){
	  				out.print("<tr style='border-bottom-style: dashed; border-bottom-color:red'>");
	  				
				out.print("<td>");
				
	  				out.print("<div id='exampleAccordion' data-children='.item'>");
	  				out.print("<div class='item'>");
	  				out.print("<h5> Pedido" + " " + i +"</h5><br>");
	  				out.print("<a data-toggle='collapse' data-parent='#exampleAccordion"+ i + "' href='#exampleAccordion1"+ i + "' aria-expanded='true' aria-controls='exampleAccordion1'>Ver itens do pedido  </a>");
	  				out.print(" <div id='exampleAccordion1"+ i + "' class='collapse' role='tabpanel'>");
  				out.print(" <p class='mb-3'>");
  				
	  			for (  int j = 0; j < p.getItem().size(); j++){	
				out.print(p.getItem().get(j).getLivro().getTitulo() + " Valor: " + p.getItem().get(j).getValorItem() 
						+ "x"+p.getItem().get(j).getQuantidade() + "<br>" );
				
				
				
	}
	  				
	  		
		out.print("--------------<br>");	
		
	  				out.print("</p>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</td>");
	  				out.print("<td class='text-warning'>");
				out.print("<b>" + p.getStatus() + "</b>");
			out.print("</td>");
	  			out.print("<td>");
	  			
	  		
	  			out.print("Frete: " + p.getFrete() + "<br>" );	
  	  		out.print("Total: " + p.getPrecoTotal() + "<br>");
  	  	out.print("</td>");
  			out.print("<td>");
  			out.print("<button class='btn btn-danger'> Pagar </button>");
	  	  	out.print("</td>");


					out.print("</tr>");
	  				}
	  			}
	  				out.print("</tbody>");
  				out.print("</table>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
				}
			}
				
				
				//FIM EM PROCESSO
				
				
				
				
				
				
				
				//INICIO APROVADOS ADM
				out.print("<div>");
	  				out.print("<div  id='accordion' role='tablist'>");
	  				out.print("<div class='card'>");
	  				out.print("<div  class='card-header bg-success text-white' role='tab' id='headingOne'>");
	  				out.print("<h5 class='mb-0'>");
	  				out.print("<a class='text-white' data-toggle='collapse' href='#collapseTwo' aria-expanded='true' aria-controls='collapseTwo'>");
	  				out.print("Pedidos APROVADOS");
	  				out.print("</a>");
	  				out.print("</h5>");
	  				out.print("</div>");

	  				out.print("<div id='collapseTwo' class='collapse ' role='tabpanel' aria-labelledby='headingOne' data-parent='#accordion'>");
	  				out.print("<div class='card-body'>");
	  				out.print("<table class='table table-striped '>");
					out.print("<thead class='bg-inverse'>");
					out.print("<th  style='color: red'><h4 align='right'>Pedidos APROVADOS</h4></th>");
				
						out.print("<tr>");
						out.print("<th>PRODUTOS</th>");
						out.print("<th>Status</th>");
						out.print("<th>Valor</th>");
						out.print("<th>Ações</th>");
						
					out.print("</tr>");
				out.print("</thead>");
				out.print("<tbody>");
				if (resultado != null) {
					List<EntidadeDominio> entidades = resultado.getEntidades();
					System.out.println(entidades.size());
				if(entidades != null){
					for (int i = 0; i < entidades.size(); i++) {
						Pedido p = (Pedido) entidades.get(i);
	  				if(p.getStatus().trim().equals("APROVADA")){
	  				out.print("<tr style='border-bottom-style: dashed; border-bottom-color:red'>");
	  				
				out.print("<td>");
				
	  				out.print("<div id='exampleAccordion' data-children='.item'>");
	  				out.print("<div class='item'>");
	  				out.print("<h5> Pedido" + " " + i +"</h5><br>");
	  				out.print("<a data-toggle='collapse' data-parent='#exampleAccordion"+ i + "' href='#exampleAccordion1"+ i + "' aria-expanded='true' aria-controls='exampleAccordion1'>Ver itens do pedido  </a>");
	  				out.print(" <div id='exampleAccordion1"+ i + "' class='collapse' role='tabpanel'>");
  				out.print(" <p class='mb-3'>");
  				
	  			for (  int j = 0; j < p.getItem().size(); j++){	
				out.print(p.getItem().get(j).getLivro().getTitulo() + " Valor: " + p.getItem().get(j).getValorItem() 
						+ "x"+p.getItem().get(j).getQuantidade() + "<br>" );
				
				
				
	}
	  				
	  		
		out.print("--------------<br>");	
		
	  				out.print("</p>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</td>");
	  				out.print("<td class='text-success'>");
				out.print("<b>" + p.getStatus() + "</b>");
			out.print("</td>");
	  			out.print("<td>");
	  			
	  		
	  			out.print("Frete: " + p.getFrete() + "<br>" );	
  	  		out.print("Total: " + p.getPrecoTotal() + "<br>");
  	  	out.print("</td>");
  			out.print("<td>");
  			out.print("<form form  align='center' action='Finalizar' method='POST'>");
			out.print("<input type='hidden' name='txtI' value='" + i + "'>");
  			out.print("<button  id='operacao' name='operacao' type='submit' class='btn btn-warning' value='TRANSPORTAR'> Enviar </button>");
  			
  			out.print("</form>");
	  	  	out.print("</td>");


					out.print("</tr>");
	  				}
	  			}
	  				out.print("</tbody>");
  				out.print("</table>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
				}
			}
				
				
				//FIM APROVADOS
				
				
				
				
				
				
				
				
				
				out.print("<br>");
				
				
				
				
				// INICIO REPROVADOS
				
				out.print("<div>");
	  				out.print("<div  id='accordion' role='tablist'>");
	  				out.print("<div class='card'>");
	  				out.print("<div  class='card-header bg-danger text-white' role='tab' id='headingOne'>");
	  				out.print("<h5 class='mb-0'>");
	  				out.print("<a class='text-white' data-toggle='collapse' href='#collapseThree' aria-expanded='true' aria-controls='collapseThree'>");
	  				out.print("Pedidos REPROVADOS");
	  				out.print("</a>");
	  				out.print("</h5>");
	  				out.print("</div>");

	  				out.print("<div id='collapseThree' class='collapse ' role='tabpanel' aria-labelledby='headingOne' data-parent='#accordion'>");
	  				out.print("<div class='card-body'>");
	  				out.print("<table class='table table-striped '>");
					out.print("<thead class='bg-inverse'>");
					out.print("<th  style='color: red'><h4 align='right'>Pedidos REPROVADOS</h4></th>");
				
						out.print("<tr>");
						out.print("<th>PRODUTOS</th>");
						out.print("<th>Status</th>");
						out.print("<th>Valor</th>");
						out.print("<th>Ações</th>");
						
					out.print("</tr>");
				out.print("</thead>");
				out.print("<tbody>");
				if (resultado != null) {
					List<EntidadeDominio> entidades = resultado.getEntidades();
					System.out.println(entidades.size());
				if(entidades != null){
					for (int i = 0; i < entidades.size(); i++) {
						Pedido p = (Pedido) entidades.get(i);
	  				if(p.getStatus().trim().equals("REPROVADA")){
	  				out.print("<tr style='border-bottom-style: dashed; border-bottom-color:red'>");
	  				
				out.print("<td>");
				
	  				out.print("<div id='exampleAccordion' data-children='.item'>");
	  				out.print("<div class='item'>");
	  				out.print("<h5> Pedido" + " " + i +"</h5><br>");
	  				out.print("<a data-toggle='collapse' data-parent='#exampleAccordion"+ i + "' href='#exampleAccordion1"+ i + "' aria-expanded='true' aria-controls='exampleAccordion1'>Ver itens do pedido  </a>");
	  				out.print(" <div id='exampleAccordion1"+ i + "' class='collapse' role='tabpanel'>");
  				out.print(" <p class='mb-3'>");
  				
	  			for (  int j = 0; j < p.getItem().size(); j++){	
				out.print(p.getItem().get(j).getLivro().getTitulo() + " Valor: " + p.getItem().get(j).getValorItem() 
						+ "x"+p.getItem().get(j).getQuantidade() + "<br>" );
				
				
				
	}
	  				
	  		
		out.print("--------------<br>");	
		
	  				out.print("</p>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</td>");
	  				out.print("<td class='text-danger'>");
				out.print("<b>" + p.getStatus() + "</b>");
			out.print("</td>");
	  			out.print("<td>");
	  			
	  		
	  			out.print("Frete: " + p.getFrete() + "<br>" );	
  	  		out.print("Total: " + p.getPrecoTotal() + "<br>");
  	  	out.print("</td>");
  			out.print("<td>");
  			out.print("<button class='btn btn-danger'> Pagar </button>");
	  	  	out.print("</td>");


					out.print("</tr>");
	  				}
	  			}
	  				out.print("</tbody>");
  				out.print("</table>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
				}
			}
				
				
				
  			}else{
  				
  				
  				
  				
  				//PARA CLIENTE 
  				out.print("<h3>MEUS PEDIDOS</h3>");
  				List<Pedido> pedidos = c.getPedido();
  				if(c.getPedido().size() == 0){
  					out.print("<h4 style='color:red'> Você não possui pedidos</h4>");
  				}else{
  					out.print("<div>");
  	  				out.print("<div  id='accordion' role='tablist'>");
  	  				out.print("<div class='card'>");
  	  				out.print("<div  class='card-header bg-dark text-white' role='tab' id='headingOne'>");
  	  				out.print("<h5 class='mb-0'>");
  	  				out.print("<a class='text-warning' data-toggle='collapse' href='#collapseOne' aria-expanded='true' aria-controls='collapseOne'>");
  	  				out.print("Pedidos EM PROCESSO");
  	  				out.print("</a>");
  	  				out.print("</h5>");
  	  				out.print("</div>");

  	  				out.print("<div id='collapseOne' class='collapse ' role='tabpanel' aria-labelledby='headingOne' data-parent='#accordion'>");
  	  				out.print("<div class='card-body'>");
  	  				out.print("<table class='table table-striped '>");
  					out.print("<thead class='bg-inverse'>");
  					out.print("<th  style='color: red'><h4 align='right'>Pedidos EM PROCESSO</h4></th>");
  				
  						out.print("<tr>");
  						out.print("<th>PRODUTOS</th>");
  						out.print("<th>Status</th>");
  						out.print("<th>Valor</th>");
  						out.print("<th>Ações</th>");
  						
  					out.print("</tr>");
  				out.print("</thead>");
  				out.print("<tbody>");
  	  				for(int i = 0; i < c.getPedido().size(); i++){
  	  				if(c.getPedido().get(i).getStatus().trim().equals("EM PROCESSO")){
  	  				out.print("<tr style='border-bottom-style: dashed; border-bottom-color:red'>");
  	  				
					out.print("<td>");
					
  	  				out.print("<div id='exampleAccordion' data-children='.item'>");
  	  				out.print("<div class='item'>");
  	  				out.print("<h5> Pedido" + " " + i +"</h5><br>");
  	  				out.print("<a data-toggle='collapse' data-parent='#exampleAccordion"+ i + "' href='#exampleAccordion1"+ i + "' aria-expanded='true' aria-controls='exampleAccordion1'>Ver itens do pedido  </a>");
  	  				out.print(" <div id='exampleAccordion1"+ i + "' class='collapse' role='tabpanel'>");
	  				out.print(" <p class='mb-3'>");
  	  			for (  int j = 0; j < c.getPedido().get(i).getItem().size(); j++){	
					out.print(c.getPedido().get(i).getItem().get(j).getLivro().getTitulo() + " Valor: " + c.getPedido().get(i).getItem().get(j).getValorItem() 
							+ "x"+c.getPedido().get(i).getItem().get(j).getQuantidade() + "<br>" );
					
					
					
		}
  	  		
			out.print("--------------<br>");	
			
  	  				out.print("</p>");
  	  				out.print("</div>");
  	  				out.print("</div>");
  	  				out.print("</td>");
  	  				out.print("<td class='text-warning'>");
					out.print("<b>" + c.getPedido().get(i).getStatus() + "</b>");
				out.print("</td>");
  	  			out.print("<td>");
  	  			
  	  		
  	  			out.print("Frete: " + c.getPedido().get(i).getFrete() + "<br>" );	
	  	  		out.print("Total: " + c.getPedido().get(i).getPrecoTotal() + "<br>");
	  	  	out.print("</td>");
	  			out.print("<td>");
	  			out.print("<button class='btn btn-danger'> Pagar </button>");
		  	  	out.print("</td>");


						out.print("</tr>");
  	  				}
  	  			}
  	  				out.print("</tbody>");
	  				out.print("</table>");
  	  				out.print("</div>");
  	  				out.print("</div>");
  	  				out.print("</div>");
  	  				out.print("</div>");
  	  				
  	  				
  	  				//fim pedidos em processo
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				out.print("<br>");
  	  				out.print("</hr>");
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				
  	  				//INICIO PEDIDOS APROVADOS
  	  				
  	  			out.print("<div>");
	  				out.print("<div id='accordion' role='tablist'>");
	  				out.print("<div class='card'>");
	  				out.print("<div class='card-header bg-success text-white' role='tab' id='headingOne'>");
	  				out.print("<h5 class='mb-0'>");
	  				out.print("<a class='text-white' data-toggle='collapse' href='#collapseTwo' aria-expanded='true' aria-controls='collapseTwo'>");
	  				out.print("Pedidos APROVADOS");
	  				out.print("</a>");
	  				out.print("</h5>");
	  				out.print("</div>");

	  				out.print("<div id='collapseTwo' class='collapse ' role='tabpanel' aria-labelledby='headingOne' data-parent='#accordion'>");
	  				out.print("<div class='card-body'>");
	  				out.print("<table class='table table-striped '>");
					out.print("<thead class='bg-inverse'>");
					out.print("<th  style='color: red'><h4 align='right'>Pedidos APROVADOS</h4></th>");
				
						out.print("<tr>");
						out.print("<th>PRODUTOS</th>");
						out.print("<th>Status</th>");
						out.print("<th>Valor</th>");
						out.print("<th>Ações</th>");
						
					out.print("</tr>");
				out.print("</thead>");
				out.print("<tbody>");
	  				for(int i = 0; i < c.getPedido().size(); i++){
	  				if(c.getPedido().get(i).getStatus().trim().equals("APROVADA")){
	  				out.print("<tr style='border-bottom-style: dashed; border-bottom-color:red'>");
	  				
				out.print("<td>");
				
	  				out.print("<div id='exampleAccordion2' data-children='.item'>");
	  				out.print("<div class='item'>");
	  				out.print("<h5> Pedido" + " " + i +"</h5><br>");
	  				out.print("<a data-toggle='collapse' data-parent='#exampleAccordion2"+ i + "' href='#exampleAccordion2"+ i + "' aria-expanded='true' aria-controls='exampleAccordion1'>Ver itens do pedido  </a>");
	  				out.print(" <div id='exampleAccordion2"+ i + "' class='collapse' role='tabpanel'>");
  				out.print(" <p class='mb-3'>");
	  			for (  int j = 0; j < c.getPedido().get(i).getItem().size(); j++){	
				out.print(c.getPedido().get(i).getItem().get(j).getLivro().getTitulo() + " Valor: " + c.getPedido().get(i).getItem().get(j).getValorItem() 
						+ "x"+c.getPedido().get(i).getItem().get(j).getQuantidade() + "<br>" );
				
				
				
	}
	  		
		out.print("--------------<br>");	
		
	  				out.print("</p>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</td>");
	  				out.print("<td class='text-success'>");
				out.print("<b>" + c.getPedido().get(i).getStatus() + "</b>");
			out.print("</td>");
	  			out.print("<td>");
	  			
	  		
	  			out.print("Frete: " + c.getPedido().get(i).getFrete() + "<br>" );	
  	  		out.print("Total: " + c.getPedido().get(i).getPrecoTotal() + "<br>");
  	  	out.print("</td>");
  			out.print("<td>");
	  	  	out.print("</td>");


					out.print("</tr>");
	  				}
	  			}
	  				out.print("</tbody>");
  				out.print("</table>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
  	  		
	  				
	  				
	  				//FIM PEDIDOS APROVADOS
	  				
	  				
	  				
	  				
	  				
	  				
	  				
	  				out.print("<br>");
	  				
	  				
	  				
	  				
	  				
	  				
	  				
	  				
	  				//INICIO PEDIDOS REPROVADOS
	  				
	  				
	  				out.print("<div>");
	  				out.print("<div id='accordion' role='tablist'>");
	  				out.print("<div class='card'>");
	  				out.print("<div class='card-header bg-danger text-white' role='tab' id='headingOne'>");
	  				out.print("<h5 class='mb-0'>");
	  				out.print("<a class='text-white' data-toggle='collapse' href='#collapseThree' aria-expanded='true' aria-controls='collapseThree'>");
	  				out.print("Pedidos REPROVADOS");
	  				out.print("</a>");
	  				out.print("</h5>");
	  				out.print("</div>");

	  				out.print("<div id='collapseThree' class='collapse ' role='tabpanel' aria-labelledby='headingOne' data-parent='#accordion'>");
	  				out.print("<div class='card-body'>");
	  				out.print("<table class='table table-striped '>");
					out.print("<thead class='bg-inverse'>");
					out.print("<th  style='color: red'><h4 align='right'>Pedidos REPROVADOS</h4></th>");
				
						out.print("<tr>");
						out.print("<th>PRODUTOS</th>");
						out.print("<th>Status</th>");
						out.print("<th>Valor</th>");
						out.print("<th>Ações</th>");
						
					out.print("</tr>");
				out.print("</thead>");
				out.print("<tbody>");
	  				for(int i = 0; i < c.getPedido().size(); i++){
	  				if(c.getPedido().get(i).getStatus().trim().equals("REPROVADA")){
	  				out.print("<tr style='border-bottom-style: dashed; border-bottom-color:red'>");
	  				
				out.print("<td>");
				
	  				out.print("<div id='exampleAccordion2' data-children='.item'>");
	  				out.print("<div class='item'>");
	  				out.print("<h5> Pedido" + " " + i +"</h5><br>");
	  				out.print("<a data-toggle='collapse' data-parent='#exampleAccordion2"+ i + "' href='#exampleAccordion2"+ i + "' aria-expanded='true' aria-controls='exampleAccordion1'>Ver itens do pedido  </a>");
	  				out.print(" <div id='exampleAccordion2"+ i + "' class='collapse' role='tabpanel'>");
  				out.print(" <p class='mb-3'>");
	  			for (  int j = 0; j < c.getPedido().get(i).getItem().size(); j++){	
				out.print(c.getPedido().get(i).getItem().get(j).getLivro().getTitulo() + " Valor: " + c.getPedido().get(i).getItem().get(j).getValorItem() 
						+ "x"+c.getPedido().get(i).getItem().get(j).getQuantidade() + "<br>" );
				
				
				
	}
	  		
		out.print("--------------<br>");	
		
	  				out.print("</p>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</td>");
	  				out.print("<td class='text-danger'>");
				out.print("<b>" + c.getPedido().get(i).getStatus() + "</b>");
			out.print("</td>");
	  			out.print("<td>");
	  			
	  		
	  			out.print("Frete: " + c.getPedido().get(i).getFrete() + "<br>" );	
  	  		out.print("Total: " + c.getPedido().get(i).getPrecoTotal() + "<br>");
  	  	out.print("</td>");
  			out.print("<td>");
  			out.print("<button class='btn btn-danger'> Pagar </button>");
	  	  	out.print("</td>");


					out.print("</tr>");
	  				}
	  			}
	  				out.print("</tbody>");
  				out.print("</table>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
	  				out.print("</div>");
  						
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