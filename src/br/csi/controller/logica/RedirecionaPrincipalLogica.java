package br.csi.controller.logica;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RedirecionaPrincipalLogica implements Logica{

	@Override
	public String executa(HttpServletRequest rq, HttpServletResponse rp) {
			 System.out.println("dentro do redirecinamento ....");
			
			
			return "/WEB-INF/jsp/principal.jsp";
	}

}
