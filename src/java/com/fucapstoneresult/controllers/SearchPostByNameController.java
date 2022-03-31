/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.ProjectDTO;
import com.fucapstoneresult.models.ProjectSemesterDTO;
import com.fucapstoneresult.models.UserPostDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class SearchPostByNameController extends HttpServlet {

    private static final String ERROR = "mod-post.jsp";
    private static final String SUCCESS = "mod-post.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            /* TODO output your page here. You may use following sample code. */
            String name = request.getParameter("name");
            PostsDAO postDao = new PostsDAO();
            List<PostsDTO> postList1 = new ArrayList<>();
            List<PostsDTO> postList = postDao.searchModPostByName(name);

            ProjectDAO prjDTO = new ProjectDAO();
            List<ProjectSemesterDTO> prjList = prjDTO.joinProjectSemesteronSemesterName(name);
            for (ProjectSemesterDTO projectSemesterDTO : prjList) {
                PostsDTO post = postDao.getPostWithProjectId(projectSemesterDTO.getPrjID());
                postList1.add(post);
            }

            if (postList != null) {
                request.setAttribute("POST_LIST", postList);

            } else {
                request.setAttribute("POST_LIST", postList1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
