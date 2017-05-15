/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DAO;

import com.juliano.automacaoresidencial.Objetos.Ambiente;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author juliano
 */
public class AmbienteDAO extends BaseDAO{
    
    public boolean doCreate(Ambiente novoAmbiente) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "INSERT INTO \"ambiente\" (\"casa_id\", \"nome\", \"detalhes\") VALUES(?, ?, ?) RETURNING id");
            pstmt.setInt(1, Integer.parseInt("1"));
            pstmt.setString(2, novoAmbiente.getNome());
            pstmt.setString(3, novoAmbiente.getDetalhes());
            ResultSet rst = pstmt.executeQuery();
            rst.next();
            novoAmbiente.setId(rst.getInt("id"));
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public boolean doRead(int id, Ambiente ambienteSelecionado) {
        try {
            try (Connection con = getConnection()) {
                PreparedStatement pstmt = con.prepareStatement(
                        "SELECT * FROM \"ambiente\" WHERE id=?;");
                pstmt.setInt(1, id);
                pstmt.execute();
                ResultSet rst = pstmt.executeQuery();
                int i = 0;
                rst.next();
                //Ambiente temp = new Ambiente();
                ambienteSelecionado.setAll(rst.getInt("id"), rst.getString("nome"), rst.getString("detalhes"), rst.getInt("casa_id"));
                //System.out.println(nome);
                //dto.setAll(rst.getInt("id"), rst.getString("nome"), rst.getString("rua"), rst.getInt("numero"), rst.getString("complemento"));
                //dto.setNome(rst.getString("nome"));
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    
    public boolean doReadList(int id, List<Ambiente> nome) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "SELECT * FROM \"ambiente\" WHERE casa_id=?;");
            pstmt.setInt(1, 1);
            pstmt.execute();
            ResultSet rst = pstmt.executeQuery();
            int i = 0;
            while(rst.next()){
                Ambiente temp = new Ambiente();
                temp.setAll(rst.getInt("id"), rst.getString("nome"), rst.getString("detalhes"), rst.getInt("casa_id"));
                nome.add(temp);
            }
            //System.out.println(nome);
            //dto.setAll(rst.getInt("id"), rst.getString("nome"), rst.getString("rua"), rst.getInt("numero"), rst.getString("complemento"));
            //dto.setNome(rst.getString("nome"));
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public boolean doDeletebyAmb(int id_ambiente){
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "DELETE FROM \"ambiente\" WHERE \"id\"=?;");
            pstmt.setInt(1, id_ambiente);
            pstmt.execute();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
