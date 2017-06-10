/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.DAO;

import com.sun.org.apache.bcel.internal.util.ClassPath;
import java.sql.Connection;
import javax.naming.InitialContext;
import javax.sql.DataSource;

/**
 *
 * @author juliano
 */
public class BaseDAO {
    private DataSource ds;
    
    public BaseDAO(){
        try {
            InitialContext cxt = new InitialContext();
            if (cxt == null) {
                System.out.println("[BaseDAO.constructor] Falha no InitialContext.");
            }else{
                ds = (DataSource) cxt.lookup("java:comp/env/jdbc/automacaoresidencial");
            }
        } catch (Exception e) {
            System.out.println("[BaseDAO.constructor] Excessão: " + e.getMessage());
        }
    }
    
        public Connection getConnection(){
        try{
            if(ds!=null){
                System.out.println(ds);
                return ds.getConnection();
                
            }else{
                return null;
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
