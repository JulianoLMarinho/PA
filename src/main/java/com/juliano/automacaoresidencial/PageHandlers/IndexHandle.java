/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.PageHandlers;

import com.juliano.automacaoresidencial.Core.IFTratadorDePaginas;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juliano
 */
public class IndexHandle implements IFTratadorDePaginas{

    @Override
    public String processar(HttpServletRequest request, HttpServletResponse response) {
        String botaoSubmit = request.getParameter("botaoSubmit");        
        String jspURL = "/index.jsp";
        
        switch(botaoSubmit){
            case "EditarCasa":
                System.out.println("Editando Casa");
            case "DetalhesCasa":
                System.out.println("Detalhando Casa");
        }
        
        return jspURL;
    }
    
}
