/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.StudentDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.dao.TagsDAO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.StudentDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
import com.fucapstoneresult.models.TagsDTO;
import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class AddPoPostController extends HttpServlet {

    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "po-view-post.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");

            DateTimeFormatter dateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String currentDate = dateTime.format(now);

            UUID uuid = UUID.randomUUID();
            String popostID = uuid.toString();
            String popostTitle = request.getParameter("po-post-title");
            String popostImage = request.getParameter("po-post-thumbnail");
            String popostContent = request.getParameter("po-post-content").replace("source=\"", "src='").replace("\" />", "' />");
            String[] popostTags = request.getParameter("po-post-tag").split(",");
            //PostsDTO post =  (PostsDTO) session.getAttribute("POST");
            String postID = request.getParameter("po-post-id");
            String authorInfo = userLogin.getUserName();

            PostsDAO postDao = new PostsDAO();
            PostsDTO mainPost = new PostsDTO();
            mainPost = postDao.getPostWithID(postID);
            String projectID = mainPost.getProjectID();

            if (userLogin != null) {
                String userID = userLogin.getUserID();
                TagDetailsDAO tagDetailDao = new TagDetailsDAO();
                TagsDAO tagDao = new TagsDAO();

                PostsDTO post = new PostsDTO(popostID, popostTitle, currentDate, authorInfo, popostContent, popostImage, userID, 0, 2, postID, projectID);
                boolean check = postDao.insert(post);
                boolean checkTagDetail = false, checkTag = false, checkTagNotAdd = false;

                if (check) {
                    for (String postTag : popostTags) {
                        if (tagDetailDao.getTagDetailsWithName(postTag) != null) {
                            String tagDetailId = tagDetailDao.getTagDetailsWithName(postTag).getTagDetailID();
                            checkTag = tagDao.insert(new TagsDTO(popostID, tagDetailId));
                            checkTagNotAdd = true;
                        } else {
                            UUID newUuid = UUID.randomUUID();
                            String tagDetailId = newUuid.toString();
                            checkTagDetail = tagDetailDao.insert(new TagDetailsDTO(tagDetailId, postTag));
                            checkTag = tagDao.insert(new TagsDTO(popostID, tagDetailId));
                        }

                    }
                    if ((checkTagDetail && checkTag) || (checkTagNotAdd && checkTag)) {
                        url = SUCCESS;
                    }
                }
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
        } catch (SQLException ex) {
            Logger.getLogger(AddPoPostController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(AddPoPostController.class.getName()).log(Level.SEVERE, null, ex);
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
