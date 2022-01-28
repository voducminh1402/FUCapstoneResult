/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.InstructorDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.dao.TeamDAO;
import com.fucapstoneresult.models.InstructorDTO;
import com.fucapstoneresult.models.ProjectDTO;
import com.fucapstoneresult.models.TeamDTO;
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
    private static final String ADD_STUDENT = "mod-add-student.jsp";
    private static final String PROJECT = "mod-project.jsp";
    private static final String VIEW_PROJECT = "mod-view-project.jsp";
    private static final String UPDATE_PROJECT = "mod-update-project.jsp";
    private static final String ERROR = "login.html";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            
            String proID = request.getParameter("id");
            
            ProjectDAO dao = new ProjectDAO();
            List<ProjectDTO> list = dao.getAllProject();
            ProjectDTO project = dao.getProject(proID);
            InstructorDAO DAO = new InstructorDAO();
            List<InstructorDTO> List = DAO.getAllInstructor();
            TeamDAO DAOteam = new TeamDAO();
            List<TeamDTO> ListTeam = DAOteam.getAllTeam();
            
            request.setAttribute("PROJECT_LIST", list);
            String page = request.getParameter("page");
            request.setAttribute("INSTRUCTOR_LIST", List);
            request.setAttribute("TEAM_LIST", ListTeam);
            request.setAttribute("VIEW_PROJECT", project);
            
            if(page.equals("add-post")){
                url = TARGET;
            }else if(page.equals("add-team")){
                url = ADD_TEAM;
            }else if(page.equals("add-projectinstructor")){
                url = ADD_PROJECT_INSTRUCTOR;
            }else if(page.equals("add-student")){
                url = ADD_STUDENT;
            }else if(page.equals("project")){
                url = PROJECT;
            }else if(page.equals("view-project")){
                url = VIEW_PROJECT;
            }else if(page.equals("update-project")){
                url = UPDATE_PROJECT;
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
