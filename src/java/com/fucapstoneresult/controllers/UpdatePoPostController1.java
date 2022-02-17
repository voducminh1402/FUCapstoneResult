/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PoPostDAO;
import com.fucapstoneresult.dao.StudentDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.dao.TagsDAO;
import com.fucapstoneresult.models.ProjectOwnerPostsDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
import com.fucapstoneresult.models.TagsDTO;
import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
public class UpdatePoPostController1 extends HttpServlet {
    private static final String ERROR = "po-update-post.jsp";
    private static final String SUCCESS = "po-view-post.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");
            TagDetailsDAO tagDetailDao = new TagDetailsDAO();
            TagsDAO tagDao = new TagsDAO();
            ProjectOwnerPostsDTO post = null;
            
            DateTimeFormatter dateTime = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String currentDate = dateTime.format(now);
            
            String popostID = request.getParameter("po-post-id");
            String popostTitle = request.getParameter("po-post-title");
            String postImage = request.getParameter("po-post-thumbnail");
            String popostContent = request.getParameter("po-post-content").replace("src=\"", "src='").replace("\" />", "' />");
            String[] popostTags = request.getParameter("po-post-tag").split(",");
            String ProjectID = "2";
            String authorInfo = userLogin.getUserName();
            StudentDAO student = new StudentDAO();
            String authorID = student.getStudentID(authorInfo);
            
            if (userLogin != null){
                post = new ProjectOwnerPostsDTO(popostID, popostTitle, currentDate, authorID, popostContent, postImage, userLogin.getUserID(), 0, 1, ProjectID);
            }
            else {
                response.sendRedirect("login.jsp");
            }
            
            
            PoPostDAO dao = new PoPostDAO();
            boolean check = dao.update(post);
            boolean checkTagDetail = false, checkTag = false;
            
            if (check){
                for (String postTag : popostTags){
                        UUID newUuid = UUID.randomUUID();
                        String tagDetailID = newUuid.toString();
                        checkTagDetail = tagDetailDao.insert(new TagDetailsDTO(tagDetailID, postTag));
                        checkTag = tagDao.insert(new TagsDTO(popostID, tagDetailID));
                    }
                    if (checkTag){
                        url = SUCCESS;
                    }
            }
    }catch(Exception e){
        System.out.println(e.toString());
    }finally{
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
            Logger.getLogger(UpdatePoPostController1.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UpdatePoPostController1.class.getName()).log(Level.SEVERE, null, ex);
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
