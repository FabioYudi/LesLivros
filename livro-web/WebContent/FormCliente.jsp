
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    <%@ page
	import="livro.core.aplicacao.Resultado, livro.dominio.*, java.util.*"%>
    
    
    
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
  <link rel="stylesheet" type="text/css" href="resources/css/estilo.css">
  <script language="JavaScript" src="resources/js/teste.js"></script>

<meta charset="ISO-8859-1">

<title>:::: CADASTRO DE CLIENTES::::</title>

</head>
<body >
<%
	Cliente cliente = (Cliente)request.getAttribute("cliente");
%>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" >
      <div class="container" >
        <a class="navbar-brand" href="#">Cadastro</a>
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
<br><br><br><br>
<div class="container">
<ul class="abas">
    <!-- Aqui, criação da primeira aba -->
    <li class="aba" id="aba-1">
     <a>Pessoal</a>
     
<div id="FormCliente3">
     	


	<form  action="SalvarCliente" method="post" align="center">
		<div class="container">
		<div class="form-group">
		<label for="txtNome">Nome:</label>
		<input type="text" id="txtNome" name="txtNome" required="true" style="margin-right: 10px" onkeyup="habi()" value=
		 
		<%		
			if(cliente != null)
				out.print("'"+cliente.getNome()+"'>"); 
			else
				out.print(">"); 		
		%>
	</input>
	
		<label class="txtGenero" for="txtGenero" >Genero:</label>
		 <select id="txtGenero" name="txtGenero" required="true" style="margin-right: 10px">
            <option value='M' ${cliente.getGenero() == 'M'? 'selected' : ''}>Masculino</option>
            <option value='F' ${cliente.getGenero() ==  'F' ? 'selected' : ''}>Feminino</option>
        </select>
        
        
      
                
                
           <label class="txtDtNasc" for="txtDtNasc" >Data de nascimento:</label>
