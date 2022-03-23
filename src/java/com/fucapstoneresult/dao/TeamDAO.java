/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.TeamDTO;
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
public class TeamDAO {
    public boolean insertTeam(TeamDTO team) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO Teams(TeamID, TeamName) "
                            + " VALUES (?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, team.getTeamID());
                stm.setString(2, team.getTeamName());
                
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
    
    public TeamDTO getTeam(String teamID) throws SQLException {
        TeamDTO team = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT TeamName "
                            + " FROM Teams "
                            + " WHERE TeamID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, teamID);
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    team = new TeamDTO(teamID, rs.getString("TeamName"));
                }
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
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
        
        return team;
    }
    
    public TeamDTO getTeamByName(String name) throws SQLException {
        TeamDTO team = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT TeamID "
                            + " FROM Teams "
                            + " WHERE TeamName =?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, name);
                rs = stm.executeQuery();
                
                if (rs.next()) {
                    team = new TeamDTO(rs.getString("TeamID"), name);
                }
            }
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
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
        
        return team;
    }
    
    public boolean updateTeam(TeamDTO team) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Teams "
                            + " SET TeamName=? "
                            + " WHERE TeamID=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, team.getTeamName());
                stm.setString(2, team.getTeamID());
                
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
    
    public boolean updateTeamWithProject(String teamID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Teams "
                            + " SET TeamID=? "
                            + " WHERE TeamID=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, teamID);
                stm.setString(2, teamID);
                
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
    
    public boolean deleteTeam(String teamID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "DELETE Teams WHERE TeamID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, teamID);
                
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
    
    
     
    
    public List<TeamDTO> getAllTeam() throws SQLException {
        List<TeamDTO> List = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT TeamID, TeamName "
                            + " FROM Teams ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String teamID = rs.getString("TeamID");
                    String teamName = rs.getString("TeamName");
                    
                    List.add(new TeamDTO(teamID, teamName));
                }
            }
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
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
        
        return List;
    }
    
}
