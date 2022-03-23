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
import com.fucapstoneresult.models.StudentDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
import com.fucapstoneresult.models.TagsDTO;
import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
            int check = 0;
            
            HttpSession session = request.getSession();
            UserDTO userLogin = (UserDTO) session.getAttribute("USER");
            
            PostsDAO postDao = new PostsDAO();
            PostsDTO post = postDao.getMainPostWithProjectId(projectID);
            TagsDAO tagDao = new TagsDAO();
            TagDetailsDAO tagDetailDao = new TagDetailsDAO();
            ProjectInstructorDAO projectInsDao = new ProjectInstructorDAO();
            InstructorDAO instructorDao = new InstructorDAO();
            StudentDAO studentDao = new StudentDAO();
            List<PostsDTO> top3Post = postDao.getListTop3Post(projectID);
            List<StudentDTO> studentList = studentDao.getListStudentWithTeam(projectID);
            
            if (userLogin != null){
            for (StudentDTO studentDTO : studentList) {
                if (userLogin.getUserName().equals(studentDTO.getStudentName()))
                    check = 1;
            }
            }
            
            if (post != null) {
                CommentDAO cmtDao = new CommentDAO();
                List<CommentDTO> comments = cmtDao.getListCommentsByPost(post.getPostID());
                List<TagsDTO> tagList = tagDao.getListTag(post.getPostID());
                List<TagDetailsDTO> tagDetailList = new ArrayList<>();
                
                for (TagsDTO tagsDTO : tagList) {
                    tagDetailDao.getTagDetails(tagsDTO.getTagdetailID());
                    tagDetailList.add(tagDetailDao.getTagDetails(tagsDTO.getTagdetailID()));
                }
                
                String instructorId = projectInsDao.getProjectInstructor(projectID).getInstructorID();
                InstructorDTO instructor = instructorDao.getInstructorByID(instructorId);
                List<StudentDTO> teamList = studentDao.getListStudentWithTeam(projectID);
                
                request.setAttribute("POST", post);
                request.setAttribute("INSTRUCTOR", instructor);
                request.setAttribute("TEAM", teamList);
                request.setAttribute("TAGS", tagDetailList);
                request.setAttribute("COMMENTS", comments);
                request.setAttribute("COUNT_CMT", comments.size());
                request.setAttribute("TOP_POST", top3Post);
                request.setAttribute("IS_STUDENT", check);
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
