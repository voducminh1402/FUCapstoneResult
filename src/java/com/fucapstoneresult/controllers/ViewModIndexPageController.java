/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.CommentDAO;
import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.models.CommentDTO;
import com.fucapstoneresult.models.PostCommentDTO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.ProjectDTO;
import com.fucapstoneresult.models.UserCommentDTO;
import com.fucapstoneresult.models.UserDTO;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
public class ViewModIndexPageController extends HttpServlet {

    private final static String ERROR = "mod-index.jsp";
    private final static String SUCCESS = "mod-index.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            int count = 0;
            int numOfPost = 0;
            int numOfPoPost = 0;
            int numOfProject = 0;
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");

            PostsDAO postDao = new PostsDAO();
            List<PostsDTO> postList = postDao.getAllPost();
            List<PostsDTO> top5Post = PostsDAO.getTop5Post();
            List<PostCommentDTO> postWithComment = new ArrayList<>();
            
            List<PostsDTO> top3RequestPost = postDao.getTop3RequestPost();
            
            
            ProjectDAO projectDao = new ProjectDAO();
            List<ProjectDTO> projectList = projectDao.getAllProject();
           
            CommentDAO cmtDao = new CommentDAO();
            List<UserCommentDTO> cmtList = cmtDao.getTop3RequestComment();
            
            for (PostsDTO postsDTO : postList) {
                if (postsDTO.getIsMainPost() == null) {
                    numOfPost = numOfPost + 1;
                } else {
                    if (postsDTO.getPostStatusID() == 2) {
                        numOfPoPost = numOfPoPost + 1;
                    }
                }
            }
            
            for (ProjectDTO projectDTO : projectList) {
                numOfProject = numOfProject + 1;
            }
            
            for (PostsDTO post1 : top5Post) {
                int num = cmtDao.getNumComment(post1.getPostID());
                postWithComment.add(new PostCommentDTO(post1.getPostID(), post1.getPostTitle(), post1.getPostImage(), post1.getUpvote(), num));
            }

            request.setAttribute("USER", userLogin);
            request.setAttribute("NUM_OF_POST", numOfPost);
            request.setAttribute("NUM_OF_POPOST", numOfPoPost);
            request.setAttribute("NUM_OF_PROJECT", numOfProject);
            request.setAttribute("TOP_POST", postWithComment);
            request.setAttribute("COMMENT_LIST", cmtList);
            request.setAttribute("TOP3_REQUEST_POST", top3RequestPost);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ViewModIndexPageController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ViewModIndexPageController.class.getName()).log(Level.SEVERE, null, ex);
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
