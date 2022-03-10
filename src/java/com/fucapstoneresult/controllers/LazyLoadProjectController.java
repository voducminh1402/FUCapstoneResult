/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.dao.SemesterDAO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.SemesterDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "LazyLoadProjectController", urlPatterns = {"/LazyLoadProjectController"})
public class LazyLoadProjectController extends HttpServlet {

    private static final String SUCCESS = "project.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = SUCCESS;
        try {
            int number = 3;
            String numberString = request.getParameter("number");
            String id = request.getParameter("filter");
            if (numberString != null) {
                int numberRespone = Integer.parseInt(numberString);
                number = numberRespone + 3;
            }
            if (id == null) {
                id = "Học Kì";
            }

            SemesterDAO dao = new SemesterDAO();
            List<SemesterDTO> list = dao.getAllSemester();
            PostsDAO dPost = new PostsDAO();
            List<PostsDTO> listPost;
            if ("Học Kì".equals(id)) {

                listPost = dPost.getAllMainPost();
            } else {

                ProjectDAO projectDao = new ProjectDAO();
                List<String> listProjectID;
                listProjectID = projectDao.getAllProjectIDBySemester(id);
                listPost = dPost.getPostsByProjectID(listProjectID);
            }
            if (listPost.size() < number) {

                number = listPost.size();
            }

            List<PostsDTO> listP = new ArrayList<>();
            for (int i = 0; i < number; i++) {
                listP.add(listPost.get(i));
            }
            request.setAttribute("LIST_SEMESTER", list);
            request.setAttribute("FILTER", id);
            request.setAttribute("NUMBER", number);
            request.setAttribute("LIST_MAIN_POST", listP);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
