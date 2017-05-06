/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DAO;

/**
 *
 * @author juliano
 */
public class Teste {
    String list[] = new String[4];
    
    void carrega(){
        this.list[0] = "Sala de Estar";
        this.list[1] = "Quarto";
        this.list[2] = "Cozinha";
        this.list[3] = "Varanda";
    }
    
    public String[] getList(){
        this.carrega();
        return list;
    }
}
