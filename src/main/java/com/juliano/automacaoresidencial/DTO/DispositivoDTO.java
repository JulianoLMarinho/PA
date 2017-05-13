/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DTO;

import com.juliano.automacaoresidencial.DAO.DispositivoDAO;
import com.juliano.automacaoresidencial.Objetos.Dispositivo;

/**
 *
 * @author juliano
 */
public class DispositivoDTO {
    Dispositivo [] listaDispositivo;
    DispositivoDAO dispositivos = new DispositivoDAO();

    public Dispositivo[] getListaDispositivo(int id) {
        this.carrega(id);
        return listaDispositivo;
    }

    public void setListaDispositivo(Dispositivo[] listaDispositivo) {
        this.listaDispositivo = listaDispositivo;
    }
    
    void carrega(int i){
        Dispositivo [] temp;
        temp = new Dispositivo[2];
        if (dispositivos.doReadList(i, temp)){
            this.listaDispositivo = temp;
        }
    }
}
