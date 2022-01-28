/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.CommentDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author VODUCMINH
 */
public class CommentDAO {
    public boolean insertComment(CommentDTO comment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO Comments(CommentID, PostID, UserID, CommentDetail, CommentTime, CommentStatusID) "
                            + " VALUES (?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, comment.getCommentId());
                stm.setString(2, comment.getPostId());
                stm.setString(3, comment.getUserId());
                stm.setString(4, comment.getCommentDetail());
                stm.setString(5, comment.getCommentTime());
                stm.setInt(6, comment.getCommentStatusId());
                
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
