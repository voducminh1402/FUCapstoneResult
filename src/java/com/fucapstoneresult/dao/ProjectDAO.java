/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.ProjectDTO;
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
public class ProjectDAO {
    public boolean insertProject(ProjectDTO project) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "INSERT INTO Projects(ProjectID, ProjectName, ProjectDescription, ProjectImage, ProjectScore, MajorID, SemesterID) "
                            + " VALUES (?,?,?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, project.getProjectID());
                stm.setString(2, project.getProjectName());
                stm.setString(3, project.getProjectDescription());
                stm.setString(4, project.getProjectImage());
                stm.setFloat(5, project.getProjectScore());
                stm.setString(6, project.getMajorID());
                stm.setString(7, project.getSemesterID());
                
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
    
    public List<ProjectDTO> getAllProject() throws SQLException {
        List<ProjectDTO> projectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT ProjectID, ProjectName, ProjectDescription, ProjectImage, ProjectScore, MajorID, SemesterID "
                            + " FROM Projects ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String projectID = rs.getString("ProjectID");
                    String projectName = rs.getString("ProjectName");
                    String projectDescription = rs.getString("ProjectDescription");
                    String projectImage = rs.getString("ProjectImage");
                    float projectScore = Float.parseFloat(rs.getString("ProjectScore"));
                    String majorID = rs.getString("MajorID");
                    String semesterID = rs.getString("SemesterID");
                    
                    projectList.add(new ProjectDTO(projectID, projectName, projectDescription, projectImage, projectScore, majorID, semesterID));
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
        
        return projectList;
    }
    
    public List<ProjectDTO> getAllProjectBySemester(String semesterID) throws SQLException {
        List<ProjectDTO> projectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT ProjectID, ProjectName, ProjectDescription, ProjectImage, ProjectScore, MajorID, SemesterID "
                            + " FROM Projects "
                            + " WHERE SemesterID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, semesterID);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String projectID = rs.getString("ProjectID");
                    String projectName = rs.getString("ProjectName");
                    String projectDescription = rs.getString("ProjectDescription");
                    String projectImage = rs.getString("ProjectImage");
                    float projectScore = Float.parseFloat(rs.getString("ProjectScore"));
                    String majorID = rs.getString("MajorID");
                    
                    projectList.add(new ProjectDTO(projectID, projectName, projectDescription, projectImage, projectScore, majorID, semesterID));
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
        
        return projectList;
    }
    
    public List<String> getAllProjectIDBySemester(String semesterID) throws SQLException {
        List<String> projectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT ProjectID "
                            + " FROM Projects "
                            + " WHERE SemesterID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, semesterID);
                rs = stm.executeQuery();
                
                while (rs.next()) {                                     
                    projectList.add(rs.getString("ProjectID"));
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
        
        return projectList;
    }
    
    public boolean updateProject(ProjectDTO project) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Projects "
                            + " SET ProjectName=?, ProjectDescription=?, ProjectImage=?, ProjectScore=?, MajorID=?, SemesterID=? "
                            + " WHERE ProjectID=?";
                stm = conn.prepareStatement(sql);
                
                stm.setString(1, project.getProjectName());
                stm.setString(2, project.getProjectDescription());
                stm.setString(3, project.getProjectImage());
                stm.setFloat(4, project.getProjectScore());
                stm.setString(5, project.getMajorID());
                stm.setString(6, project.getSemesterID());
                stm.setString(7, project.getProjectID());
                
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
    
    public boolean deteleProject(String projectID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "DELETE Projects WHERE projectID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, projectID);
                
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
    
    public List<ProjectDTO> getProjectForSelect() throws SQLException {
        List<ProjectDTO> projectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT ProjectID, ProjectName "
                            + " FROM Projects ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String projectID = rs.getString("ProjectID");
                    String projectName = rs.getString("ProjectName");
                    
                    
                    projectList.add(new ProjectDTO(projectID, projectName));
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
        
        return projectList;
    }
    
    public ProjectDTO getProject(String projectID) throws SQLException {
        ProjectDTO project = new ProjectDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT ProjectName, ProjectDescription, ProjectImage, ProjectScore, SemesterID "
                            + " FROM Projects "
                            + " WHERE ProjectID=? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, projectID);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String projectName = rs.getString("ProjectName");
                    String projectDes = rs.getString("ProjectDescription");
                    String projectImage = rs.getString("ProjectImage");
                    String projectScore = rs.getString("ProjectScore");
                    String semesterID = rs.getString("SemesterID");
                    
                    project = new ProjectDTO(projectID, projectName, projectDes, projectImage, Float.parseFloat(projectScore), "", semesterID);
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
        
        return project;
    }
    
    public List<ProjectDTO> getTop10Project() throws SQLException {
        List<ProjectDTO> projectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT TOP 10 ProjectID, ProjectName, ProjectDescription, ProjectImage "
                            + " FROM Projects "
                            + " ORDER BY ProjectScore DESC";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String projectID = rs.getString("ProjectID");
                    String projectName = rs.getString("ProjectName");
                    String projectDescription = rs.getString("ProjectDescription");
                    String projectImage = rs.getString("ProjectImage");
                    
                    projectList.add(new ProjectDTO(projectID, projectName, projectDescription, projectImage, 0, "", ""));
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
        
        return projectList;
    }
    
    public static void main(String[] args) throws SQLException {
        ProjectDAO dao = new ProjectDAO();
        
        System.out.println(dao.getAllProjectIDBySemester("1"));
    }
}


