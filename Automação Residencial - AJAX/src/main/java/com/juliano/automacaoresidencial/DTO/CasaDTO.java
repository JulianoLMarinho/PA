/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DTO;

import com.juliano.automacaoresidencial.DAO.CasaDAO;
import com.juliano.automacaoresidencial.Objetos.Casa;

/**
 *
 * @author juliano
 */
public class CasaDTO {
    CasaDAO house = new CasaDAO();
       Casa casa = new Casa();

    public Casa getCasa() {
        this.carrega();
        return casa;
    }

    public void setCasa(Casa casa) {
        this.casa = casa;
    }
    
    public boolean atualizaCasa(Casa casa){
        if(house.doUpdate(casa)){
            setCasa(casa);
            return true; 
        } else return false;
    }
    
    void carrega(){
        Casa temp = new Casa();
        if(house.doRead(temp)){
            this.casa = temp;
        };        
    }  
}
