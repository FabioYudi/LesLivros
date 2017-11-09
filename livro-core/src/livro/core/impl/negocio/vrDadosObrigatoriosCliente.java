package livro.core.impl.negocio;

import livro.core.IStrategy;
import livro.dominio.Cliente;
import livro.dominio.EntidadeDominio;
import livro.dominio.Livros;

public class vrDadosObrigatoriosCliente implements IStrategy {
	@Override
	public String processar(EntidadeDominio entidade) {
		
		if(entidade instanceof Livros){
			Cliente cliente = (Cliente)entidade;
			
			String CPF = cliente.getCpf();
			String genero = cliente.getGenero();
			String nome = cliente.getNome();
			String nascimento = cliente.getNascimento();
			String numTel = cliente.getTelefone().getNumero();
			String ddd = cliente.getTelefone().getCodArea();
			int tipoTel = cliente.getTelefone().getTp();
			String email = cliente.getEmail();
			String senha = cliente.getSenha();
			
			
			if(CPF == null || genero == null || nome==null || nascimento == null || numTel == null   || ddd == null  ||
					tipoTel == 0 || email == null || senha == null){
				return "Cpf, genero, nome, data de nascimento, numero do telefone, ddd, "
						+ "tipo do telefone, email e senha são de preenchimento obrigatório!";
				
		   
			}
			
			if(CPF.trim().equals("") || genero.trim().equals("") || 
					nome.trim().equals("")|| nascimento.trim().equals("") || numTel.trim().equals("")
					|| ddd.trim().equals("") || email.trim().equals("") || senha.trim().equals("")){
				return "Cpf, genero, nome, data de nascimento, numero do telefone, ddd, "
						+ "tipo do telefone, email e senha são de preenchimento obrigatório!";
			}
			
		}else{
			return "Deve ser registrado um Cliente!";
		}
		
		
		return null;
	}
	

}
