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
    public boolean doReadList(int id, List<Dispositivo> nome) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "SELECT * FROM \"dispositivo\" WHERE id_ambiente=?;");
            pstmt.setInt(1, id);
            pstmt.execute();
            ResultSet rst = pstmt.executeQuery();
            int i = 0;
            while(rst.next()){
                Dispositivo temp = new Dispositivo();
                temp.setAll(rst.getInt("id"), rst.getString("nome"), rst.getInt("id_ambiente"));
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
            dispositivoSelecionado.setAll(rst.getInt("id"), rst.getString("nome"), rst.getInt("id_ambiente"));
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
