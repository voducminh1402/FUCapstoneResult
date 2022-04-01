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
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "UpdateInfoUserByUserController", urlPatterns = {"/UpdateInfoUserByUserController"})
public class UpdateInfoUserByUserController extends HttpServlet {

    private static final String SUCCESS = "user-info-update.jsp";
    private static final String FAIL = "error.html";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String subEmail = request.getParameter("sub-email");

//(,   String subEmail, String password, String OTP, int roleID) {
            UserDAO dao = new UserDAO();
            UserDTO user;
            if (dao.searchUserByEmail(subEmail) != null) {
                request.setAttribute("SUB_EMAIL_DUPLICATED", "Email này đã bị trùng! Xin thử lại với email khác.");
            } else if (dao.searchUserByEmail(email) != null) {
                request.setAttribute("EMAIL_DUPLICATED", "Email này đã bị trùng! Xin thử lại với email khác.");
            } else {
                user = new UserDTO(id, name, "", 2, "", email, subEmail, "", "", 1);
                if (!dao.updateUserByAdmin(user)) {

                    url = FAIL;
                }
            }

            user = dao.searchUserByID(id);
            request.setAttribute("USER_DETAIL", user);

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
