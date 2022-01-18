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

    public boolean addUser(UserDTO user) throws SQLException{
        boolean check = false;
        Connection con = null;
        PreparedStatement stm = null;
        int rs = 0;
        try {
            con = DBUtils.getConnection();
            if(con!=null){
                String sql = "INSERT INTO Users(UserID, UserName, DateCreated, UserStatusID, UserImage, Email, Password, OTP, RoleID) "
                        + " VALUES (?,?,?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, user.getUserID());
                stm.setString(2, user.getUserName());
                stm.setString(3, user.getDateCreated());
                stm.setInt(4, user.getUserStatus());
                stm.setString(5, user.getUserImage());
                stm.setString(6, user.getEmail());
                stm.setString(7, user.getPassword());
                stm.setString(8, user.getOTP());
                stm.setInt(9, user.getRoleID());
                rs = stm.executeUpdate();
                if(rs>0){
                    check = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(stm!=null)stm.close();
            if(con!=null)con.close();
        }
        return check;
    }
    
    public List<UserDTO> getAllUser() throws SQLException{
        List<UserDTO> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if(con!=null){
                String sql = " SELECT UserID, UserName, DateCreated, UserStatusID , UserImage, Email, Password , OTP , RoleID "
                        + " FROM Users ";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("UserName");
                    String dateCreated = rs.getString("DateCreated");
                    int userStatus = rs.getInt("UserStatusID");
                    String userImage = rs.getString("UserImage");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    String OTP = rs.getString("OTP");
                    int roleID = rs.getInt("RoleID");

                    list.add(new UserDTO(userID, userName, dateCreated, userStatus, userImage, email, password, OTP, roleID));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!=null)rs.close();
            if(stm!=null)stm.close();
            if(con!=null)con.close();
        }
        return list;
    }

    public List<UserDTO> getListUser(String search) throws SQLException {
        List<UserDTO> listUser = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {

                String sql = " SELECT UserID, UserName, DateCreated, UserStatusID , UserImage, Email, Password , OTP , RoleID "
                        + " FROM Users "
                        + " WHERE UserName like ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, "%" + search + "%");
                rs = stm.executeQuery();

                while (rs.next()) {
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("UserName");
                    String dateCreated = rs.getString("DateCreated");
                    int userStatus = rs.getInt("UserStatusID");
                    String userImage = rs.getString("UserImage");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    String OTP = rs.getString("OTP");
                    int roleID = rs.getInt("RoleID");

                    listUser.add(new UserDTO(userID, userName, dateCreated, userStatus, userImage, email, password, OTP, roleID));
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
                String sql = " UPDATE Users SET UserName=?, DateCreated=? ,UserStatusID=? , UserImage=? ,  Email=? , Password=? , OTP=? ,  RoleID=? "
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

    public UserDTO searchUserByID(String userID) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT UserID, UserName, DateCreated, UserStatusID , UserImage, Email, Password , OTP , RoleID "
                        + " FROM Users "
                        + " WHERE UserID = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, userID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String userName = rs.getString("UserName");
                    String dateCreated = rs.getString("DateCreated");
                    int userStatus = rs.getInt("UserStatusID");
                    String userImage = rs.getString("UserImage");
                    String email = rs.getString("Email");
                    String password = rs.getString("Password");
                    String OTP = rs.getString("OTP");
                    int roleID = rs.getInt("RoleID");
                    user = new UserDTO(userID, userName, dateCreated, userStatus, userImage, email, password, OTP, roleID);
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
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public UserDTO searchUserByEmail(String email) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT UserID, UserName, DateCreated, UserStatusID , UserImage, Email, Password , OTP , RoleID "
                        + " FROM Users "
                        + " WHERE Email = ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("UserName");
                    String dateCreated = rs.getString("DateCreated");
                    int userStatus = rs.getInt("UserStatusID");
                    String userImage = rs.getString("UserImage");
                    String password = rs.getString("Password");
                    String OTP = rs.getString("OTP");
                    int roleID = rs.getInt("RoleID");

                    user = new UserDTO(userID, userName, dateCreated, userStatus, userImage, email, password, OTP, roleID);
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
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public UserDTO checkLoginUser(String email, String password) throws SQLException {
        UserDTO user = null;
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT UserID, UserName, DateCreated, UserStatusID , UserImage, Email, Password , OTP , RoleID "
                        + " FROM Users "
                        + " WHERE Email = ? AND Password like ? ";
                stm = con.prepareStatement(sql);
                stm.setString(1, email);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("UserID");
                    String userName = rs.getString("UserName");
                    String dateCreated = rs.getString("DateCreated");
                    int userStatus = rs.getInt("UserStatusID");
                    String userImage = rs.getString("UserImage");
                    String OTP = rs.getString("OTP");
                    int roleID = rs.getInt("RoleID");

                    user = new UserDTO(userID, userName, dateCreated, userStatus, userImage, email, password, OTP, roleID);
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
            if (con != null) {
                con.close();
            }
        }
        return user;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        UserDAO dao = new UserDAO();
        String email = "anh@gmail.com";
        String password = "anh";
        UserDTO a = dao.searchUserByEmail(email);
        System.out.println(a);
    }
}
