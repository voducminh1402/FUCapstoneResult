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
    
    private String postID;
    private String postTitle;
    private String postDate;
    private String postAuthor;
    private String postContent;
    private String postImage;
    private String lastEditedUser;
    private int upvote;
    private int postStatusID;
    private String projectID;

    public PostsDTO() {
    }

    public PostsDTO(String postID, String postTitle, String postDate, String postAuthor, String postContent, String postImage, String lastEditedUser, int upvote, int postStatusID, String projectID) {
        this.postID = postID;
        this.postTitle = postTitle;
        this.postDate = postDate;
        this.postAuthor = postAuthor;
        this.postContent = postContent;
        this.postImage = postImage;
        this.lastEditedUser = lastEditedUser;
        this.upvote = upvote;
        this.postStatusID = postStatusID;
        this.projectID = projectID;
    }

    public String getPostID() {
        return postID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostDate() {
        return postDate;
    }

    public void setPostDate(String postDate) {
        this.postDate = postDate;
    }

    public String getPostAuthor() {
        return postAuthor;
    }

    public void setPostAuthor(String postAuthor) {
        this.postAuthor = postAuthor;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public String getPostImage() {
        return postImage;
    }

    public void setPostImage(String postImage) {
        this.postImage = postImage;
    }

    public String getLastEditedUser() {
        return lastEditedUser;
    }

    public void setLastEditedUser(String lastEditedUser) {
        this.lastEditedUser = lastEditedUser;
    }

    public int getUpvote() {
        return upvote;
    }

    public void setUpvote(int upvote) {
        this.upvote = upvote;
    }

    public int getPostStatusID() {
        return postStatusID;
    }

    public void setPostStatusID(int postStatusID) {
        this.postStatusID = postStatusID;
    }

    public String getProjectID() {
        return projectID;
    }

    public void setProjectID(String projectID) {
        this.projectID = projectID;
    }

   
    
}
