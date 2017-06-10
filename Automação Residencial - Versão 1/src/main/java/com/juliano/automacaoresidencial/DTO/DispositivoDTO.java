/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DTO;

import com.juliano.automacaoresidencial.DAO.DispositivoDAO;
import com.juliano.automacaoresidencial.Objetos.Dispositivo;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author juliano
 */
public class DispositivoDTO {
    List<Dispositivo> listaDispositivo;
    DispositivoDAO dispositivos = new DispositivoDAO();
    Dispositivo dispositivoSelecionado = new Dispositivo();

    public boolean inserirDispositivo(Dispositivo novoDispositivo){
        if(dispositivos.doCreate(novoDispositivo)){
            setDispositivoSelecionado(dispositivoSelecionado);
            return true;
        }
        return false;
    }
    
    public void setDispositivoSelecionado(Dispositivo dispositivoSelecionado) {
        this.dispositivoSelecionado = dispositivoSelecionado;
    }    
    
    public Dispositivo getDispositivoSelecionado(int id){
        if(dispositivos.doRead(id, dispositivoSelecionado)){
            return dispositivoSelecionado;
        }
        return dispositivoSelecionado;
    }
    
    public List<Dispositivo> getListaDispositivo(int id) {
        this.carrega(id);
        return listaDispositivo;
    }

    public void setListaDispositivo(List<Dispositivo> listaDispositivo) {
        this.listaDispositivo = listaDispositivo;
    }
    
    void carrega(int i){
        List<Dispositivo > temp = new ArrayList<>();
        if (dispositivos.doReadList(i, temp)){
            this.listaDispositivo = temp;
        }
    }
    
    public boolean excluirPorAmbiente(int id_ambiente){
        return dispositivos.doDeletebyAmb(id_ambiente);
    }
    
    public boolean excluir(int id){
        return dispositivos.doDelete(id);
    }
}
