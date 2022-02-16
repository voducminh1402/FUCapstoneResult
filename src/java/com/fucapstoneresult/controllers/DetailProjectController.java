/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.CommentDAO;
import com.fucapstoneresult.dao.InstructorDAO;
import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.dao.ProjectInstructorDAO;
import com.fucapstoneresult.dao.StudentDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.dao.TagsDAO;
import com.fucapstoneresult.models.CommentDTO;
import com.fucapstoneresult.models.InstructorDTO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.ProjectDTO;
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
 * @author VODUCMINH
 */
public class DetailProjectController extends HttpServlet {
    private static final String ERROR = "index.jsp";
    private static final String SUCCESS = "post-project.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String projectID = request.getParameter("id");
            
            PostsDAO postDao = new PostsDAO();
            PostsDTO post = postDao.getPostWithProjectId(projectID);
            TagsDAO tagDao = new TagsDAO();
            TagDetailsDAO tagDetailDao = new TagDetailsDAO();
            ProjectInstructorDAO projectInsDao = new ProjectInstructorDAO();
            InstructorDAO instructorDao = new InstructorDAO();
            StudentDAO studentDao = new StudentDAO();
            
            if (post != null) {
                CommentDAO cmtDao = new CommentDAO();
                List<CommentDTO> comments = cmtDao.getListCommentsByPost(post.getPostID());
                List<TagsDTO> tagList = tagDao.getListTag(projectID);
                List<TagDetailsDTO> tagDetailList = new ArrayList<>();
                
                for (TagsDTO tagsDTO : tagList) {
                    tagDetailDao.getTagDetails(tagsDTO.getTagdetailID());
                    tagDetailList.add(tagDetailDao.getTagDetails(tagsDTO.getTagdetailID()));
                }
                
                String instructorId = projectInsDao.getProjectInstructor(projectID).getInstructorID();
                List<InstructorDTO> instructorList = instructorDao.getInstructor(instructorId);
                List<StudentDTO> teamList = studentDao.getListStudentWithTeam(projectID);
                
                request.setAttribute("POST", post);
                request.setAttribute("INSTRUCTOR", instructorList);
                request.setAttribute("TEAM", teamList);
                request.setAttribute("TAGS", tagDetailList);
                request.setAttribute("COMMENTS", comments);
                request.setAttribute("COUNT_CMT", comments.size());
                url = SUCCESS;
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