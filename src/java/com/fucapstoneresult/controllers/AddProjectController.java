/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.models.ProjectDTO;
import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author PhongVu
 */
public class AddProjectController extends HttpServlet {
    private static final String ERROR = "login.html";
    private static final String SUCCESS = "mod-add-project.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");
            
            UUID uuid = UUID.randomUUID();
            String projectID = uuid.toString();
            String projectName = request.getParameter("project-name");
            String projectDescription = request.getParameter("project-description");
            String projectImage = request.getParameter("project-image");
            String projectScore = request.getParameter("project-score");
            String semesterID = request.getParameter("semester-id");
            
            ProjectDAO dao = new ProjectDAO();
            
            if(userLogin != null){
                
                ProjectDTO project = new ProjectDTO(projectID, projectName, projectDescription, projectImage, Float.parseFloat(projectScore), "1", semesterID);
                boolean check = dao.insertProject(project);
                
                if(check){
                    url = SUCCESS;
                }
                
            }
            
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
