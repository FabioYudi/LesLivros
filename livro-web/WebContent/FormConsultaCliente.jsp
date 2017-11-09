<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<META http-equiv="Content-Type" content="text/html; charset=utf-8">

<title>:::: CONSULTAR CLIENTES::::</title>


 <nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Clientes</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
      <a class="nav-item nav-link active" href="FormCliente.jsp">Cadastrar</a>
      <a class="nav-item nav-link active" href="FormConsultaCliente.jsp">Consultar</a>
    </div>
    </div>
  
</nav>
</head>
<body>

	<%
		Resultado resultado = (Resultado) session.getAttribute("resultado");
	%>

	<form action="SalvarCliente" method="post" align="center">

		
		 <label for="txtNome">Nome: </label> 
		 <input type="text" id="txtNome" name="txtNome"  /> 
		 Status:
		 <select id="txtStatus" name="txtStatus">
            <option>Todos</option>
            <option value="true">Ativos</option>
            <option value="false">Inativos</option>
        </select>
		 <label for="txtDtNasc">Nascimento: </label>
		 <input type="text" id="txtDtNasc" name="txtDtNasc"/>
		 <label for="txtGenero">Genero: </label>
		 <input type="text" id="txtGenero" name="txtGenero"/>
		 <label for="txtCpf">Cpf: </label>
		 <input type="text" id="txtCpf" name="txtCpf"/>
		 </br>
		 <label for="txtEmail">Email: </label>
		 <input type="text" id="txtEmail" name="txtEmail"/>
		
		 
		 <input type="submit" id="operacao" name="operacao" value="CONSULTAR" class='btn btn-primary' />
	</form>

	


	<%
	
	if(resultado !=null && resultado.getMsg() != null){
		out.print(resultado.getMsg());
	}
	
	%>
<BR>

<TABLE BORDER="5"    WIDTH="50%"   CELLPADDING="4" CELLSPACING="3" class="table">

   <TR>
      <TH COLSPAN="40"><BR>
      	<H3>Livros</H3>
      </TH>
   </TR>
   
   <TR>
 
   
      <TH>ID:</TH>
      <TH>Nome:</TH>
      <TH>Nascimento:</TH>
      <TH>Genero:</TH>
      <TH>CPF:</TH>
      <TH>Email:</TH>
      <TH>Status:</TH>
      <TH>DDD:</TH>
      <TH>Num Tel:</TH>
      <TH>Tipo Tel:</TH>
      <TH>Tipo Logradouro:</TH>
      <TH>Logradouro:</TH>
      <TH>Bairro:</TH>
      <TH>Número:</TH>
      <TH>CEP:</TH>
      <TH>Cidade:</TH>
      <TH>Estado:</TH>
      <TH>Pais:</TH>
      <TH>Num cartão</TH>
      <TH>Código de segurança</TH>
      <TH>Validade</TH>
      <TH>Bandeira</TH>
      
     
      
   </TR>
   
   
   <%
   
   if (resultado != null) {
		List<EntidadeDominio> entidades = resultado.getEntidades();
		StringBuilder sbRegistro = new StringBuilder();
		StringBuilder sbLink = new StringBuilder();
		
		
		if(entidades != null){
			for (int i = 0; i < entidades.size(); i++) {
				Cliente c = (Cliente) entidades.get(i);
				sbRegistro.setLength(0);
				sbLink.setLength(0);
				
			//	<a href="nome-do-lugar-a-ser-levado">descrição</a>
				
				sbRegistro.append("<TR ALIGN='CENTER'>");
				
				sbLink.append("<a href=SalvarCliente?");
					sbLink.append("txtId=");
					sbLink.append(c.getId());						
					sbLink.append("&");
					sbLink.append("operacao=");
					sbLink.append("VISUALIZAR");
					
				sbLink.append(">");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());	
				sbRegistro.append(c.getId() == null ? ' ' : c.getId());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());	
				sbRegistro.append(c.getNome());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getNascimento());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getGenero());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getCpf());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEmail());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getStatus() == true ? "Ativo" : "Inativo");
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getTelefone().getCodArea());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getTelefone().getNumero());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getTelefone().getTp() == 0 ? "Residencial" : "Celular");
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEndereco().getTipoLogradouro());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEndereco().getLogradouro());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEndereco().getBairro());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEndereco().getNumero());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
		
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEndereco().getCep());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEndereco().getCidade().getNome());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEndereco().getCidade().getEstado().getNome());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getEndereco().getCidade().getEstado().getPais().getNome());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getCartao().getNumero());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getCartao().getCodigo());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getCartao().getValidade());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				sbRegistro.append("<TD>");
				sbRegistro.append(sbLink.toString());				
				sbRegistro.append(c.getCartao().getBandeira());
				sbRegistro.append("</a>");				
				sbRegistro.append("</TD>");
				
				
				
				
				
				
			
				
				sbRegistro.append("</TR>");
				
				out.print(sbRegistro.toString());
				
			}
		}
		

	}
   
   %>
   
   
      
  
</TABLE>


</body>
</html>