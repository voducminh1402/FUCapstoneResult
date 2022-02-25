/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PoPostDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.dao.TagsDAO;
import com.fucapstoneresult.models.ProjectOwnerPostsDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
import com.fucapstoneresult.models.TagsDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class ViewUpdatePageController extends HttpServlet {

    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "po-update-post.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String PostID = request.getParameter("id");

            PoPostDAO postDao = new PoPostDAO();
            ProjectOwnerPostsDTO post = postDao.getPostByID(PostID);
            TagsDAO tagDao = new TagsDAO();
            TagDetailsDAO tagDetailDao = new TagDetailsDAO();
            List<TagsDTO> tagList = tagDao.getListTag(PostID);
            List<TagDetailsDTO> tagDetailList = new ArrayList<>();

            for (TagsDTO tagsDTO : tagList) {
                tagDetailDao.getTagDetails(tagsDTO.getTagdetailID());
                tagDetailList.add(tagDetailDao.getTagDetails(tagsDTO.getTagdetailID()));
            }
            if (post != null) {
                request.setAttribute("POST", post);
                request.setAttribute("TAG",  tagDetailList);
                url = SUCCESS;
            }
        } catch (Exception e) {
            System.out.println(e.toString());
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewUpdatePageController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewUpdatePageController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ViewUpdatePageController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ViewUpdatePageController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
