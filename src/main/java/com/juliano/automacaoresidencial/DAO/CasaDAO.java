/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DAO;

import com.juliano.automacaoresidencial.DTO.CasaDTO;
import com.juliano.automacaoresidencial.Objetos.Casa;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author juliano
 */
public class CasaDAO extends BaseDAO{
        public boolean doRead(Casa dto) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
               "SELECT * FROM \"Casa\" WHERE id=?;");
            pstmt.setInt(1, 1);
            pstmt.execute();
            ResultSet rst = pstmt.executeQuery();
            rst.next();
            dto.setNome(rst.getString("nome"));
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
