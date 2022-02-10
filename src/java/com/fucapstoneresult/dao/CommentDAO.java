/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;
import com.fucapstoneresult.models.CommentDTO;
import com.fucapstoneresult.models.UserCommentDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
     public List<CommentDTO> getListComments() throws SQLException {
        List<CommentDTO> listComments= new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {

                String sql = " SELECT CommentID, PostID, UserID, CommentDetail, CommentTime, CommentStatusID "
                        + " FROM Comments ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String commentId = rs.getString("CommentID");                  
                    String postId = rs.getString("PostID");
                    String userId = rs.getString("UserID");
                    String commentDetail = rs.getString("CommentDetali");
                    String commentTime = rs.getString("CommentTime");
                    int commentStatusId = rs.getInt("CommentStatusID");
                   
                    listComments.add(new CommentDTO(commentId, postId, userId, commentDetail, commentTime,commentStatusId ));
                }
            }
        } catch (Exception e) {

        } finally {
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
        return listComments;

    }
     
    public List<CommentDTO> getListCommentsByPost(String id) throws SQLException {
        List<CommentDTO> listComments= new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null) {

                String sql = "SELECT CommentID, UserID, CommentDetail, CommentTime " +
                            " FROM Comments " +
                            " WHERE PostID = ? AND CommentStatusID=2 ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String commentId = rs.getString("CommentID");                  
                    String postId = id;
                    String userId = rs.getString("UserID");
                    String commentDetail = rs.getString("CommentDetail");
                    String commentTime = convertDatetime(rs.getString("CommentTime"));
                   
                    listComments.add(new CommentDTO(commentId, postId, userId, commentDetail, commentTime, 2 ));
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
            if (conn != null) {
                conn.close();
            }
        }
        return listComments;

    }
     
     public boolean deleteComments(String commentId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Comments "
                        + " SET CommentStatusID = ?"                     
                        + " WHERE CommentID=? "
                        + " DELETE FROM ProjectOwnerPostComments "
                        + " WHERE CommentID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 3);
                stm.setString(2, commentId);
                stm.setString(3, commentId);
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
      public boolean undoAcceptComments(String commentId) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Comments "
                        + " SET CommentStatusID = ?"                     
                        + " WHERE CommentID=? "
                        + " DELETE FROM ProjectOwnerPostComments "
                        + " WHERE CommentID=? ";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 1);
                stm.setString(2, commentId);
                stm.setString(3, commentId);
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
       public List<UserCommentDTO> joinUserComment() throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        List<UserCommentDTO> userComment = new ArrayList<>();
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "SELECT Users.UserName, Users.Email , Comments.CommentDetail ,Posts.PostTitle , Comments.CommentStatusID , Comments.CommentTime , Comments.CommentID , Posts.PostID , Users.UserID" 
                        + " FROM Users"
                        + " JOIN Comments "
                        + " ON Users.UserID = Comments.UserID "
                        + " JOIN Posts "
                        + " ON Posts.PostID = Comments.PostID";
                stm = conn.prepareStatement(sql);   
                rs = stm.executeQuery();
                while(rs.next()){                
                    userComment.add(new UserCommentDTO(rs.getString("UserName"), rs.getString("Email"), rs.getString("CommentDetail"), rs.getString("PostTitle"),rs.getInt("CommentStatusID"),rs.getString("CommentTime"),rs.getString("CommentID"),rs.getString("PostID"),rs.getString("PostID")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs!= null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return userComment;
    }
       
    public static String convertDatetime(String date) {
        Timestamp originalTime = Timestamp.valueOf(date);
        Date convertDate = new Date(originalTime.getTime());
        DateFormat df = new SimpleDateFormat("dd/MM/YYYY HH:mm");
        return df.format(convertDate);
    }
       
    
//     public static void main(String[] args) throws SQLException {
//        CommentDAO dao = new CommentDAO();
//        List<UserCommentDTO> user =dao.joinUserComment();
//         for (UserCommentDTO userCommentDTO : user) {
//             System.out.println(userCommentDTO);
//         }
//    }
    
}
