/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.InstructorDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.models.InstructorDTO;
import com.fucapstoneresult.models.ProjectDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author VODUCMINH
 */
public class GetListProjectController extends HttpServlet {
    private static final String TARGET = "mod-add-post.jsp";
    private static final String ADD_TEAM = "mod-add-team.jsp";
    private static final String ADD_PROJECT_INSTRUCTOR = "mod-add-project-instructor.jsp";
    private static final String ERROR = "login.html";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            
            ProjectDAO dao = new ProjectDAO();
            List<ProjectDTO> list = dao.getAllProject();
            InstructorDAO DAO = new InstructorDAO();
            List<InstructorDTO> List = DAO.getAllInstructor();
            
            request.setAttribute("PROJECT_LIST", list);
            String page = request.getParameter("page");
            request.setAttribute("INSTRUCTOR_LIST", List);
            
            if(page.equals("add-post")){
                url = TARGET;
            }else if(page.equals("add-team")){
                url = ADD_TEAM;
            }else if(page.equals("add-projectinstructor")){
                url = ADD_PROJECT_INSTRUCTOR;
            }
            
        } 
        catch (Exception e) {
            System.out.println(e.toString());
        }
        finally {
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
