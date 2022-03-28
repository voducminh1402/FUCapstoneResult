/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.SlideDTO;
import com.fucapstoneresult.models.StudentDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VODUCMINH
 */
public class ContentDAO {
    public boolean updateSlide(String jsonSlide) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Content "
                            + " SET ContentValue=? "
                            + " WHERE ContentKey=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, jsonSlide);
                stm.setString(2, "slide");
                
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
    
    public String getSlide() throws SQLException {
        String slideList = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT ContentValue "
                        + " FROM Content "
                        + " WHERE ContentKey=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "slide");
                rs = stm.executeQuery();

                if (rs.next()) {
                    slideList = rs.getString("ContentValue");
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

        return slideList;
    }
    
    public boolean updateIndex(String jsonIndex) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Content "
                            + " SET ContentValue=? "
                            + " WHERE ContentKey=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, jsonIndex);
                stm.setString(2, "contextIndex");
                
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
    
    public String getIndex() throws SQLException {
        String indexList = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT ContentValue "
                        + " FROM Content "
                        + " WHERE ContentKey=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "contextIndex");
                rs = stm.executeQuery();

                if (rs.next()) {
                    indexList = rs.getString("ContentValue");
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

        return indexList;
    }
    
    public boolean updateTimeline(String jsonTimeline) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Content "
                            + " SET ContentValue=? "
                            + " WHERE ContentKey=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, jsonTimeline);
                stm.setString(2, "timeline");
                
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
    
    public String getTimeline() throws SQLException {
        String timelineList = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT ContentValue "
                        + " FROM Content "
                        + " WHERE ContentKey=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "timeline");
                rs = stm.executeQuery();

                if (rs.next()) {
                    timelineList = rs.getString("ContentValue");
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

        return timelineList;
    }
    
}
