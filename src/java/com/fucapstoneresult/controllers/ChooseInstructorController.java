/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.InstructorDAO;
import com.fucapstoneresult.dao.ProjectInstructorDAO;
import com.fucapstoneresult.models.InstructorDTO;
import com.fucapstoneresult.models.InstructorDetailDTO;
import com.fucapstoneresult.models.ProjectDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PhongVu
 */
public class ChooseInstructorController extends HttpServlet {
    
    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "project-instructor-view.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS; 
        
        try {
            String insID = request.getParameter("id");
            InstructorDAO dao = new InstructorDAO();
            ProjectInstructorDAO piDao = new ProjectInstructorDAO();
            InstructorDTO ins = dao.getInstructorByID(insID);
            List<ProjectDTO> projectList = piDao.getAllProjectByInstructorID(insID);
            List<InstructorDetailDTO> detailInfo = piDao.getNumberOfProject();
            
            request.setAttribute("INS", ins);
            request.setAttribute("LIST_PROJECT", projectList);
            request.setAttribute("LIST_INS_INFO", detailInfo);
            
            
        } catch (Exception e) {
            System.out.println(e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
