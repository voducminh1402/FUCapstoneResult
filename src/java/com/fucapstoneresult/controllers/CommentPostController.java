/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.CommentDAO;
import com.fucapstoneresult.models.CommentDTO;
import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
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
 * @author VODUCMINH
 */
public class CommentPostController extends HttpServlet {
    private static final String ERROR = "projects.html"; //tam
    private static final String SUCCESS = "projects.html"; //tam
    private static final String LOGIN = "login.html"; //tam
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");
            
            boolean check = false;
            
            if (userLogin == null) {
                url = LOGIN;
            }
            else {
                UUID uuid = UUID.randomUUID();
                String commentId = uuid.toString();
                String commentDetail = request.getParameter("input-comment");
                String postId = request.getParameter("id");
                String userId = userLogin.getUserID();
                
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
                LocalDateTime now = LocalDateTime.now();
                String commentTime = dtf.format(now);
                
                CommentDTO comment = new CommentDTO(commentId, postId, userId, commentDetail, commentTime, 1);
                CommentDAO dao = new CommentDAO();
                check = dao.insertComment(comment);
            }
            
            if (check) {
                response.getWriter().write("Post Comment Successfully");
            }
        } 
        catch (Exception e) {
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
