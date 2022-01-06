/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.dao;

import com.fucapstoneresult.models.UserDTO;
import com.fucapstoneresult.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Asus
 */
public class UserDAO {

    public boolean createUser(UserDTO User) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO Users(UserID, UserName, DateCreated, UserStatus , UserImage, Email, Password , OTP , RoleID)"
                        + " VALUES(?,?,?,?,?,?,?,?,?)";
                stm = conn.prepareCall(sql);
                stm.setString(1, User.getUserID());
                stm.setString(2, User.getUserName());
                stm.setString(3, User.getDateCreated());
                stm.setInt(4, User.getUserStatus());
                stm.setString(5, User.getUserImage());
                stm.setString(6, User.getEmail());
                stm.setString(7, User.getPassword());
                stm.setString(8, User.getOTP());
                stm.setInt(9, User.getRoleID());
                check = stm.executeUpdate() > 0 ? true : false;
            }

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
    
    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                String sql = " SELECT UserID, UserName, DateCreated, UserStatus , UserImage, Email, Password , OTP , RoleID "
                        + " FROM Users "
                        + " WHERE UserName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%"+search+"%");
                rs = stm.executeQuery();
                
                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("userName");
                    String dateCreated = rs.getString("dateCreated");
                    String userStatus = rs.getString("userStatus");
                    String userImage = rs.getString("userImage");
                    String email= rs.getString("email");
                    String password = rs.getString("password");
                    String OTP = rs.getString("OTP");
                    int roleID = rs.getInt("roleID");
                   
                    listUser.add(new UserDTO(userID, userName, dateCreated, roleID, userImage, email, password, OTP, roleID));
                }
            }
        } catch (Exception e) {

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
        return listUser;

    }
    
    
    
    public boolean updateUser(UserDTO User) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Users SET UserName=?, DateCreated=? ,UserStatus=? , UserImage=? ,  Email=? , Password=? , OTP=? ,  RoleID=? "
                        + " WHERE UserID=? ";
                stm = conn.prepareCall(sql);
                stm.setString(1, User.getUserName());
                stm.setString(2, User.getDateCreated());
                stm.setInt(3, User.getUserStatus());
                stm.setString(4, User.getUserImage());
                stm.setString(5, User.getEmail());
                stm.setString(6, User.getPassword());
                stm.setString(7, User.getOTP());
                stm.setInt(8, User.getRoleID());
                stm.setString(9, User.getUserID());
                check = stm.executeUpdate() > 0 ? true : false;
            }

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
    
   
    public boolean deleteUser(String userID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement stm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = " UPDATE Users "
                        + " SET UserStatus = ?"
                        + " WHERE UserID=?";
                stm = conn.prepareStatement(sql);
                stm.setInt(1, 0);
                stm.setString(2, userID);
                check = stm.executeUpdate() > 0 ? true : false;
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
    
    
}
