/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.ProjectOwnerPostsDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class PoPostDAO {
    public List<ProjectOwnerPostsDTO>  getAllPost() throws SQLException {
        List<ProjectOwnerPostsDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try{
            conn= com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null){
                String sql = "SELECT SELECT POPostID, POPostTitle, POPostContent, POPostImage, POPostDate, StudentID, LastEditedUser, Upvote, POPostStatusID, PostID"
                        +" FROM ProjectOwnerPosts";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()){
                    String PoPostID = rs.getString("POPostID");
                    String PoPostTitle = rs.getString("POPostTitle");
                    String PoPostDate = rs.getString("POPostDate");
                    String studentID = rs.getString("StudentID");
                    String PoPostContent = rs.getString("POPostContent");
                    String PostImage = rs.getString("POPostImage");
                    String LastEditedUser = rs.getString(" LastEditedUser");
                    int Upvote = Integer.parseInt(rs.getString("Upvote"));
                    int PostStatusID = Integer.parseInt(rs.getString("POPostStatusID"));
                    String ProjectID = rs.getString("PostID");
                    
                    listPost.add(new ProjectOwnerPostsDTO(PoPostID, PoPostTitle, PoPostDate, studentID, PoPostContent, PostImage, LastEditedUser, Upvote, PostStatusID, ProjectID));
                    
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        finally {
            if (rs != null){
                rs.close();
            }
            if (stm!=null){
                stm.close();
            }
            if (conn != null){
                conn.close();
            }
        }
        return listPost;
    }
    
    public boolean insert (ProjectOwnerPostsDTO post) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = " INSERT INTO ProjectOwnerPosts(POPostID, POPostTitle, POPostContent, POPostImage, POPostDate, StudentID, LastEditedUser, Upvote, POPostStatusID, PostID)"
                        +" VALUES (?,?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getPopostID());
                stm.setString(2, post.getPopostTitle());
                stm.setString(3, post.getPopostContent());
                stm.setString(4, post.getPopostImage());
                stm.setString(5, post.getPopostDate());
                stm.setString(6, post.getPopostAuthorID());
                stm.setString(7, post.getLastEditedUser());
                stm.setInt(8, post.getUpvote());
                stm.setInt(9, post.getStatusID());
                stm.setString(10, post.getPostID());
                check = stm.executeUpdate() > 0 ? true : false;
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally{
            if (stm!=null){
                stm.close();
            }if (conn!=null){
                conn.close();
            }
        }
            return check;
    }
    
    public boolean update (ProjectOwnerPostsDTO post) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = com.fucapstoneresult.utils.DBUtils.getConnection();
            if (conn != null){
                String sql = "UPDATE ProjectOwnerPosts SET POPostTitle = ?, POPostContent = ?, POPostImage = ?, LastEditedUser = ?"
                        + "WHERE POPostID = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getPopostTitle());
                stm.setString(2, post.getPopostContent());
                stm.setString(3, post.getPopostImage());
                stm.setString(4, post.getLastEditedUser());
                stm.setString(5, post.getPopostID());
                
                check = stm.executeUpdate() > 0 ? true : false;
            }
        }catch (Exception e ){            
        } finally{
            if (stm != null){
                stm.close();
            }
            if (conn != null){
                conn.close();
            }
        }
        return check;
    }
    
    public boolean delete (String PostID) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try{
            conn = DBUtils.getConnection();
            if (conn != null){
                String sql = "UPDATE ProjectOwnerPosts"
                        + " SET POPostStatusID = ?"
                        + " WHERE POPostID = ?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 3);
                stm.setString(2, PostID);
                
                check = stm.executeUpdate() > 0 ? true : false;
            }
        }catch(Exception e){   
            e.printStackTrace();
        }finally {
            if (stm != null){
                stm.close();
            }
            if (conn != null){
                conn.close();
            }
        }
        return check;
    }
}
