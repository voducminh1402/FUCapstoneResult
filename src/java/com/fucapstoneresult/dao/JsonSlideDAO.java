/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.JsonSlideDTO;
import com.fucapstoneresult.utils.DBUtils;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author PhongVu
 */
public class JsonSlideDAO {
    public static JsonArray ConvertStringToJson(List<JsonSlideDTO> list){
        JsonArray jsonEle = (JsonArray) new Gson().toJsonTree(list);
        return jsonEle;
    }
    
    
    public static boolean insertJsonSlide(JsonArray list) throws SQLException{
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "UPDATE Content "
                            + " SET ContentValue=? "
                            + " WHERE ContentKey=N'slide'";
                stm = conn.prepareStatement(sql);
                stm.setString(1, list.toString());
                
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
    
    
    
    
    
    
    public static void main(String[] args) throws SQLException {
        List<JsonSlideDTO> list = new ArrayList<>();
        list.add(new JsonSlideDTO("Content1", "Https:......", "23/02/2001"));
        list.add(new JsonSlideDTO("Content2", "Https:......", "23/02/2001"));
        
        JsonArray listJson = JsonSlideDAO.ConvertStringToJson(list);
        
        boolean check = JsonSlideDAO.insertJsonSlide(listJson);
        
        if(check){
            System.out.println("Success");
        }else{
            System.out.println("Fail");
        }
    }
}
