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
public class Casa {
    private int id;
    private String nome;
    private String rua;
    private int numero;
    private String complemento;

    public void setAll(int id, String nome, String rua, int numero, String complemento){
        this.id = id;
        this.nome = nome;
        this.rua = rua;
        this.numero = numero;
        this.complemento = complemento;
    }
    
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

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    } 
    
    public String toJason(){
        Gson gson = new Gson();
        return gson.toJson(this);
    }
    
    public static Casa fromJson(String json){
        Gson gson = new Gson();
        return gson.fromJson(json, Casa.class);
    }
}
