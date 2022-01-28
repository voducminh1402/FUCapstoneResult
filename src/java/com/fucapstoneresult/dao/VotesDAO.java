/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class VotesDAO {
    public boolean addVote(String userID, String postID) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        int rs = 0;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "INSERT INTO Votes (UserID, PostID) "
                        + " VALUES (?, ?) ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, postID);
                rs = stm.executeUpdate();
                if (rs > 0)
                    check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) 
                stm.close();
            if (con != null)
                con.close();
        }
        return check;
    }
    
    

    public boolean removeVote(String userID, String postID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        int rs = 0;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "DELETE FROM Votes"
                        + " WHERE UserID = ? AND PostID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                stm.setString(2, postID);
                rs = stm.executeUpdate();
                if (rs > 0)
                    check = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) 
                stm.close();
            if (con != null)
                con.close();
        }
        return check;
    }
    
    public static void main(String[] args) throws SQLException {
        VotesDAO dao = new VotesDAO();
        dao.addVote("34919a13-4f2c-4433-a54c-cb62c1f878f4", "1");
    }
}
