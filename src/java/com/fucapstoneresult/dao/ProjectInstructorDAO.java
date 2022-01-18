/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.ProjectInstructorDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author PhongVu
 */
public class ProjectInstructorDAO {
    public boolean insertProjectInstructor(ProjectInstructorDTO ProIns) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO ProjectInstructor(ProjectID, InstructorID) "
                            + " VALUES (?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ProIns.getProjectID());
                stm.setString(2, ProIns.getInstructorID());
                
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
    
    public ProjectInstructorDTO getProjectInstructor(String projectID) throws SQLException {
        ProjectInstructorDTO proins = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT InstructorID "
                            + " FROM ProjectInstructor "
                            + " WHERE ProjectID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, projectID);
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    proins = new ProjectInstructorDTO(projectID, rs.getString("InstructorID"));
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
        
        return proins;
    }
    
    public boolean udpateProjectInstructor(ProjectInstructorDTO proins) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE ProjectInstructor "
                            + " SET InstructorID=? "
                            + " WHERE ProjectID=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, proins.getInstructorID());
                stm.setString(2, proins.getProjectID());
                
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
    
    public boolean deleteProjectInstructor(String projectID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "DELETE ProjectInstructor WHERE ProjectID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, projectID);
                
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
