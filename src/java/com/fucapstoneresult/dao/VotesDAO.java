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
                stm.setString(2, userID);
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
}
