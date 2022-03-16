/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.ProjectDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
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
    
    public List<ProjectDTO> getAllProjectByName(String projectName) throws SQLException {
        List<ProjectDTO> projectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            if (conn != null) {
                String sql = "SELECT ProjectID, ProjectName, ProjectDescription, ProjectImage, ProjectScore, MajorID, SemesterID "
                            + " FROM Projects "
                            + " WHERE ProjectName like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, projectName);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String projectID = rs.getString("ProjectID");
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
        ProjectDTO project = null;
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
                
                if (rs.next()) {
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
                String sql = "SELECT TOP 10 pr.ProjectID, ProjectName, ProjectDescription, ProjectImage " +
                            "FROM Projects pr, Posts p " +
                            "WHERE pr.ProjectID = p.ProjectID AND p.IsMainPost IS NOT NULL " +
                            "ORDER BY ProjectScore DESC";
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
    
    public List<ProjectDTO> getNearestProject() throws SQLException {
        List<ProjectDTO> projectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            LocalDate currentdate = LocalDate.now();
            String valueYear = "";
            
            if (currentdate.getMonthValue()>= 1 && currentdate.getMonthValue()<= 4) {
                valueYear = "Fall " + (currentdate.getYear() - 1);
            }
            else if (currentdate.getMonthValue()>= 5 && currentdate.getMonthValue() <= 8){
                valueYear = "Spring " + currentdate.getYear();
            }
            else if (currentdate.getMonthValue()>= 9 && currentdate.getMonthValue() <= 12) {
                valueYear = "Summer " + currentdate.getYear();
            }
            
            if (conn != null) {
                String sql = "SELECT TOP 4 * " +
                              "FROM Projects " +
                                    "WHERE SemesterID = (SELECT SemesterID " +
                                    "					FROM Semesters " +
                                    "					WHERE SemesterName = ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, valueYear);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String projectID = rs.getString("ProjectID");
                    String projectName = rs.getString("ProjectName");
                    String projectDescription = rs.getString("ProjectDescription");
                    String projectImage = rs.getString("ProjectImage");
                    String majorID = rs.getString("MajorID");
                    String semesterID = rs.getString("SemesterID");
                    
                    projectList.add(new ProjectDTO(projectID, projectName, projectDescription, projectImage, 0, majorID, semesterID));
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
        
        if (projectList.size() == 4) {
            return projectList;
        }
        else {
            return new ArrayList<>();
        }
    }
    
    public ProjectDTO getNearestProjectElement() throws SQLException {
        List<ProjectDTO> projectList = new ArrayList<>();
        ProjectDTO project = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            conn = DBUtils.getConnection();
            
            LocalDate currentdate = LocalDate.now();
            String valueYear = "";
            
            if (currentdate.getMonthValue()>= 1 && currentdate.getMonthValue()<= 4) {
                valueYear = "Fall " + (currentdate.getYear() - 1);
            }
            else if (currentdate.getMonthValue()>= 5 && currentdate.getMonthValue() <= 8){
                valueYear = "Spring " + currentdate.getYear();
            }
            else if (currentdate.getMonthValue()>= 9 && currentdate.getMonthValue() <= 12) {
                valueYear = "Summer " + currentdate.getYear();
            }
            
            if (conn != null) {
                String sql = "SELECT TOP 4 * " +
                              "FROM Projects " +
                                    "WHERE SemesterID = (SELECT SemesterID " +
                                    "					FROM Semesters " +
                                    "					WHERE SemesterName = ?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, valueYear);
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String projectID = rs.getString("ProjectID");
                    String projectName = rs.getString("ProjectName");
                    String projectDescription = rs.getString("ProjectDescription");
                    String projectImage = rs.getString("ProjectImage");                    
                    String semesterID = rs.getString("SemesterID");
                    
                    projectList.add(new ProjectDTO(projectID, projectName, projectDescription, projectImage, 0, "", semesterID));
                }
                project = projectList.get(0);
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
    
    public static void main(String[] args) throws SQLException {
        ProjectDAO dao = new ProjectDAO();
        
        System.out.println(dao.getNearestProjectElement().getSemesterID());
    }
}


