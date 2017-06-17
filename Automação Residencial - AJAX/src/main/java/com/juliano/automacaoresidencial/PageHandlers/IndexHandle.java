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
import sun.misc.Request;

/**
 *
 * @author juliano
 */
public class IndexHandle implements IFTratadorDePaginas {

    @Override
    public String processar(HttpServletRequest request, HttpServletResponse response) {
        AmbienteDTO ambiente = new AmbienteDTO();
        DispositivoDTO dispositivo = new DispositivoDTO();
        CasaDTO casa = new CasaDTO();
        String submitModal = request.getParameter("submitModal");
        String botaoSubmit = request.getParameter("botaoSubmit");
        String botaoAmbienteId = request.getParameter("botaoSubmitAmbienteId");
        String botaoDispositivoId = request.getParameter("botaoSubmitDispositivoId");
        String jspURL = "/index.jsp";

        if (botaoSubmit != null) {
            switch (botaoSubmit) {
                case "EditarCasa":
                    System.out.println("Editando Casa");
                case "DetalhesCasa":
                    System.out.println("Detalhando Casa");
            }
        }

        if (botaoAmbienteId != null) {

            switch (botaoAmbienteId) {
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
                    request.getSession().setAttribute("disableDisp", "activate");
                    request.getSession().setAttribute("disableAmbDet", "activate");
                    request.getSession().setAttribute("selecDisp", "Selecione o Dispositivo");
                    request.getSession().setAttribute("disableDispDet", "disabled");
            }

        }

        if (botaoDispositivoId != null) {
            switch (botaoDispositivoId) {
                case "sDispositivo":
                    request.getSession().setAttribute("disableDispDet", "disabled");
                    request.getSession().setAttribute("selecDisp", "Selecione o Dispositivo");
                    break;
                default:
                    Dispositivo disp;
                    disp = dispositivo.getDispositivoSelecionado(Integer.parseInt(botaoDispositivoId));
                    request.getSession().setAttribute("selecIdDisp", disp.getId());
                    request.getSession().setAttribute("selecDisp", disp.getNome());
                    request.getSession().setAttribute("disableDispDet", "activate");
            }
        }

        if (submitModal != null) {
            switch (submitModal) {
                case "EditarCasa":
                    Casa casaTemp = new Casa();
                    casaTemp.setAll(1, request.getParameter("nomeCasa"), request.getParameter("nomeRua"), Integer.parseInt(request.getParameter("nomeNumero")), request.getParameter("nomeComplemento"));
                    casa.atualizaCasa(casaTemp);
                    break;

                case "AdicionarAmbiente":
                    Ambiente novoAmbiente = new Ambiente();
                    novoAmbiente.setAll(request.getParameter("nomeAmbiente"), request.getParameter("nomeDetAmb"), Integer.parseInt(request.getParameter("nomeIdCasa")));
                    ambiente.inserirAmbiente(novoAmbiente);
                    break;

                case "AdicionarDispositivo":
                    Dispositivo novoDispositivo = new Dispositivo();
                    //novoDispositivo.setAll(request.getParameter("nomeDispositivo"), Integer.parseInt(request.getParameter("nomeIdAmbiente")));
                    dispositivo.inserirDispositivo(novoDispositivo);
                    break;

                case "ExcluirAmbiente":
                    if (dispositivo.excluirPorAmbiente(Integer.parseInt(request.getParameter("nomeIdAmbiente")))) {
                        if (ambiente.excluirPorAmbiente(Integer.parseInt(request.getParameter("nomeIdAmbiente")))) {
                            System.out.println("Ambiente (e todos os seus dispositivos) Excluído Com Sucesso!");
                        };
                        request.getSession().setAttribute("disableDisp", "disabled");
                        request.getSession().setAttribute("selecAmb", "Selecione o Ambiente");
                        request.getSession().setAttribute("disableAmbDet", "disabled");
                        request.getSession().setAttribute("disableDispDet", "disabled");
                    }
                    ;
                    break;

                case "ExcluirDispositivo":
                    if (dispositivo.excluir(Integer.parseInt(request.getParameter("nomeIdDisp")))) {
                        System.out.println("Dispositivo Excluído Com Sucesso!");
                        request.getSession().setAttribute("disableDispDet", "disabled");
                        request.getSession().setAttribute("selecDisp", "Selecione o Dispositivo");
                    };
                    break;
            }

        }

        return jspURL;
    }

}
