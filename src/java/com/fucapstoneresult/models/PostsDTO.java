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
    private String postDescription;
    private String postImage;
    private String lastEditedUser;
    private int upvote;
    private String poPostID;
    private int postStatusID;

    public PostsDTO() {
    }

    public PostsDTO(String postID, String postTitle, String postDate, String postAuthor, String postDescription, String postImage, String lastEditedUser, int upvote, String poPostID, int postStatusID) {
        this.postID = postID;
        this.postTitle = postTitle;
        this.postDate = postDate;
        this.postAuthor = postAuthor;
        this.postDescription = postDescription;
        this.postImage = postImage;
        this.lastEditedUser = lastEditedUser;
        this.upvote = upvote;
        this.poPostID = poPostID;
        this.postStatusID = postStatusID;
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

    public String getPostDescription() {
        return postDescription;
    }

    public void setPostDescription(String postDescription) {
        this.postDescription = postDescription;
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

    public String getPoPostID() {
        return poPostID;
    }

    public void setPoPostID(String poPostID) {
        this.poPostID = poPostID;
    }

    public int getPostStatusID() {
        return postStatusID;
    }

    public void setPostStatusID(int postStatusID) {
        this.postStatusID = postStatusID;
    }
    
}
