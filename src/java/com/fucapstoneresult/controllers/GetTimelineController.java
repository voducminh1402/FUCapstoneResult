/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.ContentDAO;
import com.fucapstoneresult.dao.SemesterDAO;
import com.fucapstoneresult.models.SemesterDTO;
import com.fucapstoneresult.models.SlideDTO;
import com.fucapstoneresult.models.TimelineDTO;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author PhongVu
 */
public class GetTimelineController extends HttpServlet {

    private static final String TARGET = "mod-timeline-content.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String semesterID = request.getParameter("id");
            request.setAttribute("SEMESTER_ID", semesterID);
            
            List<TimelineDTO> timelineList = null;
            List<TimelineDTO> timelineListInSem = null;
            List<SemesterDTO> listSem = null;
            ContentDAO dao = new ContentDAO();
            SemesterDAO daoSem = new SemesterDAO();
            String jsonFromTable = dao.getTimeline();
            listSem = daoSem.getAllSemester();
            timelineListInSem = new ArrayList<>();
            
            if (jsonFromTable.equals("[]")) {
                timelineList = new ArrayList<>();
            }
            else {
                Type type = new TypeToken<List<TimelineDTO>>(){}.getType();
                timelineList = new Gson().fromJson(jsonFromTable, type);
                for (TimelineDTO timelineInSem : timelineList) {
                    if(timelineInSem.getSemester().equals(semesterID)){
                    timelineListInSem.add(timelineInSem);
                    }
                }
            }
            
            request.setAttribute("TIMELINE", timelineListInSem);
            request.setAttribute("LIST_SEMESTER", listSem);
        } 
        catch (Exception e) {
            System.out.println(e.toString());
        }
        finally {
            request.getRequestDispatcher(TARGET).forward(request, response);
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
