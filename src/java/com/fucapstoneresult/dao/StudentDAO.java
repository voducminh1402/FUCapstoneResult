/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

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
public class StudentDAO {

    public boolean insertStudent(StudentDTO student) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "INSERT INTO Students(StudentID, StudentName, MajorID, StudentImage, TeamID) "
                        + " VALUES (?,?,?,?,?)";
                stm = conn.prepareStatement(sql);
                stm.setString(1, student.getStudentID());
                stm.setString(2, student.getStudentName());
                stm.setString(3, student.getMajorID());
                stm.setString(4, student.getStudentImage());
                stm.setString(5, student.getTeamID());

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

    public StudentDTO getStudent(String studentID) throws SQLException {
        StudentDTO student = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT StudentName, MajorID, StudentImage, TeamID "
                        + " FROM Students "
                        + " WHERE StudentID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, studentID);
                rs = stm.executeQuery();

                if (rs.next()) {
                    student = new StudentDTO(studentID, rs.getString("StudentName"), rs.getString("MajorID"), rs.getString("StudentImage"), rs.getString("TeamID"));
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

        return student;
    }

    public boolean updateStudent(StudentDTO student) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "UPDATE Students "
                        + " SET StudentName=?, MajorID=?, StudentImage=?, TeamID=? "
                        + " WHERE StudentID=?";
                stm = conn.prepareStatement(sql);

                stm.setString(1, student.getStudentName());
                stm.setString(2, student.getMajorID());
                stm.setString(3, student.getStudentImage());
                stm.setString(4, student.getTeamID());
                stm.setString(5, student.getStudentID());

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

    public boolean deleteStudent(String studentID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "DELETE Students WHERE StudentID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, studentID);

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

    public List<StudentDTO> getListStudentWithTeam(String teamId) throws SQLException {
        List<StudentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT StudentID, StudentName, MajorID, StudentImage "
                        + " FROM Students "
                        + " WHERE TeamID=?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, teamId);
                rs = stm.executeQuery();

                while (rs.next()) {
                    list.add(new StudentDTO(rs.getString("StudentID"), rs.getString("StudentName"), rs.getString("MajorID"), rs.getString("StudentImage"), teamId));
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

        return list;
    }

    public List<StudentDTO> getListStudent() throws SQLException {
        List<StudentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT StudentID, StudentName, MajorID, StudentImage, TeamID "
                        + " FROM Students ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    list.add(new StudentDTO(rs.getString("StudentID"), rs.getString("StudentName"), rs.getString("MajorID"), rs.getString("StudentImage"), rs.getString("TeamID")));
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

        return list;
    }
    
    public List<StudentDTO> getListStudentInStudentPage() throws SQLException {
        List<StudentDTO> list = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        MajorDAO dao = new MajorDAO();

        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = "SELECT StudentID, StudentName, MajorID, StudentImage, TeamID "
                        + " FROM Students ";
                stm = conn.prepareStatement(sql);
                rs = stm.executeQuery();

                while (rs.next()) {
                    String majorName = dao.getMajor(rs.getString("MajorID")).getMajorName();
                    list.add(new StudentDTO(rs.getString("StudentID"), rs.getString("StudentName"), majorName, rs.getString("StudentImage"), rs.getString("TeamID")));
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

        return list;
    }

    public List<StudentDTO> getStudentbyName(String studentName) throws SQLException {
        studentName = studentName.toLowerCase();
        StudentDTO student = null;
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        List<StudentDTO> list = new ArrayList<>();
        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = " SELECT StudentID, StudentName , MajorID, StudentImage, TeamID"
                        + " FROM Students "
                        + " WHERE StudentName like ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + studentName + "%");
                rs = stm.executeQuery();

                while (rs.next()) {
                    //(String studentID, String studentName, String majorID, String studentImage, String teamID)
                    student = new StudentDTO(rs.getString("StudentID"), rs.getString("StudentName"), rs.getString("MajorID"), rs.getString("StudentImage"), rs.getString("TeamID"));
                    list.add(student);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return list;
    }

    public StudentDTO getStudentById(String id) throws SQLException {
        StudentDTO stu = new StudentDTO();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();

            if (conn != null) {
                String sql = " SELECT StudentID, StudentName , MajorID, StudentImage, TeamID"
                        + " FROM Students "
                        + " WHERE StudentID = ? ";
                stm = conn.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();

                while (rs.next()) {
                    stu = new StudentDTO(rs.getString("StudentID"), rs.getString("StudentName"), rs.getString("MajorID"), rs.getString("StudentImage"), rs.getString("TeamID"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                conn.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return stu;
    }

    public static void main(String[] args) throws SQLException {
        StudentDAO dao = new StudentDAO();
        List<StudentDTO> list = dao.getStudentbyName("n");
        for (StudentDTO studentDTO : list) {
            System.out.println(studentDTO);
        }
    }
}
