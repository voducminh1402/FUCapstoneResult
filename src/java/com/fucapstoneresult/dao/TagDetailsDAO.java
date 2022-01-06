/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

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
    public List<TagDetailsDTO> getListTagDetails(String search) throws SQLException{
        List<TagDetailsDTO> listtagdetail = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
           conn=com.fucapstoneresult.utils.DBUtils.getConnection();
           if(conn!=null){
                String sql = " SELECT TagDetailID, TagDetailName "
                            +" FROM TagDetails "
                            +" WHERE TagDetailID like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%"+search+"%");
                rs = stm.executeQuery();
                while(rs.next()){
                    String TagDetailID = rs.getString("TagDetailID");
                    String TagdetailName = rs.getString("TagDetailName");
                    
                    listtagdetail.add(new TagDetailsDTO(TagDetailID, TagdetailName));
                }
            } 
       } catch (Exception e) {
           e.printStackTrace();
       }finally{
            if(rs!=null) rs.close();
            if(stm!=null) stm.close();
            if(conn!=null) conn.close();  
        }
        
        
        return listtagdetail;
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
}
