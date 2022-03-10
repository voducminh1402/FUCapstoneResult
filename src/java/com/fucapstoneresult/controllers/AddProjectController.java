/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.dao.ProjectInstructorDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.dao.TagsDAO;
import com.fucapstoneresult.dao.TeamDAO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.ProjectDTO;
import com.fucapstoneresult.models.ProjectInstructorDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
import com.fucapstoneresult.models.TagsDTO;
import com.fucapstoneresult.models.TeamDTO;
import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author PhongVu
 */
public class AddProjectController extends HttpServlet {

    private static final String ERROR = "login.html";
    private static final String SUCCESS = "mod-add-project.jsp";

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

//            UUID uuid = UUID.randomUUID();
//            String projectID = uuid.toString();
//            UUID uuidPost = UUID.randomUUID();
//            String postID = uuidPost.toString();

            String projectName = request.getParameter("project-name");
            String projectDescription = request.getParameter("project-description").replace("src=\"", "src='").replace("\" />", "' />");
            String projectImage = request.getParameter("project-image");
            String projectScore = request.getParameter("project-score");
            String semesterID = request.getParameter("semester-id");
            String teamID = request.getParameter("team-id");
            String instructorID = request.getParameter("instructor-id");
            String[] postTags = request.getParameter("post-tag").split(",");

            ProjectDAO dao = new ProjectDAO();
            TeamDAO teamdao = new TeamDAO();
            ProjectInstructorDAO proinsdao = new ProjectInstructorDAO();
            PostsDAO postdao = new PostsDAO();

            if (userLogin != null) {

                String postAuthor = userLogin.getUserName();
                String userID = userLogin.getUserID();

                TagDetailsDAO tagDetailDao = new TagDetailsDAO();
                TagsDAO tagDao = new TagsDAO();

                ProjectDTO project = new ProjectDTO(teamID, projectName, projectDescription, projectImage, Float.parseFloat(projectScore), "1", semesterID);
                boolean check = dao.insertProject(project);

                ProjectInstructorDTO proins = new ProjectInstructorDTO(teamID, instructorID);
                boolean checkproins = proinsdao.insertProjectInstructor(proins);

                PostsDTO post = new PostsDTO(teamID, projectName, currentDate, postAuthor, projectDescription, projectImage, userID, 0, 1, null, teamID);
                boolean checkPost = postdao.insert(post);
                boolean checkTagDetail = false, checkTag = false, checkTagNotAdd = false;

                if (check  && checkproins && checkPost) {

                    for (String postTag : postTags) {
                        if (tagDetailDao.getTagDetailsWithName(postTag) != null) {
                            String tagDetailId = tagDetailDao.getTagDetailsWithName(postTag).getTagDetailID();
                            checkTag = tagDao.insert(new TagsDTO(teamID, tagDetailId));
                            checkTagNotAdd = true;
                        } else {
                            UUID newUuid = UUID.randomUUID();
                            String tagDetailId = newUuid.toString();
                            checkTagDetail = tagDetailDao.insert(new TagDetailsDTO(tagDetailId, postTag));
                            checkTag = tagDao.insert(new TagsDTO(teamID, tagDetailId));
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
