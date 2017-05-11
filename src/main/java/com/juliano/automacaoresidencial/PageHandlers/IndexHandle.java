/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.PageHandlers;

import com.juliano.automacaoresidencial.Core.IFTratadorDePaginas;
import com.juliano.automacaoresidencial.DTO.AmbienteDTO;
import com.juliano.automacaoresidencial.Objetos.Ambiente;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author juliano
 */
public class IndexHandle implements IFTratadorDePaginas{    
    
    @Override
    public String processar(HttpServletRequest request, HttpServletResponse response) {
        AmbienteDTO ambiente = new AmbienteDTO();
        String botaoSubmit = request.getParameter("botaoSubmit"); 
        String botaoAmbienteId = request.getParameter("botaoSubmitAmbienteId");
        String TESTE = "oioioioiio";
        String jspURL = "/index.jsp";
        
        if(botaoSubmit!=null){
            switch(botaoSubmit){
            case "EditarCasa":
                System.out.println("Editando Casa");
            case "DetalhesCasa":
                System.out.println("Detalhando Casa");
            }            
        }
        
        if(botaoAmbienteId != null){
            
            switch(botaoAmbienteId){
                case "sAmbiente":
                    request.getSession().setAttribute("disableDesp", "disabled");
                    request.getSession().setAttribute("selecAmb", "Selecione o Ambiente");
                    request.getSession().setAttribute("disableAmbDet", "disabled");
                    break;
                default:
                    Ambiente amb = new Ambiente();
                    amb = ambiente.getAmbienteSelecionado(Integer.parseInt(botaoAmbienteId));
                    request.getSession().setAttribute("selecAmb", amb.getNome());
                    System.out.println(ambiente.getAmbienteSelecionado(Integer.parseInt(botaoAmbienteId)).getNome());
                    request.getSession().setAttribute("disableDesp", "activate");
                    request.getSession().setAttribute("disableAmbDet", "activate");
            }
            
        }
        
        
        return jspURL;
    }
    
}
