/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.Objetos;

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
}
