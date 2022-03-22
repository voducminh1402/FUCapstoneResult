/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.InstructorDTO;
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
public class InstructorDAO {

    public boolean insertInstructor(InstructorDTO instructor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "INSERT INTO Instructors(InstructorID, InstructorName, InstructorImage) "
                        + " VALUES (?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, instructor.getInstructorID());
                stm.setString(2, instructor.getInstructorName());
                stm.setString(3, instructor.getInstructorImage());

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

    public boolean updateInstructor(InstructorDTO instructor) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Instructors "
                        + " SET InstructorName=?, InstructorImage=? "
                        + " WHERE InstructorID=?";
                stm = conn.prepareStatement(sql);

                stm.setString(1, instructor.getInstructorName());
                stm.setString(2, instructor.getInstructorImage());
                stm.setString(3, instructor.getInstructorID());

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
    
    public boolean updateInstructor(String projectID, String instructorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE ProjectInstructor "
                        + " SET ProjectID=?, InstructorID=? ";
                stm = conn.prepareStatement(sql);

                stm.setString(1, projectID);
                stm.setString(2, instructorID);

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

    public boolean deleteInstructor(String instructorID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "DELETE Instructors WHERE InstructorID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, instructorID);

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

    public List<InstructorDTO> getAllInstructor() throws SQLException {
        List<InstructorDTO> List = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT InstructorID, InstructorName, InstructorImage "
                        + " FROM Instructors ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String instructorID = rs.getString("InstructorID");
                    String instructorName = rs.getString("InstructorName");
                    String instructorImage = rs.getString("InstructorImage");

                    List.add(new InstructorDTO(instructorID, instructorName, instructorImage));
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

        return List;
    }
    
    public List<InstructorDTO> getAllInstructorByName(String name) throws SQLException {
        List<InstructorDTO> List = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT InstructorID, InstructorName, InstructorImage "
                        + " FROM Instructors "
                        + " WHERE InstructorName like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1,"%" + name + "%");
                rs = stm.executeQuery();

                while (rs.next()) {
                    String instructorID = rs.getString("InstructorID");
                    String instructorName = rs.getString("InstructorName");
                    String instructorImage = rs.getString("InstructorImage");

                    List.add(new InstructorDTO(instructorID, instructorName, instructorImage));
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

        return List;
    }

    public InstructorDTO getInstructorByID(String instructorID) throws SQLException {
        InstructorDTO instructor = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT InstructorName, InstructorImage "
                        + " FROM Instructors "
                        + " WHERE InstructorID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, instructorID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    String instructorName = rs.getString("InstructorName");
                    String instructorImage = rs.getString("InstructorImage");
                    instructor = new InstructorDTO(instructorID, instructorName, instructorImage);
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

        return instructor;
    }
    public static void main(String[] args) throws SQLException {
        InstructorDAO dao = new InstructorDAO();
        List<InstructorDTO> list = dao.getAllInstructorByName("a");
        for (InstructorDTO instructorDTO : list) {
            System.out.println(instructorDTO);
        }
    }
}
