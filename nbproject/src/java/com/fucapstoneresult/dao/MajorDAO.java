/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.MajorDTO;
import com.fucapstoneresult.models.TeamDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author VODUCMINH
 */
public class MajorDAO {
    public boolean insertMajor(MajorDTO major) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO Majors(MajorID, MajorName, MajorImage) "
                            + " VALUES (?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, major.getMajorID());
                stm.setString(2, major.getMajorName());
                stm.setString(3, major.getMajorImage());
                
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
    
    public MajorDTO getMajor(String majorID) throws SQLException {
        MajorDTO major = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT MajorName, MajorImage "
                            + " FROM Majors "
                            + " WHERE MajorID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, majorID);
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    major = new MajorDTO(majorID, rs.getString("MajorName"), rs.getString("MajorImage"));
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
        
        return major;
    }
    
    public boolean updateMajor(MajorDTO major) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Majors "
                            + " SET MajorName=?, MajorImage=? "
                            + " WHERE MajorID=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, major.getMajorName());
                stm.setString(2, major.getMajorImage());
                stm.setString(3, major.getMajorID());
                
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
    
    public boolean deleteMajor(String majorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "DELETE Majors WHERE MajorID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, majorID);
                
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
