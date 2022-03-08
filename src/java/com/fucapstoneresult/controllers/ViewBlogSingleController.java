/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.CommentDAO;
import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.StudentDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.dao.TagsDAO;
import com.fucapstoneresult.models.CommentDTO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.StudentDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
import com.fucapstoneresult.models.TagsDTO;
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
public class ViewBlogSingleController extends HttpServlet {

    private final String ERROR = "po-view-post.jsp";
    private final String SUCCESS = "blog-single.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String postID = request.getParameter("id");
            PostsDAO postDao = new PostsDAO();
            PostsDTO post = postDao.getPostWithID(postID);
            String studentName = post.getPostAuthor();
            TagsDAO tagDao = new TagsDAO();
            TagDetailsDAO tagDetailDao = new TagDetailsDAO();
            
            if (post != null) {
                List<TagsDTO> tagList = tagDao.getListTag(postID);
                List<TagDetailsDTO> tagDetailList = new ArrayList<>();
                
                for (TagsDTO tagsDTO : tagList) {
                    tagDetailDao.getTagDetails(tagsDTO.getTagdetailID());
                    tagDetailList.add(tagDetailDao.getTagDetails(tagsDTO.getTagdetailID()));
                }
                request.setAttribute("POST", post);
                request.setAttribute("STUDENT_NAME", studentName);
                request.setAttribute("TAG", tagDetailList);
                url = SUCCESS;
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
