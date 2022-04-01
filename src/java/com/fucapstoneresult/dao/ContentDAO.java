/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.SemesterDTO;
import com.fucapstoneresult.models.SlideDTO;
import com.fucapstoneresult.models.StudentDTO;
import com.fucapstoneresult.models.TimelineDTO;
import com.fucapstoneresult.utils.DBUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
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
    
    public static List<TimelineDTO> getCurrentTimeline() throws SQLException {
        List<TimelineDTO> timelineList = new ArrayList<>();
        String timelineString = "";
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
                    timelineString = rs.getString("ContentValue");
                    LocalDate currentdate = LocalDate.now();
                    String dateValue = "";
                    int currentYear = currentdate.getYear();
                    int currentMonth = currentdate.getMonthValue();
                    
                    if (currentMonth >= 1 && currentMonth <= 4) {
                        dateValue = "Spring " + currentYear;
                    }
                    else if (currentMonth >= 5 && currentMonth <= 8) {
                        dateValue = "Summer " + currentYear;
                    }
                    else if (currentMonth >= 9 && currentMonth <= 12) {
                        dateValue = "Fall " + currentYear;
                    }
                    
                    SemesterDAO semDao = new SemesterDAO();
                    List<SemesterDTO> semList = semDao.getAllSemester();
                    
                    String semID = "";
                    
                    for (SemesterDTO semesterDTO : semList) {
                        if (semesterDTO.getSemesterName().equals(dateValue)) {
                            semID = semesterDTO.getSemesterID();
                        }
                    }
                    
                    ContentDAO dao = new ContentDAO();
                    String jsonFromTable = dao.getTimeline();
                    
                    List<TimelineDTO> allTimeline = null;

                    if (jsonFromTable.equals("[]")) {
                        allTimeline = new ArrayList<>();
                    }
                    else {
                        Type type = new TypeToken<List<TimelineDTO>>(){}.getType();
                        allTimeline = new Gson().fromJson(jsonFromTable, type);
                        for (TimelineDTO timelineInSem : allTimeline) {
                            if(timelineInSem.getSemester().equals(semID)){
                                timelineList.add(timelineInSem);
                            }
                        }
                    }
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
