/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.ContentDAO;
import com.fucapstoneresult.models.SlideDTO;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author VODUCMINH
 */
public class EditSlideController extends HttpServlet {

    private static final String TARGET = "mod-slide-content.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String id = request.getParameter("id");
            String title = request.getParameter("title");
            String url = request.getParameter("url");
            String image = request.getParameter("image");
            List<SlideDTO> slideList = null;
            
            ContentDAO dao = new ContentDAO();
            String jsonFromTable = dao.getSlide();
            
            Type type = new TypeToken<List<SlideDTO>>(){}.getType();
            slideList = new Gson().fromJson(jsonFromTable, type);
            
            for (SlideDTO slideDTO : slideList) {
                if (slideDTO.getId().equals(id)) {
                    slideDTO.setId(id);
                    slideDTO.setTitle(title);
                    slideDTO.setUrl(url);
                    slideDTO.setImage(image);
                }
            }
            
            JsonArray jsonList = (JsonArray) new Gson().toJsonTree(slideList);
            dao.updateSlide(jsonList.toString());
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }
        finally {
            request.getRequestDispatcher(TARGET).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
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
     * Handles the HTTP <code>POST</code> method.
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
