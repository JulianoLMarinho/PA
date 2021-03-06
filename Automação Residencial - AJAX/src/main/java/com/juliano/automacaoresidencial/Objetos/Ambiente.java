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
public class Ambiente {
    int id;
    int casa_id;
    String nome;
    String detalhes;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCasa_id() {
        return casa_id;
    }

    public void setCasa_id(int casa_id) {
        this.casa_id = casa_id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDetalhes() {
        return detalhes;
    }

    public void setDetalhes(String detalhes) {
        this.detalhes = detalhes;
    }
    
    public void setAll(int id, String nome, String detalhes, int id_casa){
        this.id = id;
        this.nome = nome;
        this.detalhes = detalhes;
        this.casa_id = id_casa;
    }
    
    public void setAll(String nome, String detalhes, int id_casa){
        this.nome = nome;
        this.detalhes = detalhes;
        this.casa_id = id_casa;
    }
    
    public String toJason(){
        Gson gson = new Gson();
        return gson.toJson(this);
    }
    
    public static Ambiente fromJson(String json){
        Gson gson = new Gson();
        return gson.fromJson(json, Ambiente.class);
    }
}
