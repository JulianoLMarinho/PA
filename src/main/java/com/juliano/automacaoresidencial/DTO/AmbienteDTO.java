/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DTO;

import com.juliano.automacaoresidencial.DAO.AmbienteDAO;
import com.juliano.automacaoresidencial.Objetos.Ambiente;

/**
 *
 * @author juliano
 */
public class AmbienteDTO {
    AmbienteDAO ambientes = new AmbienteDAO();
    Ambiente ambienteSelecionado = new Ambiente();

    public Ambiente getAmbienteSelecionado(int id) {
        if(ambientes.doRead(id, ambienteSelecionado)){
            return ambienteSelecionado;
        };
        return ambienteSelecionado;
    }

    public void setAmbienteSelecionado(Ambiente ambienteSelecionado) {
        this.ambienteSelecionado = ambienteSelecionado;
    }
    
    Ambiente [] listaAmbiente;

    public Ambiente[] getListaAmbiente(int id) {
        this.carrega(id);
        return listaAmbiente;
    }

    public void setListaAmbiente(Ambiente[] listaAmbiente) {
        this.listaAmbiente = listaAmbiente;
    }
    
    void carrega(int i){
        Ambiente [] temp;
        temp = new Ambiente[2];
        if (ambientes.doReadList(i, temp)){
            this.listaAmbiente = temp;
        }
    }
}
