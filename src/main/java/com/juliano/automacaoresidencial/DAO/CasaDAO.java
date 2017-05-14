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
public class CasaDAO extends BaseDAO {

    public boolean doRead(Casa dto) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                    "SELECT * FROM \"casa\" WHERE id=?;");
            pstmt.setInt(1, 1);
            pstmt.execute();
            ResultSet rst = pstmt.executeQuery();
            rst.next();
            dto.setAll(rst.getInt("id"), rst.getString("nome"), rst.getString("rua"), rst.getInt("numero"), rst.getString("complemento"));
            //dto.setNome(rst.getString("nome"));
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean doUpdate(Casa dto) {
        try {
            Connection con = getConnection();
            PreparedStatement pstmt = con.prepareStatement(
                    "UPDATE \"casa\" SET nome=?, rua=?, numero=?, complemento=? WHERE id=?;");
            pstmt.setString(1, dto.getNome());
            pstmt.setString(2, dto.getRua());
            pstmt.setInt(3, (new Integer(dto.getNumero())));
            pstmt.setString(4, dto.getComplemento());
            pstmt.setInt(5, dto.getId());
            pstmt.execute();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}
