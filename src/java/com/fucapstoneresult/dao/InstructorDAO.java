/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.InstructorDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author VODUCMINH
 */
public class InstructorDAO {
    public boolean insertInstructor(InstructorDTO instructor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO Instructors(InstructorID, InstructorName, InstructorImage, ProjectID) "
                            + " VALUES (?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, instructor.getInstructorID());
                stm.setString(2, instructor.getInstructorName());
                stm.setString(3, instructor.getInstructorImage());
                stm.setString(4, instructor.getProjectID());
                
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
    
    public InstructorDTO getInstructor(String instructorID) throws SQLException {
        InstructorDTO instructor = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT InstructorName, InstructorImage, ProjectID "
                            + " FROM Instructors "
                            + " WHERE InstructorID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, instructorID);
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    instructor = new InstructorDTO(instructorID, rs.getString("InstructorName"), rs.getString("InstructorImage"), rs.getString("ProjectID"));
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
        
        return instructor;
    }
    
    public boolean updateInstructor(InstructorDTO instructor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Instructors "
                            + " SET InstructorName=?, InstructorImage=?, ProjectID=? "
                            + " WHERE InstructorID=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, instructor.getInstructorName());
                stm.setString(2, instructor.getInstructorImage());
                stm.setString(3, instructor.getProjectID());
                stm.setString(4, instructor.getInstructorID());
                
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
    
    public boolean deleteInstructor(String instructorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "DELETE Instructors WHERE InstructorID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, instructorID);
                
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
