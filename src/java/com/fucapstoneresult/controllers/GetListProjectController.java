/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.InstructorDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.dao.ProjectInstructorDAO;
import com.fucapstoneresult.dao.SemesterDAO;
import com.fucapstoneresult.dao.TagDetailsDAO;
import com.fucapstoneresult.dao.TagsDAO;
import com.fucapstoneresult.dao.TeamDAO;
import com.fucapstoneresult.models.InstructorDTO;
import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.ProjectDTO;
import com.fucapstoneresult.models.ProjectInstructorDTO;
import com.fucapstoneresult.models.SemesterDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
import com.fucapstoneresult.models.TagsDTO;
import com.fucapstoneresult.models.TeamDTO;
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
public class GetListProjectController extends HttpServlet {
        private static final String TARGET = "mod-add-post.jsp";
    private static final String ADD_TEAM = "mod-add-team.jsp";
    private static final String ADD_PROJECT_INSTRUCTOR = "mod-add-project-instructor.jsp";
    private static final String ADD_STUDENT = "mod-add-student.jsp";
    private static final String PROJECT = "mod-project.jsp";
    private static final String VIEW_PROJECT = "mod-view-project.jsp";
    private static final String UPDATE_PROJECT = "mod-update-project.jsp";
    private static final String ERROR = "login.html";
    private static final String ADD_PROJECT = "mod-add-project.jsp";
    private static final String EDIT_TEAM = "mod-edit-team.jsp";
    private static final String EDIT_SEMESTER = "mod-edit-semester.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            
            String proID = request.getParameter("id");
            String teamID = request.getParameter("team-id");
            String semesterID = request.getParameter("semester-id");
            
            ProjectDAO dao = new ProjectDAO();
            List<ProjectDTO> list = dao.getAllProject();
            ProjectDTO project = dao.getProject(proID);
            InstructorDAO DAO = new InstructorDAO();
            List<InstructorDTO> List = DAO.getAllInstructor();
            TeamDAO DAOteam = new TeamDAO();
            List<TeamDTO> ListTeam = DAOteam.getAllTeam();
            SemesterDAO DAOSemester = new SemesterDAO();
            List<SemesterDTO> listSem = DAOSemester.getAllSemester();
            List<TeamDTO> teamDefault = new ArrayList<>();
            List<TeamDTO> teamEdit = new ArrayList<>();
            ProjectInstructorDAO proinsdao = new ProjectInstructorDAO();
            TagsDAO tagDao = new TagsDAO();
            TagDetailsDAO tagDetailDao = new TagDetailsDAO();
            TeamDTO editteam = DAOteam.getTeam(teamID);
            SemesterDTO editsemester = DAOSemester.getSemester(semesterID);
            
            
            
            for (TeamDTO team : ListTeam) {
                if(dao.getProject(team.getTeamID()) == null){
                    teamDefault.add(team);
                }
            }
            
            for (TeamDTO team : ListTeam) {
                if(dao.getProject(team.getTeamID()) == null || team.getTeamID().equals(proID) ){
                    teamEdit.add(team);
                }
            }
            
            List<TagDetailsDTO> listDetailTag = new ArrayList<>();
            List<TagsDTO> listTag = tagDao.getListTag(proID);
            
            for (TagsDTO tagsDTO : listTag) {
                listDetailTag.add(tagDetailDao.getTagDetails(tagsDTO.getTagdetailID()));
            }
            
            
            request.setAttribute("DETAIL_TAG", listDetailTag);
            request.setAttribute("TEAM_EDIT_NAME", editteam);
            request.setAttribute("SEMESTER_EDIT_NAME", editsemester);
            
            String page = request.getParameter("page");
            request.setAttribute("PROJECT_LIST", list);
            request.setAttribute("INSTRUCTOR_LIST", List);
            request.setAttribute("TEAM_LIST", teamDefault);
            request.setAttribute("TEAM_EDIT", teamEdit);
            request.setAttribute("VIEW_PROJECT", project);
            request.setAttribute("SEMESTER_LIST", listSem);
            
            if (proID != null) {
                
                
                TeamDTO team = DAOteam.getTeam(proID);
                
                request.setAttribute("TEAM_NAME", team.getTeamName());
                ProjectInstructorDTO proins = proinsdao.getProjectInstructor(team.getTeamID());
                
                InstructorDTO displayInsName = DAO.getInstructorByID(proins.getInstructorID());
                request.setAttribute("INSTRUCTOR_NAME", displayInsName.getInstructorName());

                SemesterDTO displaysem = DAOSemester.getSemester(project.getSemesterID());
                request.setAttribute("SEMESTER_NAME", displaysem.getSemesterName());
                request.setAttribute("VIEW_PROJECT", project);
            }
            
            if(page.equals("add-post")){
                url = TARGET;
            }else if(page.equals("add-team")){
                url = ADD_TEAM;
            }else if(page.equals("add-projectinstructor")){
                url = ADD_PROJECT_INSTRUCTOR;
            }else if(page.equals("add-student")){
                url = ADD_STUDENT;
            }else if(page.equals("project")){
                url = PROJECT;
            }else if(page.equals("view-project")){
                url = VIEW_PROJECT;
            }else if(page.equals("update-project")){
                url = UPDATE_PROJECT;
            }else if(page.equals("add-project")){
                url = ADD_PROJECT;
            }else if(page.equals("edit-team")){
                url = EDIT_TEAM;
            }else if(page.equals("edit-semester")){
                url = EDIT_SEMESTER;
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
