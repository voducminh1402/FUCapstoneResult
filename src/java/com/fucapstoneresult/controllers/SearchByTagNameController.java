/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
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
@WebServlet(name = "SearchByTagNameController", urlPatterns = {"/SearchByTagNameController"})
public class SearchByTagNameController extends HttpServlet {

    private static final String SUCCESS = "project-major.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            String searchValue = request.getParameter("searchValue");
            searchValue = searchValue.trim().toLowerCase();
            if (searchValue == null || searchValue.isEmpty()) {
                url = "index.html";
            }
//            TagDetailsDAO tagDetaiDdao = new TagDetailsDAO();
//            PostsDAO postDao = new PostsDAO();
//            List<TagDetailsDTO> listTags = tagDetaiDdao.getTagsByName(searchValue);
//            List<PostsDTO> listPosts = new ArrayList<>();
//            
//            for (TagDetailsDTO tagDetailsDTO : listTags) {
//                listPosts.addAll(postDao.getPostsByTagID(tagDetailsDTO.getTagDetailID()));
//            }
            PostsDAO postDao = new PostsDAO();
            List<PostsDTO> listPosts = postDao.getListPost(searchValue);

            request.setAttribute("LIST_POSTS", listPosts);
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
