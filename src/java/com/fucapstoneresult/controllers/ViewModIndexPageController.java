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
            int numOfPost = 0;
            int numOfPoPost = 0;
            int numOfProject = 0;
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");

            PostsDAO postDao = new PostsDAO();
            List<PostsDTO> postList = postDao.getAllPost();
            List<PostsDTO> top5Post = PostsDAO.getTop5Post();
            
            ProjectDAO projectDao = new ProjectDAO();
            List<ProjectDTO> projectList = projectDao.getAllProject();
            
            CommentDAO cmtDao = new CommentDAO();
            List<UserCommentDTO> cmtList = cmtDao.joinUserComment();
            List<UserCommentDTO> cmtRequestList = new ArrayList<>();
            
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
            
            for (UserCommentDTO userCommentDTO : cmtList) {
                if (userCommentDTO.getCommentStatusId() == 1){
                    cmtRequestList.add(userCommentDTO);
                }
            }
            

            request.setAttribute("USER", userLogin);
            request.setAttribute("NUM_OF_POST", numOfPost);
            request.setAttribute("NUM_OF_POPOST", numOfPoPost);
            request.setAttribute("NUM_OF_PROJECT", numOfProject);
            request.setAttribute("TOP_POST", top5Post);
            request.setAttribute("COMMENT_LIST", cmtRequestList);
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
