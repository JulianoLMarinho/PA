/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.Core;

import com.juliano.automacaoresidencial.DTO.CasaDTO;
import com.juliano.automacaoresidencial.Objetos.Casa;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import javax.json.JsonObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;

/**
 *
 * @author juliano
 */
public class CasaCore extends HttpServlet{
    // Este controlador pode chamar vários handlers (tratadores de páginas)
    // Todos os hamdlers implementam a mesma interface.
    protected void processRequest(  HttpServletRequest request,
                                    HttpServletResponse response)
            throws ServletException, IOException {
        
        BufferedReader br = new BufferedReader(
                                  new  InputStreamReader(
                                           request.getInputStream(),"UTF8"));
        String textoDoJson = br.readLine();
        JsonObject jsonObjectDeJava = null;
        JSONObject jsonObject;
        
        String acao = new String();
        
        Casa c = new Casa();
        CasaDTO casa = new CasaDTO();
        
        try {
            jsonObject = new JSONObject(textoDoJson);
            acao = jsonObject.getString("acao");
            if(acao.equals("obter")){
                c = casa.getCasa();
            }
            if(acao.equals("editar")){
                JSONObject casaJ = jsonObject.getJSONObject("casa");
                Casa casaJs = new Casa();
                casaJs = c.fromJson(casaJ.toString());
                casaJs.setId(1);
                if(casa.atualizaCasa(casaJs)){
                    c = casa.getCasa();
                };
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("EXCESSAO_CONTROLLER", e.toString());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        }
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        if(acao.equals("obter")){ out.print(c.toJson());}
        if(acao.equals("editar")){ out.print(c.toJson());}
        
        out.flush();
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
