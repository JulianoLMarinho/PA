/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DAO;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author juliano
 */
public class AmbienteDAO extends BaseDAO{
    public boolean doRead(int id, String [] nome) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "SELECT * FROM \"ambiente\" WHERE casa_id=?;");
            pstmt.setInt(1, 1);
            pstmt.execute();
            ResultSet rst = pstmt.executeQuery();
            int i = 0;
            while(rst.next()){
                nome[i++]=rst.getString("nome");
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
}