<input type="text" name="txtDtNasc" id="txtDtNasc" maxlength="10" onkeypress="mascaraData(this)" value=

		<%		
			if(cliente != null)
				out.print("'"+cliente.getNascimento()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		 </input>
		 
	
		
		<label class="txtCpf" for="txtCpf" >Cpf:</label>
		<input type="text" id="txtCpf" onkeyup="habi()" name="txtCpf"" required="true" style="margin-right: 10px"  value=
		 
		<%		
			if(cliente != null)
				out.print("'"+cliente.getCpf()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		<br><br>
		<label class="txtEmail" for="txtEmail">Email:</label>
		<input type="text" id="txtEmail" name="txtEmail" size="40px" required="true" style="margin-right: 10px" onkeyup="habi()" value=
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEmail()+"'>"); 
			else
				out.print(">"); 		
		%>
		</input>
		
		</div>
		
		<div class="form-group">
		
		<label for="txtSenha">Senha:</label>
		<input type="password" id="txtSenha" name="txtSenha" required="true" style="margin-right: 10px" onkeyup="habi()" onkeyup="senha()" value=
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getSenha()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		
		<label for="txtSenha2">Repita a Senha:</label>
		<input type="password" id="txtSenha2" name="txtSenha2" required="true" style="margin-right: 10px" onkeyup="habi()"  value=
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getSenha()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		</div>
		
		
		
		
		<div class="form-group">
		
	
		
		
  	
  	
		<label class="txtStatus" for="txtStatus">Status:</label>
		
		 
		 <select id="txtStatus" name="txtStatus" required="true">
            <option value="true" ${cliente.getStatus() == true? 'selected' : ''}>Ativo</option>
            <option value="false" ${cliente.getStatus() ==  false ? 'selected' : ''}>Inativo</option>
        </select>
  		
  		
  		
  		</div>
		
		
	<label class="txtTipo" for="txtTipo">Tipo Tel:</label>
		
		 
		 <select id="txtTipo" name="txtTipo" required="true" style="margin-right: 10px">
            <option value="1" ${cliente.getTelefone().getTp() == 1? 'selected' : ''}>Residencial</option>
            <option value="0" ${cliente.getTelefone().getTp() ==  0 ? 'selected' : ''}>Celular</option>
        </select>
  		
  		<label for="txtCodigo">DDD:</label>
		<input type="text" id="txtCodigo" name="txtCodigo" maxlength="3" size="4" required="true" style="margin-bottom: 20px"  value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getTelefone().getCodArea()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
  		
		
		
		<label for="txtTelefone">Telefone:</label>
		<input type="text" id="txtTelefone" name="txtTelefone" maxlength="9" required="true" style="margin-bottom: 20px"  value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getTelefone().getNumero()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		
		

		
		<input type="hidden" id="txtId" name="txtId" value=
		<%		
			if(cliente != null)
				out.print("'"+cliente.getId()+"'>"); 
			else
				out.print(">"); 		
		%>
		</input>		
		
			</div>
		
		</div>
				
	<br> <br> <br>
		<!-- ENDEREÇO -->	
		<div class="container">
<li class="aba" id="aba-3">
     <a>Endereço</a> 
     
     <section class="conteudo">
		<div class="form-group" align="center">
		
		<label for="txtNomeRua">Nome Do Endereço(Ex: Entrega, cobrança):</label>
		<input type="text" id="txtNomeRua" name="txtNomeRua" maxlength="9" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getNome()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		</div>
		
     	
     <div class="form-group" align="center">
     
		<label for="txtTpLog">Tipo Logradouro:</label>
		<input type="text" id="txtTpLog" name="txtTpLog" maxlength="9" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getTipoLogradouro()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		<label for="txtLogradouro">Logradouro:</label>
		<input type="text" id="txtLogradouro" name="txtLogradouro" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getLogradouro()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		<label for="txtNumero">Número:</label>
		<input type="text" id="txtNumero" name="txtNumero" maxlength="4" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getNumero()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		</div>
		
		
		<div class="form-group" align="center">
		<label for="txtCep">CEP:</label>
		<input type="text" id="txtCep" name="txtCep" maxlength="8" size="10px" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getCep()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		<label for="txtBairro">Bairro:</label>
		<input type="text" id="txtBairro" name="txtBairro" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getBairro()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		
			<label for="txtComplemento">Complemento:</label>
		<input type="text" id="txtComplemento" name="txtComplemento" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getComplemento()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		</div>
		<div class="form-group" align="center">
		<label for="txtTpRes">Tipo de Residência:</label>
		<input type="text" id="txtTpRes" name="txtTpRes" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getTipoResidencia()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		
		
		
		<label for="txtCidade">Cidade:</label>
		<input type="text" id="txtCidade" name="txtCidade" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getCidade().getNome()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		<label for="txtEstado">Estado:</label>
		<input type="text" id="txtEstado" name="txtEstado" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getCidade().getEstado().getNome()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		
		<label for="txtPais">Pais:</label>
		<input type="text" id="txtPais" name="txtPais" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getEndereco().getCidade().getEstado().getPais().getNome()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		
		
		
		
		
		</div>
		
		
		
		
		
			
		</li>
	</section>	
	
	</div>
	<!-- Cartão -->
	
	
	<li class="aba" id="aba-3">
     <a>Cartão</a> 
     <br> <br>
     <section class="conteudo">
     
     <div class="form-group">
     
     <label for="txtTitular">Titular:</label>
		<input type="text" id="txtTitular" name="txtTitular" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getCartao().getTitular()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		 <label for="txtNumCar">Número no cartão:</label>
		<input type="text" id="txtNumCar" name="txtNumCar" maxlength="40" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getCartao().getNumero()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		 <label for="txtCodigoCar">ccv:</label>
		<input type="text" id="txtCodigoCar" name="txtCodigoCar" maxlength="3" size="4" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getCartao().getCodigo()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		 <label for="txtValidade">validade:</label>
		<input type="text" id="txtValidade" name="txtValidade" maxlength="10"  required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getCartao().getValidade()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
		
		 <label for="txtBandeira">Bandeira:</label>
		<input type="text" id="txtBandeira" name="txtBandeira" maxlength="20" required="true" style="margin-bottom: 20px" value=
		
		
		<%		
			if(cliente != null)
				out.print("'"+cliente.getCartao().getBandeira()+"'>"); 
			else
				out.print(">"); 		
		%>
		
		</input>
     
     
     
     
     </div>
     <div align="center">
     <%		
			if(cliente != null) {
				out.print("<input type='submit' id='operacao' name='operacao' value='ALTERAR'  class='btn btn-primary'/>");	
			}else{
				out.print("<input onsubmit='senha()' type='submit' id='operacao' name='operacao' value='SALVAR' class='btn btn-primary'/>");
			}
				
		%>		
		</div>
		</li>
		</section>
		
	</form>
</div>







		
		
		
	


</ul>


	
		 
		
</body>
</html>