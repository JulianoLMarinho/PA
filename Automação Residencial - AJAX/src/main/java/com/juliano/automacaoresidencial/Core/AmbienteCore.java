/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.juliano.automacaoresidencial.Core;

import com.google.gson.Gson;
import com.juliano.automacaoresidencial.DTO.AmbienteDTO;
import com.juliano.automacaoresidencial.Objetos.Ambiente;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
public class AmbienteCore extends HttpServlet{
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
        
        List<Ambiente> listaAmbiente = new ArrayList<>();
        AmbienteDTO ambientes = new AmbienteDTO();
        Ambiente ambiente = new Ambiente();
        
        String acao = new String();
        try {     
          jsonObject = new JSONObject(textoDoJson);
          acao = jsonObject.getString("acao");
          if (acao.equals("visualizar")){
              listaAmbiente = ambientes.getListaAmbiente(jsonObject.getInt("casa"));
          }
          if (acao.equals("editar")){
              JSONObject json = jsonObject.getJSONObject("ambiente");              
              ambiente = ambientes.fromJson(json.toString());
              if(ambientes.inserirAmbiente(ambiente)){
                  listaAmbiente = ambientes.getListaAmbiente(json.getInt("casa_id"));
              };
          }
          if (acao.equals("selecionar")){
              ambiente = ambientes.getAmbienteSelecionado(jsonObject.getInt("idAmbiente"));
          }
          if (acao.equals("excluir")){
              if(ambientes.excluirPorAmbiente(jsonObject.getInt("idAmbiente"))){
                  listaAmbiente = ambientes.getListaAmbiente(1);
              };
              
          }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("EXCESSAO_CONTROLLER", e.toString());
            request.getRequestDispatcher("/erro.jsp").forward(request, response);
        }
        
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        if(acao.equals("visualizar")){
            out.print(gson.toJson(listaAmbiente));
        }
        if(acao.equals("editar")){
            out.print(gson.toJson(listaAmbiente));
        }      
        if(acao.equals("selecionar")){
            out.print(gson.toJson(ambiente));
        }
        if(acao.equals("excluir")){
            out.print(gson.toJson(listaAmbiente));
        } 
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
