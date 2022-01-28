/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author VODUCMINH
 */
public class MainController extends HttpServlet {
    
    private static final String LOGIN = "LoginController";
    private static final String SIGNUP = "SignUpController";
    private static final String ADD_A_USER = "AddAUserController";
    private static final String INDEX = "index.jsp";
    private static final String ADD_POST = "AddPostController";
    private static final String GET_LIST_PROJECT = "GetListProjectController";
    private static final String GET_LIST_POST = "GetPostController";
    private static final String EDIT_POST = "EditPostController";
    private static final String UPDATE_POST = "UpdatePostController";
    private static final String REMOVE_POST = "RemovePostController";
    private static final String LOAD_ALL_USER = "LoadAllUserController";
    private static final String DELETE_A_USER = "DeleteAUserController";
    private static final String SEARCH_USERS = "SearchUsersController";
    private static final String SHOW_USER_DETAIL = "ShowUserDetailController";
    private static final String EDIT_USER_INFO = "EditUserInfoController";
    private static final String ADD_PROJECT = "AddProjectController";
    private static final String ADD_SEMESTER = "AddSemesterController";
    private static final String ADD_TEAM = "AddTeamController";
    private static final String ADD_STUDENT = "AddStudentController";
    private static final String ADD_PROJECT_INSTRUCTOR = "AddProjectInstructorController";
    private static final String ADD_INSTRUCTOR = "AddInstructorController";
    private static final String UPDATE_PROJECT = "UpdateProjectController";
    private static final String COMMENT_POST = "CommentPostController";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        String action = request.getParameter("action");
        try {
            if("Login".equals(action)){
                url = LOGIN;
            }else if("Create account".equals(action)){
                url = SIGNUP;
            }else if("Add a user".equals(action)){
                url = ADD_A_USER;
            }
            else if ("AddPost".equals(action)) {
                url = ADD_POST;
            }
            else if ("GetListProject".equals(action)) {
                url = GET_LIST_PROJECT;
            }
            else if("Load All User".equals(action)){
                url = LOAD_ALL_USER;
            }else if("DeleteAUser".equals(action)){
                url = DELETE_A_USER;
            }else if("SearchUser".equals(action)){
                url = SEARCH_USERS;
            }else if("showUserDetail".equals(action)){
                url = SHOW_USER_DETAIL;
            }else if("EditUserInfo".equals(action)){
                url = EDIT_USER_INFO;
            }
            else if ("GetListPost".equals(action)) {
                url = GET_LIST_POST;
            }
            else if ("EditPost".equals(action)) {
                url = EDIT_POST;
            }
            else if ("UpdatePost".equals(action)) {
                url = UPDATE_POST;
            }
            else if ("RemovePost".equals(action)) {
                url = REMOVE_POST;
            }
            else if ("AddProject".equals(action)) {
                url = ADD_PROJECT;
            }
            else if ("AddSemester".equals(action)) {
                url = ADD_SEMESTER;
            }
            else if ("AddTeam".equals(action)) {
                url = ADD_TEAM;
            }
            else if ("AddStudent".equals(action)) {
                url = ADD_STUDENT;
            }
            else if ("AddProjectInstructor".equals(action)) {
                url = ADD_PROJECT_INSTRUCTOR;
            }
            else if ("AddInstructor".equals(action)) {
                url = ADD_INSTRUCTOR;
            }
            else if ("UpdateProject".equals(action)) {
                url = UPDATE_PROJECT;
            }
            else if ("CommentPost".equals(action)) {
                url = COMMENT_POST;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
