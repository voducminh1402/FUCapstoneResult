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
    private static final String ADD_COMMENT = "AddCommentController";
    private static final String VOTE_POST_PROJECT = "VoteController";
    private static final String VOTE_POST_PROJECT_GET_VOTE = "GetVoteController";
    private static final String UPDATE_PROJECT = "UpdateProjectController";
    private static final String COMMENT_POST = "CommentPostController";
    private static final String LOAD_COMMENTS = "LoadCommentsController";
    private static final String DELETE_COMMENT = "DeleteCommentController";   
    private static final String UNDO_ACCEPT_COMMENT = "UndoAcceptCommentController";

    private static final String SEARCH_POSTS = "SearchByTagNameController";
    private static final String FILTER_POSTS = "FilterPostController";

    private static final String LOADING_INDEX = "LoadIndexController";
    private static final String DETAIL_PROJECT = "DetailProjectController";
    private static final String LOAD_SEMESTER = "LoadSemesterController";
    private static final String PO_AD_POST= "AddPoPostController";
    private static final String PO_VIEW_POST= "ViewPoPostController";
    private static final String PO_UPDATE_POST= "UpdatePoPostController";
    private static final String VIEW_UPDATE_POST= "ViewUpdatePageController";
    private static final String PO_DELETE_POST = "DeletePoPostController";
    private static final String VIEW_ADD_POST = "ViewAddPoPostPageController";
    private static final String VIEW_BLOG_SINGLE_PAGE = "ViewBlogSingleController";
    private static final String CHOOSE_INSTRUCTOR = "ChooseInstructorController";
    private static final String LOAD_STUDENT_LIST = "LoadStudentListController";
    private static final String DELETE_STUDENT = "DeleteStudentController";
    private static final String VIEW_MOD_INDEX_PAGE= "ViewModIndexPageController";
    private static final String VIEW_MOD_REQUEST_PAGE = "ViewModRequestPageController";
    private static final String VIEW_POPOST_DETAIL = "ViewPoPostDetailController";
    private static final String APPROVE_POST= "ApprovePostController";
    private static final String REJECT_POST= "RejectPostController";
    private static final String EDIT_POPOST_BY_MOD = "EditPoPostByModController";
    private static final String SUBMIT_EDITED_POPOST = "SubmitEditedPoPostController";
    private static final String LOGOUT = "LogoutController";
    private static final String SEARCH_USER_BY_NAME = "SearchUserByNameController";
    private static final String SEARCH_STUDENT_BY_NAME = "SearchStudentByNameController";
    private static final String LOAD_ALL_INSTRUCTOR = "LoadAllIntructorController";
    private static final String SHOW_INSTRUCTOR_DETAIL = "ShowInstructorDetailController";
    private static final String UPDATE_INSTRUCTOR = "UpdateInstructorController";
    private static final String DELETE_INSTRUCTOR = "DeleteInstructorController";
    private static final String SEARCH_INSTRUCTOR = "SearchInstructorController";
    private static final String LOAD_ALL_PROJECT = "LoadAllProjectController";
    private static final String LAZY_LOAD_PROJECT = "LazyLoadProjectController";
    private static final String LOAD_FILE_STUDENT = "LoadFileStudentController";

    private static final String SEAR_POPOST_BY_NAME= "SearchPoPostByNameController";
    private static final String FILTER_POPOST_BY_STATUS= "FilterPoPostByStatusController";
    private static final String SEARCH_PROJECT = "SearchProjectController";
    private static final String DELETE_POPOST = "DeletePoPostController";
    private static final String REMOVE_PROJECT = "RemoveProjectController";


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "";
        String action = request.getParameter("action");
        try {
            if ("Login".equals(action)) {
                url = LOGIN;
            } else if ("Create account".equals(action)) {
                url = SIGNUP;
            } else if ("Add a user".equals(action)) {
                url = ADD_A_USER;
            } else if ("AddPost".equals(action)) {
                url = ADD_POST;
            } else if ("GetListProject".equals(action)) {
                url = GET_LIST_PROJECT;
            } else if ("Load All User".equals(action)) {
                url = LOAD_ALL_USER;
            } else if ("DeleteAUser".equals(action)) {
                url = DELETE_A_USER;
            } else if ("SearchUser".equals(action)) {
                url = SEARCH_USERS;
            } else if ("showUserDetail".equals(action)) {
                url = SHOW_USER_DETAIL;
            } else if ("EditUserInfo".equals(action)) {
                url = EDIT_USER_INFO;
            } else if ("GetListPost".equals(action)) {
                url = GET_LIST_POST;
            } else if ("EditPost".equals(action)) {
                url = EDIT_POST;
            } else if ("UpdatePost".equals(action)) {
                url = UPDATE_POST;
            } else if ("RemovePost".equals(action)) {
                url = REMOVE_POST;
            } else if ("AddProject".equals(action)) {
                url = ADD_PROJECT;
            } else if ("AddSemester".equals(action)) {
                url = ADD_SEMESTER;
            } else if ("AddTeam".equals(action)) {
                url = ADD_TEAM;
            } else if ("AddStudent".equals(action)) {
                url = ADD_STUDENT;
            } else if ("AddProjectInstructor".equals(action)) {
                url = ADD_PROJECT_INSTRUCTOR;
            } else if ("AddInstructor".equals(action)) {
                url = ADD_INSTRUCTOR;
            }else if ("AddComment".equals(action)) {
                url = ADD_COMMENT;
            } else if ("Vote".equals(action)) {
                url = VOTE_POST_PROJECT;
            } else if ("UpdateProject".equals(action)) {
                url = UPDATE_PROJECT;
            } else if ("CommentPost".equals(action)) {
                url = COMMENT_POST;
            } else if ("LoadComments".equals(action)) {
                url = LOAD_COMMENTS;
            } else if ("DeleteComment".equals(action)) {
                url = DELETE_COMMENT;
            } else if ("Undo".equals(action)) {
                url = UNDO_ACCEPT_COMMENT;

            } else if ("Search".equals(action)) {
                url = SEARCH_POSTS;
            } else if ("FilterPostBySemester".equals(action)) {
                url = FILTER_POSTS;

            }else if ("LoadingIndex".equals(action)) {
                url = LOADING_INDEX;
            }else if ("DetailProject".equals(action)) {
                url = DETAIL_PROJECT;
            } else if ("Load Semester".equals(action)) {
                url = LOAD_SEMESTER;
            }else if ("PoAddPost".equals(action)){
                url = PO_AD_POST;
            }
            else if ("GetListPoPost".equals(action)){
                url = PO_VIEW_POST;
            }
            else if ("PoUpdatePost".equals(action)){
                url = PO_UPDATE_POST;
            }
            else if ("viewUpdatePoPage".equals(action)){
                url = VIEW_UPDATE_POST;
            }
            else if ("deletePoPostController".equals(action)){
                url = PO_DELETE_POST;
            }
            else if ("ViewAddPoPostPage".equals(action)){
                url = VIEW_ADD_POST;
            }
            else if ("viewPoPost".equals(action)){
                url = VIEW_BLOG_SINGLE_PAGE;
            }
            else if ("InstructorDetail".equals(action)){
                url = CHOOSE_INSTRUCTOR;
            }else if ("GetNumberVote".equals(action)){
                url = VOTE_POST_PROJECT_GET_VOTE;
            }else if ("LoadAllStudent".equals(action)){
                url = LOAD_STUDENT_LIST;
            }else if ("DeleteStudent".equals(action)){
                url = DELETE_STUDENT;
            }else if ("ViewModIndexPage".equals(action)){
                url = VIEW_MOD_INDEX_PAGE;
            }
            else if ("ViewModRequestPage".equals(action)){
                url = VIEW_MOD_REQUEST_PAGE;
            }else if ("ViewPoPostDetail".equals(action)) {
                url = VIEW_POPOST_DETAIL;
            }else if ("ApprovePoPost".equals(action)){
                url = APPROVE_POST;
            }else if ("RejectPost".equals(action)) {
                url = REJECT_POST;
            }else if ("EditPoPost".equals(action)){
                url = EDIT_POPOST_BY_MOD;
            }else if ("SubmitEditedPoPost".equals(action)){
                url = SUBMIT_EDITED_POPOST;
            }else if ("SearchUserByName".equals(action)){
                url = SEARCH_USER_BY_NAME;
            }else if ("SearchStudentByName".equals(action)){
                url = SEARCH_STUDENT_BY_NAME;
            }else if ("LoadListInstructors".equals(action)){
                url = LOAD_ALL_INSTRUCTOR;
            }else if ("showInstructorDetail".equals(action)){
                url = SHOW_INSTRUCTOR_DETAIL;
            }else if ("UpdateInstructor".equals(action)){
                url = UPDATE_INSTRUCTOR;
            }else if ("DeleteAInstructor".equals(action)){
                url = DELETE_INSTRUCTOR;
            }else if ("SearchInstructorByName".equals(action)){
                url = SEARCH_INSTRUCTOR;
            }else if ("LoadAllProject".equals(action)){
                url = LOAD_ALL_PROJECT;
            }else if ("LazyLoadProject".equals(action)){
                url = LAZY_LOAD_PROJECT;
            }
            else if ("LoadFileStudent".equals(action)){
                url = LOAD_FILE_STUDENT;
            }
            else if ("Logout".equals(action)) {
                url = LOGOUT;
            }else if ("SearchPoPostByName".equals(action)) {
                url= SEAR_POPOST_BY_NAME;
            }else if ("filterPostByStatus".equals(action)){
                url = FILTER_POPOST_BY_STATUS;
            }
            else if ("SearchProjectByName".equals(action)) {
                url = SEARCH_PROJECT;
            }else if ("DeletePoPost".equals(action)){
                url = DELETE_POPOST;                
            }
            else if ("RemoveProject".equals(action)) {
                url = REMOVE_PROJECT;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
