package livro.controle.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import livro.controle.web.command.ICommand;
import livro.controle.web.command.impl.AlterarCommand;
import livro.controle.web.command.impl.AplicarCommand;
import livro.controle.web.command.impl.ComprarCommand;
import livro.controle.web.command.impl.ConsultarCommand;
import livro.controle.web.command.impl.ExcluirCommand;
import livro.controle.web.command.impl.LogarCommand;
import livro.controle.web.command.impl.SalvarCommand;
import livro.controle.web.command.impl.VisualizarCommand;
import livro.controle.web.vh.IViewHelper;
import livro.controle.web.vh.impl.AdicionarItensCarrinho;
import livro.controle.web.vh.impl.ClienteViewHelper;
import livro.controle.web.vh.impl.CupomViewHelper;
import livro.controle.web.vh.impl.EnderecoViewHelper;
import livro.controle.web.vh.impl.FinalizarViewHelper;
import livro.controle.web.vh.impl.LivroViewHelper;
import livro.controle.web.vh.impl.Logar;
import livro.core.aplicacao.Resultado;
import livro.dominio.EntidadeDominio;
import livro.dominio.Item;
import livro.dominio.Livros;

public class Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static Map<String, ICommand> commands;
	private static Map<String, IViewHelper> vhs;
	
	
    /**
     * Default constructor. 
     */
    public Servlet() {
    	
    	/* Utilizando o command para chamar a fachada e indexando cada command 
    	 * pela opera��o garantimos que esta servelt atender� qualquer opera��o */
    	commands = new HashMap<String, ICommand>();
    	
    	
    	
    	commands.put("SALVAR", new SalvarCommand());
    	commands.put("LOGAR", new ConsultarCommand());
    	commands.put("EXCLUIR", new ExcluirCommand());
    	commands.put("CONSULTAR", new ConsultarCommand());
    	commands.put("VISUALIZAR", new VisualizarCommand());
    	commands.put("ALTERAR", new AlterarCommand());
    	commands.put("MOSTRAR", new ConsultarCommand());
    	commands.put("VISUALIZARC", new VisualizarCommand());
    	commands.put("CONSULTARLIVRO", new ConsultarCommand());
    	commands.put("COMPRAR", new ComprarCommand());
    	commands.put("SOMAR", new ComprarCommand());
    	commands.put("SUBTRAIR", new ComprarCommand());
    	commands.put("REMOVER", new ComprarCommand());
    	commands.put("CALCULAR", new ComprarCommand());
    	commands.put("SAIR", new LogarCommand());
    	commands.put("CONSULTARENDERECO", new ConsultarCommand());
    	commands.put("SELECIONAR", new ComprarCommand());
    	commands.put("APLICAR", new ConsultarCommand());
    	commands.put("FINALIZAR", new SalvarCommand());



    	
    	/* Utilizando o ViewHelper para tratar especifica��es de qualquer tela e indexando 
    	 * cada viewhelper pela url em que esta servlet � chamada no form
    	 * garantimos que esta servelt atender� qualquer entidade */
    	
    	vhs = new HashMap<String, IViewHelper>();
    	/*A chave do mapa � o mapeamento da servlet para cada form que 
    	 * est� configurado no web.xml e sendo utilizada no action do html
    	 */
    	vhs.put("/livro-web/SalvarLivro", new LivroViewHelper());
    	vhs.put("/livro-web/SalvarEndereco", new EnderecoViewHelper());
    	vhs.put("/livro-web/Sair", new Logar());
    	vhs.put("/livro-web/Login", new ClienteViewHelper());
    	vhs.put("/livro-web/SalvarCliente", new ClienteViewHelper());
    	vhs.put("/livro-web/FormLivros", new LivroViewHelper());
    	vhs.put("/livro-web/FormLCliente", new LivroViewHelper());
    	vhs.put("/livro-web/Livro", new LivroViewHelper());
    	vhs.put("/livro-web/Carrinho", new AdicionarItensCarrinho());
    	vhs.put("/livro-web/SalvarCupom", new CupomViewHelper());
    	vhs.put("/livro-web/Finalizar", new FinalizarViewHelper());

    	

    	
    	
    	//vhs.put("/les12015-web/SalvarProduto", new ProdutoViewHelper());
    	
    	
    	
    }
    
    
    /** 
     * TODO Descri��o do M�todo
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     * @see javax.servlet.http.HttpServlet#doGet(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException,
    		IOException {
    	doProcessRequest(request, response);
    	


    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcessRequest(request, response);
		
	}
	
	
	protected void doProcessRequest(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
	
		//Obt�m a uri que invocou esta servlet (O que foi definido no methdo do form html)
		String uri = request.getRequestURI();
		request.getSession().setAttribute("url", uri);
		
		

		
		//Obt�m a opera��o executada
		String operacao = request.getParameter("operacao");
		
		//Obt�m um viewhelper indexado pela uri que invocou esta servlet
		IViewHelper vh = vhs.get(uri);
		
		//O viewhelper retorna a entidade especifica para a tela que chamou esta servlet
		EntidadeDominio entidade =  vh.getEntidade(request);

		//Obt�m o command para executar a respectiva opera��o
		ICommand command = commands.get(operacao);
		
		
		/*Executa o command que chamar� a fachada para executar a opera��o requisitada
		 * o retorno � uma inst�ncia da classe resultado que pode conter mensagens derro 
		 * ou entidades de retorno
		 */
		Resultado resultado = command.execute(entidade);
		
		/*
		 * Executa o m�todo setView do view helper espec�fico para definir como dever� ser apresentado 
		 * o resultado para o usu�rio
		 */
		vh.setView(resultado, request, response);
	
	}

}
