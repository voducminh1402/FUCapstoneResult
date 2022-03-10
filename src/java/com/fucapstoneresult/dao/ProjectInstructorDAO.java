/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.InstructorDTO;
import com.fucapstoneresult.models.InstructorDetailDTO;
import com.fucapstoneresult.models.ProjectDTO;
import com.fucapstoneresult.models.ProjectInstructorDTO;
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
public class ProjectInstructorDAO {

    public boolean insertProjectInstructor(ProjectInstructorDTO ProIns) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "INSERT INTO ProjectInstructor(ProjectID, InstructorID) "
                        + " VALUES (?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, ProIns.getProjectID());
                stm.setString(2, ProIns.getInstructorID());

                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public ProjectInstructorDTO getProjectInstructor(String projectID) throws SQLException {
        ProjectInstructorDTO proins = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT InstructorID "
                        + " FROM ProjectInstructor "
                        + " WHERE ProjectID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, projectID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    proins = new ProjectInstructorDTO(projectID, rs.getString("InstructorID"));
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

        return proins;
    }

    public boolean udpateProjectInstructor(ProjectInstructorDTO proins) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE ProjectInstructor "
                        + " SET InstructorID=? "
                        + " WHERE ProjectID=?";
                stm = conn.prepareStatement(sql);

                stm.setString(1, proins.getInstructorID());
                stm.setString(2, proins.getProjectID());

                check = stm.executeUpdate() > 0;

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public boolean deleteProjectInstructor(String projectID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "DELETE ProjectInstructor WHERE ProjectID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, projectID);

                check = stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return check;
    }

    public List<ProjectDTO> getAllProjectByInstructorID(String instructorID) throws SQLException {
        List<ProjectDTO> projectList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT ProjectID, ProjectName, ProjectDescription, ProjectImage, ProjectScore, MajorID, SemesterID "
                        + "FROM Projects "
                        + "WHERE ProjectID IN ("
                        + "						SELECT ProjectID "
                        + "						FROM ProjectInstructor "
                        + "						WHERE InstructorID = ? "
                        + "					)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, instructorID);
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

        return projectList;
    }

    public int getNumberProjectOfInstructor(String id) throws SQLException {
        int count = 0;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = " SELECT COUNT(ProjectID) AS Number FROM ProjectInstructor WHERE InstructorID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();

                while (rs.next()) {
                    count = rs.getInt("Number");
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

        return count;
    }

    public static void main(String[] args) throws SQLException {
        ProjectInstructorDAO dao = new ProjectInstructorDAO();
        System.out.println(dao.getNumberProjectOfInstructor("1"));

        InstructorDAO d = new InstructorDAO();
        ProjectInstructorDAO pDao = new ProjectInstructorDAO();
        List<InstructorDTO> instructorList = d.getAllInstructor();
        List<InstructorDetailDTO> list = new ArrayList<>();
        for (InstructorDTO o : instructorList) {
            list.add(new InstructorDetailDTO(o.getInstructorID(), o.getInstructorName(), o.getInstructorImage(), pDao.getNumberProjectOfInstructor(o.getInstructorID())));
        }
        for (InstructorDetailDTO instructorDetailDTO : list) {
            System.out.println(instructorDetailDTO);
        }
    }
}
