/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;



import com.fucapstoneresult.models.ProjectOwnerTagDetailsDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Asus
 */
public class ProjectOwnerTagDetailsDAO {
    public boolean insertProjectOwnerTagDetails(ProjectOwnerTagDetailsDTO tagsDetails) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO ProjectOwnerTagDetails(TagDetailsID, TagDetailName)"
                        + " VALUES(?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagsDetails.getTagDetailID());
                stm.setString(2, tagsDetails.getTagDetailName());                                  
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    public boolean deleteProjectOwnerTagDetails(String tagDetailId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " DELETE FROM ProjectOwnerTagDetails "                     
                        + " WHERE TagDetailID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagDetailId);
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }
    public boolean updateProjectOwnerTagDetails(ProjectOwnerTagDetailsDTO tagDetail) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {

            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE ProjectOwnerTagDetails SET TagDetailName=? "
                        + " WHERE TGagDetailID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagDetail.getTagDetailName());
                stm.setString(2, tagDetail.getTagDetailID());             
                check = stm.executeUpdate() > 0 ? true : false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
