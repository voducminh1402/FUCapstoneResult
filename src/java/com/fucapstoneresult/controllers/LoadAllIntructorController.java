/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.InstructorDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.dao.ProjectInstructorDAO;
import com.fucapstoneresult.models.InstructorDTO;
import com.fucapstoneresult.models.InstructorDetailDTO;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "LoadAllIntructorController", urlPatterns = {"/LoadAllIntructorController"})
public class LoadAllIntructorController extends HttpServlet {

    private static final String SUCCESS = "instructor.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            InstructorDAO dao = new InstructorDAO();
            ProjectInstructorDAO pDao = new ProjectInstructorDAO();
            List<InstructorDTO> instructorList = dao.getAllInstructor();
            List<InstructorDetailDTO> list = new ArrayList<>();
            for (InstructorDTO o : instructorList) {
                list.add(new InstructorDetailDTO(o.getInstructorID(), o.getInstructorName(), o.getInstructorImage(), pDao.getNumberProjectOfInstructor(o.getInstructorID())));
            }

            request.setAttribute("LIST_INSTRUCTOR_ALL", list);

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
