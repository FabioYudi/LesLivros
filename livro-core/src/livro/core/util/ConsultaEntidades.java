package livro.core.util;

import java.util.ArrayList;
import java.util.List;

import livro.dominio.CupomDesconto;
import livro.dominio.EntidadeDominio;

public class ConsultaEntidades {
	
	private static CupomDesconto cup;
	private static List<EntidadeDominio> entidades;
	
	public static void setEntidades(List<EntidadeDominio> entidade) {
		entidades = entidade;
		
	}
	
	public static CupomDesconto getCupom() {
		return cup;
	}
	public static void setCupom(CupomDesconto cupom) {
		cup =  cupom;
		
	}
	
	public static void VerificaCupom(EntidadeDominio cupom) {
		if(cupom instanceof CupomDesconto) {
			cup = (CupomDesconto) cupom;
		}else {
			cup = null;
		}
	}
	
	
	
	public static EntidadeDominio consultar () {
	
		for(EntidadeDominio lista : entidades) {
			CupomDesconto cupom = (CupomDesconto) lista;
			System.out.println("cupom do dao " + cupom.getCupom());
			System.out.println("cupom digitado: " + cup.getCupom());
			if(cupom.getCupom().trim().equals(cup.getCupom())) {
				return cupom;
				
				
			}
			
		}
		
		return null;
	}

	

	
}
