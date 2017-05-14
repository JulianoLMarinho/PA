/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.PageHandlers;

import com.juliano.automacaoresidencial.Core.IFTratadorDePaginas;
import com.juliano.automacaoresidencial.DTO.AmbienteDTO;
import com.juliano.automacaoresidencial.DTO.CasaDTO;
import com.juliano.automacaoresidencial.DTO.DispositivoDTO;
import com.juliano.automacaoresidencial.Objetos.Ambiente;
import com.juliano.automacaoresidencial.Objetos.Casa;
import com.juliano.automacaoresidencial.Objetos.Dispositivo;
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
        DispositivoDTO dispositivo = new DispositivoDTO();
        CasaDTO casa = new CasaDTO();
        String botaoEditarCasa = request.getParameter("botaoEditarCasa");
        String botaoSubmit = request.getParameter("botaoSubmit"); 
        String botaoAmbienteId = request.getParameter("botaoSubmitAmbienteId");
        String botaoDispositivoId = request.getParameter("botaoSubmitDispositivoId");
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
                    request.getSession().setAttribute("disableDisp", "disabled");
                    request.getSession().setAttribute("selecAmb", "Selecione o Ambiente");
                    request.getSession().setAttribute("disableAmbDet", "disabled");
                    request.getSession().setAttribute("disableDispDet", "disabled");
                    break;
                default:
                    Ambiente amb;
                    amb = ambiente.getAmbienteSelecionado(Integer.parseInt(botaoAmbienteId));
                    request.getSession().setAttribute("idSelecAmb", amb.getId());
                    request.getSession().setAttribute("selecAmb", amb.getNome());
                    System.out.println(ambiente.getAmbienteSelecionado(Integer.parseInt(botaoAmbienteId)).getNome());
                    request.getSession().setAttribute("disableDisp", "activate");
                    request.getSession().setAttribute("disableAmbDet", "activate");
                    request.getSession().setAttribute("selecDisp", "Selecione o Dispositivo");
                    request.getSession().setAttribute("disableDispDet", "disabled");
            }
            
        }
        
        if(botaoDispositivoId != null){
            switch(botaoDispositivoId){
                case "sDispositivo":
                    request.getSession().setAttribute("disableDispDet", "disabled");
                    request.getSession().setAttribute("selecDisp", "Selecione o Dispositivo");
                    break;
                default:
                    Dispositivo disp;
                    disp = dispositivo.getDispositivoSelecionado(Integer.parseInt(botaoDispositivoId));
                    request.getSession().setAttribute("selecDisp", disp.getNome());
                    request.getSession().setAttribute("disableDispDet", "activate");
            }
        }
        
        if (botaoEditarCasa != null) {
            switch (botaoEditarCasa) {
                case "EditarCasa":
                    Casa casaTemp = new Casa();
                    casaTemp.setAll(1, request.getParameter("nomeCasa"), request.getParameter("nomeRua"), Integer.parseInt(request.getParameter("nomeNumero")), request.getParameter("nomeComplemento"));
                    casa.atualizaCasa(casaTemp);
            }

        }
        
        return jspURL;
    }
    
}
