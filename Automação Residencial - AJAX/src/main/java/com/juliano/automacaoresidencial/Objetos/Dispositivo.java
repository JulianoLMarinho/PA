/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.Objetos;

import com.google.gson.Gson;

/**
 *
 * @author juliano
 */
public class Dispositivo {
    int id;
    String nome;
    int id_ambiente;
    
        public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getId_ambiente() {
        return id_ambiente;
    }

    public void setId_ambiente(int id_ambiente) {
        this.id_ambiente = id_ambiente;
    }
    
    public void setAll(int id, String nome, int id_ambiente){
        this.id = id;
        this.nome = nome;
        this.id_ambiente = id_ambiente;
    }
    
    public void setAll(String nome, int id_ambiente){
        this.nome = nome;
        this.id_ambiente = id_ambiente;
    }
    
    public String toJason(){
        Gson gson = new Gson();
        return gson.toJson(this);
    }
    
    public static Dispositivo fromJson(String json){
        Gson gson = new Gson();
        return gson.fromJson(json, Dispositivo.class);
    }
}

