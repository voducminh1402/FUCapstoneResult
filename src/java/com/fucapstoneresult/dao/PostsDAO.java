/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PhongVu
 */
public class PostsDAO {
    
    
   public List<PostsDTO> getListPost(String search) throws SQLException{
        List<PostsDTO> listPost = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
           conn=com.fucapstoneresult.utils.DBUtils.getConnection();
           if(conn!=null){
                String sql = " SELECT PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, ProjectID "
                            +" FROM Posts "
                            +" WHERE PostID like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%"+search+"%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String PostID = rs.getString("PostID");
                    String PostTitle = rs.getString("PostTitle");
                    String PostDate = rs.getString("PostDate");
                    String PostAuthor = rs.getString("PostAuthor");
                    String PostContent = rs.getString("PostContent");
                    String PostImage = rs.getString("PostImage");
                    String LastEditedUser = rs.getString("LastEditedUser");
                    int Upvote = Integer.parseInt(rs.getString("Upvote"));
                    int PostStatusID = Integer.parseInt(rs.getString("PostStatusID"));
                    String ProjectID = rs.getString("ProjectID");

                    listPost.add(new PostsDTO(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, ProjectID));
                }
            } 
       } catch (Exception e) {
           e.printStackTrace();
       }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();  
        }
        
        
        return listPost;
   }
    
   
    public boolean update(PostsDTO post) throws SQLException{
        boolean check = false;
        Connection conn =null;
        PreparedStatement stm = null;
        try {
            conn=com.fucapstoneresult.utils.DBUtils.getConnection();
            if(conn!=null){
                String sql = " UPDATE Posts SET PostTitle=?, PostDate=?, PostAuthor=?, PostContent=?, PostImage=?, LastEditedUser=? "
                            +" WHERE PostID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getPostTitle());
                stm.setString(2, post.getPostDate());
                stm.setString(3, post.getPostAuthor());
                stm.setString(4, post.getPostContent());
                stm.setString(5, post.getPostImage());
                stm.setString(6, post.getLastEditedUser());
                stm.setString(7, post.getPostID());
                check=stm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
   
    
    public boolean insert(PostsDTO post) throws SQLException{
        boolean check = false;
        Connection conn =null;
        PreparedStatement stm = null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql = " INSERT INTO Posts(PostID, PostTitle, PostDate, PostAuthor, PostContent, PostImage, LastEditedUser, Upvote, PostStatusID, ProjectID) "
                            +" VALUES(?,?,?,?,?,?,?,?,?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, post.getPostID());
                stm.setString(2, post.getPostTitle());
                stm.setString(3, post.getPostDate());
                stm.setString(4, post.getPostAuthor());
                stm.setString(5, post.getPostContent());
                stm.setString(6, post.getPostImage());
                stm.setString(7, post.getLastEditedUser());
                stm.setInt(8, post.getUpvote());
                stm.setInt(9, post.getPostStatusID());
                stm.setString(10, post.getProjectID());
                check=stm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        
        
        return check;
    }
    
    public boolean delete(String PostID) throws SQLException{
        boolean check=false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql = " DELETE Posts "
                            +" WHERE PostID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, PostID);
                check=stm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        
        
        return check;
    }
   
}
