/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.VotesDAO;
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
@WebServlet(name = "VoteController", urlPatterns = {"/VoteController"})
public class VoteController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        try {
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("USER");
            String postId = request.getParameter("id");
            int vote = Integer.parseInt(request.getParameter("vote"));

            if (user != null) {

                String s = request.getParameter("add");
                VotesDAO dao = new VotesDAO();
                PostsDAO d = new PostsDAO();
                
                boolean add = false;
                boolean check = dao.checkIfUserVote(user.getUserID(), postId);

                if ("true".equals(s)) {
                    add = true;
                }
                if (!check) {
                    if (add) {
                        dao.addVote(user.getUserID(), postId);
                        vote++;
                    } else {
                        dao.removeVote(user.getUserID(), postId);
                        vote--;
                    }
                } else {

                    dao.removeVote(user.getUserID(), postId);
                    vote--;
                }
                d.updateUpVoteByProjectId(postId, dao.countNumberVotes(postId));
                response.getWriter().write(dao.countNumberVotes(postId) + "");
            } else {
                response.getWriter().write("fail");
            }
        } catch (Exception e) {
            e.printStackTrace();
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
