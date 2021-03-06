/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DAO;

import com.juliano.automacaoresidencial.Objetos.Dispositivo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

/**
 *
 * @author juliano
 */
public class DispositivoDAO extends BaseDAO{
    
    public boolean doCreate(Dispositivo novoDispositivo) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "INSERT INTO \"dispositivo\" (\"nome\", \"id_ambiente\") VALUES (?, ?) RETURNING \"id\"");
            pstmt.setString(1, novoDispositivo.getNome());
            pstmt.setInt(2, novoDispositivo.getId_ambiente());
            pstmt.setString(3, novoDispositivo.getArquivojs());
            ResultSet rst = pstmt.executeQuery();
            rst.next();
            novoDispositivo.setId(rst.getInt("id"));
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public boolean doReadList(int id, List<Dispositivo> nome) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "SELECT * FROM \"dispositivo\" WHERE id_ambiente=? ORDER BY \"nome\" ASC;");
            pstmt.setInt(1, id);
            pstmt.execute();
            ResultSet rst = pstmt.executeQuery();
            int i = 0;
            while(rst.next()){
                Dispositivo temp = new Dispositivo();
                temp.setAll(rst.getInt("id"), rst.getString("nome"), rst.getInt("id_ambiente"), rst.getString("arquivojs"));
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
    
    public boolean doRead(int id, Dispositivo dispositivoSelecionado) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "SELECT * FROM \"dispositivo\" WHERE id=?;");
            pstmt.setInt(1, id);
            pstmt.execute();
            ResultSet rst = pstmt.executeQuery();
            rst.next();
            dispositivoSelecionado.setAll(rst.getInt("id"), rst.getString("nome"), rst.getInt("id_ambiente"), rst.getString("arquivojs"));
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
               "DELETE FROM \"dispositivo\" WHERE \"id_ambiente\"=?;");
            pstmt.setInt(1, id_ambiente);
            pstmt.execute();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    
    public boolean doDelete(int id){
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "DELETE FROM \"dispositivo\" WHERE \"id\"=?;");
            pstmt.setInt(1, id);
            pstmt.execute();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
