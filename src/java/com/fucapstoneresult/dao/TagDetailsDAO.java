/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.PostsDTO;
import com.fucapstoneresult.models.TagDetailsDTO;
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
public class TagDetailsDAO {
    public TagDetailsDTO getTagDetails(String tagID) throws SQLException{
        TagDetailsDTO tagDetail = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
           conn = DBUtils.getConnection();
           if(conn!=null){
                String sql = " SELECT TagDetailID, TagDetailName "
                            +" FROM TagDetails "
                            +" WHERE TagDetailID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagID);
                rs = stm.executeQuery();
                if(rs.next()){
                    String TagDetailID = rs.getString("TagDetailID");
                    String TagdetailName = rs.getString("TagDetailName");
                    
                    tagDetail = new TagDetailsDTO(TagDetailID, TagdetailName);
                }
            } 
       } catch (Exception e) {
           e.printStackTrace();
       }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();  
        }
        
        
        return tagDetail;
   }
    
   
    public boolean update(TagDetailsDTO tagdetail) throws SQLException{
        boolean check = false;
        Connection conn =null;
        PreparedStatement stm = null;
        try {
            conn=com.fucapstoneresult.utils.DBUtils.getConnection();
            if(conn!=null){
                String sql = " UPDATE TagDetails SET TagDetailName=? "
                            +" WHERE TagDetailID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagdetail.getTagDetailName());
                stm.setString(2, tagdetail.getTagDetailID());
                check=stm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
   
    
    public boolean insert(TagDetailsDTO tagdetail ) throws SQLException{
        boolean check = false;
        Connection conn =null;
        PreparedStatement stm = null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql = " INSERT INTO TagDetails(TagDetailID, TagDetailName) "
                            +" VALUES(?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tagdetail.getTagDetailID());
                stm.setString(2, tagdetail.getTagDetailName());
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
    
    public boolean delete(String TagDetailID) throws SQLException{
        boolean check=false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql = " DELETE TagDetails "
                            +" WHERE TagDetailID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, TagDetailID);
                check=stm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        
        
        return check;
    }
    
    public List<TagDetailsDTO> getTagsByName(String name) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<TagDetailsDTO> list = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT TagDetailID "
                        + " FROM TagDetails "
                        + " WHERE TagDetailName like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, "%" + name + "%");
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new TagDetailsDTO(rs.getString("TagDetailID")));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) 
                rs.close();
            if (stm != null) 
                stm.close();
            if (con != null) 
                con.close();
        }
        return list;
    }
    
    public static void main(String[] args) throws SQLException {
        TagDetailsDAO dao = new TagDetailsDAO();
        PostsDAO d = new PostsDAO();
        List<TagDetailsDTO> list = dao.getTagsByName("o");
        List<PostsDTO> l;
        List<PostsDTO> listPosts = new ArrayList<>();
        int count = 0;
        for (TagDetailsDTO tagDetailsDTO : list) {
            l = d.getPostsByTagID(tagDetailsDTO.getTagDetailID());
//            for (PostsDTO postsDTO : l) {
//                count++;
//                System.out.println(postsDTO);
//            }
//            System.out.println(l.size());
            listPosts.addAll(l);
        }
        System.out.println(count);
        for (PostsDTO listPost : listPosts) {
            System.out.println(listPost);
        }
        System.out.println(listPosts.size());
    }
}
