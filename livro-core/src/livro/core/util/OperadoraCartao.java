package livro.core.util;

import java.util.Random;

public class OperadoraCartao {
	
public static String validar() {
	int i = 0;
	Random random = new Random();
	i = random.nextInt(10);
	if(i < 0) {
		return "APROVADO";
	}
	return null;
}
	

}
