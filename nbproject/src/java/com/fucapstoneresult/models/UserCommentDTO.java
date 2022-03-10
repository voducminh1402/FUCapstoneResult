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
public class UserCommentDTO {

    private String userName;
    private String email;
    private String commentDetail;
    private String postTitle;
    private int commentStatusId;
    private String commentTime;
    private String commentId;
    private String postId;
    private String userId;
    private String userImage;
    private String postID;
    private String isMainPost;

    public UserCommentDTO() {
    }

    public UserCommentDTO(String userName, String email, String commentDetail, String postTitle, int commentStatusId, String commentTime, String commentId, String postId, String userId, String userImage, String postID, String isMainPost) {
        this.userName = userName;
        this.email = email;
        this.commentDetail = commentDetail;
        this.postTitle = postTitle;
        this.commentStatusId = commentStatusId;
        this.commentTime = commentTime;
        this.commentId = commentId;
        this.postId = postId;
        this.userId = userId;
        this.userImage = userImage;
        this.postID = postID;
        this.isMainPost = isMainPost;
    }

    public UserCommentDTO(String commentId, String poPostId, String userId, String commentDetail, String commentTime, int commentStatusId) {
        this.commentId = commentId;
        this.postId = poPostId;
        this.userId = userId;
        this.commentDetail = commentDetail;
        this.commentTime = commentTime;
        this.commentStatusId = commentStatusId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCommentDetail() {
        return commentDetail;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    public void setCommentDetail(String commentDetail) {
        this.commentDetail = commentDetail;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public int getCommentStatusId() {
        return commentStatusId;
    }

    public void setCommentStatusId(int commentStatusId) {
        this.commentStatusId = commentStatusId;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getPostID() {
        return postID;
    }

    public String getIsMainPost() {
        return isMainPost;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public void setIsMainPost(String isMainPost) {
        this.isMainPost = isMainPost;
    }
    
    

}
