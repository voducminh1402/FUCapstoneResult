/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.dao.TagsDAO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
import com.fucapstoneresult.models.TagsDTO;
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
public class AddPostController extends HttpServlet {
    private static final String ERROR = "login.html";
    private static final String SUCCESS = "mod-add-post.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");  
            LocalDateTime now = LocalDateTime.now();
            String currentDate = dtf.format(now);
            
            UUID uuid = UUID.randomUUID();
            String postID = uuid.toString();
            String postTitle = request.getParameter("post-title");
            String postAuthor = request.getParameter("post-author");
            String postImage = request.getParameter("post-thumbnail");
            String postContent = request.getParameter("post-content");
            String[] postTags = request.getParameter("post-tag").split(",");
            String projectID = request.getParameter("project-name");
            
            PostsDAO postDao = new PostsDAO();
            
            if (userLogin != null) {
                String userId = userLogin.getUserID();
                TagDetailsDAO tagDetailDao = new TagDetailsDAO();
                TagsDAO tagDao = new TagsDAO();
                
                PostsDTO post = new PostsDTO(postID, postTitle, currentDate, postAuthor, postContent, postImage, userId, 0, 1, projectID);
                boolean check = postDao.insert(post);
                boolean checkTagDetail = false, checkTag = false;
                
                if (check) {
                    for (String postTag : postTags) {
                        UUID newUuid = UUID.randomUUID();
                        String tagDetailId = newUuid.toString();
                        checkTagDetail = tagDetailDao.insert(new TagDetailsDTO(tagDetailId, postTag));
                        checkTag = tagDao.insert(new TagsDTO(postID, tagDetailId));
                    }
                    if (checkTagDetail && checkTag) {
                        url = SUCCESS;
                    }
                }
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
