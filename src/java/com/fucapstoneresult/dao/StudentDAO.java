/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.StudentDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author VODUCMINH
 */
public class StudentDAO {
    public boolean insertStudent(StudentDTO student) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO Students(StudentID, StudentName, MajorID, StudentImage, TeamID) "
                            + " VALUES (?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, student.getStudentID());
                stm.setString(2, student.getStudentName());
                stm.setString(3, student.getMajorID());
                stm.setString(4, student.getStudentImage());
                stm.setString(5, student.getTeamID());
                
                
                check = stm.executeUpdate() > 0;
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return check;
    }
    
        public StudentDTO getStudent(String studentID) throws SQLException {
        StudentDTO student = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT StudentName, MajorID, StudentImage, TeamID "
                            + " FROM Students "
                            + " WHERE StudentID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, studentID);
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    student = new StudentDTO(studentID, rs.getString("StudentName"), rs.getString("MajorID"), rs.getString("StudentImage"), rs.getString("TeamID"));
                }
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return student;
    }
    
    public boolean updateStudent(StudentDTO student) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Students "
                            + " SET StudentName=?, MajorID=?, StudentImage=?, TeamID=? "
                            + " WHERE StudentID=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, student.getStudentName());
                stm.setString(2, student.getMajorID());
                stm.setString(3, student.getStudentImage());
                stm.setString(4, student.getTeamID());
                stm.setString(5, student.getStudentID());
                
                check = stm.executeUpdate() > 0;
                
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return check;
    }
    
    public boolean deleteStudent(String studentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "DELETE Students WHERE StudentID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, studentID);
                
                check = stm.executeUpdate() > 0;
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        
        return check;
    }
    
}
