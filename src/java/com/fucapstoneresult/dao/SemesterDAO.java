/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.SemesterDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author VODUCMINH
 */
public class SemesterDAO {
    public boolean insertSemester(SemesterDTO semester) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO Semesters(SemesterID, SemesterName) "
                            + " VALUES (?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, semester.getSemesterID());
                stm.setString(2, semester.getSemesterName());
                
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
    
    public SemesterDTO getSemester(String semesterID) throws SQLException {
        SemesterDTO semester = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT SemesterName "
                            + " FROM Semesters "
                            + " WHERE SemesterID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, semesterID);
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    semester = new SemesterDTO(semesterID, rs.getString("SemesterName"));
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
        
        return semester;
    }
    
    public boolean udpateSemester(SemesterDTO semester) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Semesters "
                            + " SET SemesterName=? "
                            + " WHERE SemesterID=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, semester.getSemesterName());
                stm.setString(2, semester.getSemesterID());
                
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
    
    public boolean deleteSemester(String semesterID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "DELETE Semesters WHERE SemesterID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, semesterID);
                
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
    
    public static void main(String[] args) throws SQLException {
        SemesterDAO dao = new SemesterDAO();
        
//        boolean check = dao.udpateSemester(new SemesterDTO("1", "Spring20211"));
//        SemesterDTO dto = dao.getSemester("1");
//        System.out.println(dto.getSemesterName());

boolean check = dao.deleteSemester("1");
        
        System.out.println(check);
    }
    
}
