/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.controllers;

import com.fucapstoneresult.dao.PostsDAO;
import com.fucapstoneresult.dao.ProjectDAO;
import com.fucapstoneresult.dao.SemesterDAO;
import com.fucapstoneresult.models.PostsDTO;
import com.google.gson.Gson;
import com.google.gson.stream.JsonWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
@WebServlet(name = "FilterPostController", urlPatterns = {"/FilterPostController"})
public class FilterPostController extends HttpServlet {

    private static final String SUCCESS = "project-major.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            //da lay duoc du lieu tu database nghi cach tra ve trang html nua thoi
            //co the trả lại một tập json xong rồi dùng js để show ra tại vì còn lazy load nữa
            String semesterName = request.getParameter("filterValue");
            PostsDAO postDao = new PostsDAO();
            List<PostsDTO> listPost;
            if ("Học Kì".equals(semesterName)) {
                
                listPost = postDao.getAllPost();
            } else {
                SemesterDAO semesterDao = new SemesterDAO();
                String semesterID = semesterDao.getSemesterByName(semesterName);

                ProjectDAO projectDao = new ProjectDAO();
                List<String> listProjectID;
                listProjectID = projectDao.getAllProjectIDBySemester(semesterID);
                listPost = postDao.getPostsByProjectID(listProjectID);
            }

            String json = new Gson().toJson(listPost);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
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
