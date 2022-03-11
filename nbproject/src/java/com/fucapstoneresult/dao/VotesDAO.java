/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author HP
 */
public class VotesDAO {

    public boolean addVote(String userID, String postID) throws SQLException {
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
                if (rs > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
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
                if (rs > 0) {
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public int countNumberVotes(String postID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        int count = 0;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " SELECT COUNT(UserID) as Count "
                        + "FROM Votes "
                        + "WHERE PostID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, postID);
                
                rs = stm.executeQuery();
                if(rs.next()){
                    count = rs.getInt("Count");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return count;
    }
    
    public boolean checkIfUserVote(String userId, String postId) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        boolean check = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = " SELECT UserID, PostID "
                        + "FROM Votes "
                        + "WHERE PostID = ? AND UserID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, postId);
                stm.setString(2, userId);
                
                rs = stm.executeQuery();
                if(rs.next()){
                    check = true;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return check;
    }

    public static void main(String[] args) throws SQLException {
        VotesDAO dao = new VotesDAO();
//        dao.addVote("2be08d52-a613-4b6c-a105-bc024b0a9d55", "1");
        System.out.println(dao.countNumberVotes("1"));
    }
}
