/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.StudentDAO;
import com.fucapstoneresult.dao.UserDAO;
import com.fucapstoneresult.models.StudentDTO;
import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    private static final String USER = "index.jsp";
    private static final String ADMIN = "mod-index.jsp";
    private static final String FAIL = "login-fail.jsp";
    private static final String ERROR = "login-not-allowed.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = FAIL;
        try {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            UserDAO dao = new UserDAO();
            UserDTO user = dao.checkLoginUser(email, password);

            

            if (user != null) {
                
                StudentDAO stuDao = new StudentDAO();
                StudentDTO stu = stuDao.getStudentById(user.getUserID());

                if (stu != null) {
                    int check = 1;
                    HttpSession session = request.getSession();
                    session.setAttribute("IS_STUDENT", check);
                }

                if (user.getUserStatus() != 3) {

                    HttpSession session = request.getSession();
                    session.setAttribute("USER", user);
                    if (user.getRoleID() == 1) {
                        url = USER;
                    } else {
                        url = ADMIN;
                    }

                } else {
                    request.setAttribute("LOGIN_FAIL", "You can not allowed to access!");
                    url = ERROR;
                }

            } else {
                request.setAttribute("LOGIN_FAIL", "Incorrect email or password!");
            }

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
