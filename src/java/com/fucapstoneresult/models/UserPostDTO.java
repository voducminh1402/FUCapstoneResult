/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.models;

/**
 *
 * @author ADMIN
 */
public class UserPostDTO {
    private String userID;
    private String postID;
    private String userName;
    private String postName;
    private String postDate;
    private String postStatusID;
    private String userEmail;
    
    public UserPostDTO(){
        
    }

    public UserPostDTO(String userID, String postID, String userName, String postName, String postDate, String postStatusID, String userEmail) {
        this.userID = userID;
        this.postID = postID;
        this.userName = userName;
        this.postName = postName;
        this.postDate = postDate;
        this.postStatusID = postStatusID;
        this.userEmail = userEmail;
    }

    public String getUserID() {
        return userID;
    }

    public String getPostID() {
        return postID;
    }

    public String getUserName() {
        return userName;
    }

    public String getPostName() {
        return postName;
    }

    public String getPostDate() {
        return postDate;
    }

    public String getPostStatusID() {
        return postStatusID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public void setPostStatusID(String postStatusID) {
        this.postStatusID = postStatusID;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
    
    
}
