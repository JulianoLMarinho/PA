/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DTO;

import com.juliano.automacaoresidencial.DAO.AmbienteDAO;
import com.juliano.automacaoresidencial.DAO.CasaDAO;

/**
 *
 * @author juliano
 */
public class AmbienteDTO {
    AmbienteDAO ambientes = new AmbienteDAO();
    String [] listaAmbiente;

    public String[] getListaAmbiente() {
        this.carrega(1);
        return listaAmbiente;
    }

    public void setListaAmbiente(String[] listaAmbiente) {
        this.listaAmbiente = listaAmbiente;
    }
    
    void carrega(int i){
        String [] temp;
        temp = new String[2];
        if (ambientes.doRead(i, temp)){
            this.listaAmbiente = temp;
        }
    }
}
