/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.UserDAO;
import com.fucapstoneresult.googleLogin.GooglePojo;
import com.fucapstoneresult.googleLogin.GoogleUtils;
import com.fucapstoneresult.models.UserDTO;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class LoginGoogleController extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static final String USER = "index.jsp";
    private static final String ADMIN = "mod-index.jsp";
    private static final String ERROR = "login-not-allowed.html";

    public LoginGoogleController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            if (code == null || code.isEmpty()) {
                RequestDispatcher dis = request.getRequestDispatcher("login.html");
                dis.forward(request, response);
            } else {
                String accessToken = GoogleUtils.getToken(code);
                GooglePojo user = GoogleUtils.getUserInfo(accessToken);
                UserDAO dao = new UserDAO();
                UserDTO userDTO = dao.searchUserByEmail(user.getEmail());
                if (userDTO == null) {
                    UUID id = UUID.randomUUID();
                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                    LocalDateTime now = LocalDateTime.now();
                    String createDate = dtf.format(now);
                    userDTO = new UserDTO(id.toString(), user.getName(), createDate, 2, "", user.getEmail(), "", "", 1);
                    dao.addUser(userDTO);
                }

                HttpSession session = request.getSession();

                if (userDTO.getUserStatus() != 3) {
                    if (userDTO.getRoleID() == 1) {
                        url = USER;
                    } else {
                        url = ADMIN;
                    }

                    session.setAttribute("USER", userDTO);
                }
                else{
                    request.setAttribute("LOGIN_FAIL", "You can not allowed to access!");
                }

                UserDTO userLogin = (UserDTO) session.getAttribute("USER");
                System.out.println(userLogin.getUserName());
                System.out.println(userLogin.getEmail());

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            response.sendRedirect(url);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
