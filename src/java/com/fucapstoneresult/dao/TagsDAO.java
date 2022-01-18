/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.TagsDTO;
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
public class TagsDAO {
    
    public List<TagsDTO> getListTag(String search) throws SQLException{
        List<TagsDTO> listtag = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
           conn=com.fucapstoneresult.utils.DBUtils.getConnection();
           if(conn!=null){
                String sql = " SELECT PostID, TagDetailID "
                            +" FROM Tags "
                            +" WHERE PostID like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%"+search+"%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String PostID = rs.getString("PostID");
                    String TagdetailID = rs.getString("TagDetailID");
                    
                    listtag.add(new TagsDTO(PostID, TagdetailID));
                }
            } 
       } catch (Exception e) {
           e.printStackTrace();
       }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();  
        }
        
        return listtag;
   }
    
   
    public boolean update(TagsDTO tag) throws SQLException{
        boolean check = false;
        Connection conn =null;
        PreparedStatement stm = null;
        try {
            conn=com.fucapstoneresult.utils.DBUtils.getConnection();
            if(conn!=null){
                String sql = " UPDATE Tags SET TagDetaildID=? "
                            +" WHERE PostID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tag.getTagdetailID());
                stm.setString(2, tag.getPostID());
                check=stm.executeUpdate()>0?true:false;
            }
        } catch (Exception e) {
        }finally{
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();
        }
        return check;
    }
   
    
    public boolean insert(TagsDTO tag ) throws SQLException{
        boolean check = false;
        Connection conn =null;
        PreparedStatement stm = null;
        try {
            conn=DBUtils.getConnection();
            if(conn!=null){
                String sql = " INSERT INTO Tags(PostID, TagDetailID) "
                            +" VALUES (?,?) ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, tag.getPostID());
                stm.setString(2, tag.getTagdetailID());
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
                String sql = " DELETE Tags "
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
