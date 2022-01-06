/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.models;

/**
 *
 * @author PhongVu
 */
public class PostsDTO {
    
    private String PostID;
    private String PostTitle;
    private String PostDate;
    private String PostAuthor;
    private String PostDescription;
    private String PostImage;
    private String LastEditedUser;

    public PostsDTO() {
    }

    public PostsDTO(String PostID, String PostTitle, String PostDate, String PostAuthor, String PostDescription, String PostImage, String LastEditedUser) {
        this.PostID = PostID;
        this.PostTitle = PostTitle;
        this.PostDate = PostDate;
        this.PostAuthor = PostAuthor;
        this.PostDescription = PostDescription;
        this.PostImage = PostImage;
        this.LastEditedUser = LastEditedUser;
    }

    public String getPostID() {
        return PostID;
    }

    public void setPostID(String PostID) {
        this.PostID = PostID;
    }

    public String getPostTitle() {
        return PostTitle;
    }

    public void setPostTitle(String PostTitle) {
        this.PostTitle = PostTitle;
    }

    public String getPostDate() {
        return PostDate;
    }

    public void setPostDate(String PostDate) {
        this.PostDate = PostDate;
    }

    public String getPostAuthor() {
        return PostAuthor;
    }

    public void setPostAuthor(String PostAuthor) {
        this.PostAuthor = PostAuthor;
    }

    public String getPostDescription() {
        return PostDescription;
    }

    public void setPostDescription(String PostDescription) {
        this.PostDescription = PostDescription;
    }

    public String getPostImage() {
        return PostImage;
    }

    public void setPostImage(String PostImage) {
        this.PostImage = PostImage;
    }

    public String getLastEditedUser() {
        return LastEditedUser;
    }

    public void setLastEditedUser(String LastEditedUser) {
        this.LastEditedUser = LastEditedUser;
    }
    
    
    
    
}
