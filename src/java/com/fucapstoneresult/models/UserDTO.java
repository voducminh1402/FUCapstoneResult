/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.models;

/**
 *
 * @author Asus
 */
public class UserDTO {

    private String userID;
    private String userName;
    private String dateCreated;
    private int userStatus;
    private String userImage;
    private String email;
    private String password;
    private String OTP;
    private int roleID;

    public UserDTO() {
    }

    public UserDTO(String userID, String userName, String dateCreated, int userStatus, String userImage, String email, String password, String OTP, int roleID) {
        this.userID = userID;
        this.userName = userName;
        this.dateCreated = dateCreated;
        this.userStatus = userStatus;
        this.userImage = userImage;
        this.email = email;
        this.password = password;
        this.OTP = OTP;
        this.roleID = roleID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(String dateCreated) {
        this.dateCreated = dateCreated;
    }

    public int getUserStatus() {
        return userStatus;
    }

    public void setUserStatus(int userStatus) {
        this.userStatus = userStatus;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOTP() {
        return OTP;
    }

    public void setOTP(String OTP) {
        this.OTP = OTP;
    }

    public int getRoleID() {
        return roleID;
    }

    public void setRoleID(int roleID) {
        this.roleID = roleID;
    }

    @Override
    public String toString() {
        return "UserDTO{" + "userID=" + userID + ", userName=" + userName + ", dateCreated=" + dateCreated + ", userStatus=" + userStatus + ", userImage=" + userImage + ", email=" + email + ", password=" + password + ", OTP=" + OTP + ", roleID=" + roleID + '}';
    }
  

}
