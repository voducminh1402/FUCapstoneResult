/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.ProjectOwnerPostCommentsDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Asus
 */
public class ProjectOwnerPostCommentsDAO {
    public boolean insertPostComment(ProjectOwnerPostCommentsDTO postComment) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO ProjectOwnerPostComments(CommentID, POPostID, UserID, CommentDetail , CommentTime, CommentStatusID)"
                        + " VALUES(?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, postComment.getCommentID());
                stm.setString(2, postComment.getPopostID());
                stm.setString(3, postComment.getUserID());
                stm.setString(4, postComment.getCommentDetail());
                stm.setString(5, postComment.getCommentTime());
                stm.setInt(6, postComment.getCommentStatusID());                        
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
    public boolean deletePostComment(String CommentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " DELETE FROM ProjectPostOwnerComments "                     
                        + " WHERE CommentID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, CommentID);
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
    public boolean updateProjectPostCommentStatus(ProjectOwnerPostCommentsDTO postComment) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {

            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE ProjectOwnerPostComments SET CommentStatusID=? "
                        + " WHERE CommentID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, postComment.getCommentStatusID());
                stm.setString(2, postComment.getCommentID());             
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
