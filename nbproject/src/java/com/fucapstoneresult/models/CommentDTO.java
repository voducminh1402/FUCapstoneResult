/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.models;

/**
 *
 * @author VODUCMINH
 */
public class CommentDTO {
    private String commentId;
    private String postId;
    private String userId;
    private String commentDetail;
    private String commentTime;
    private int commentStatusId;

    public CommentDTO() {
    }

    public CommentDTO(String commentId, String postId, String userId, String commentDetail, String commentTime, int commentStatusId) {
        this.commentId = commentId;
        this.postId = postId;
        this.userId = userId;
        this.commentDetail = commentDetail;
        this.commentTime = commentTime;
        this.commentStatusId = commentStatusId;
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

    public String getCommentDetail() {
        return commentDetail;
    }

    public void setCommentDetail(String commentDetail) {
        this.commentDetail = commentDetail;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public int getCommentStatusId() {
        return commentStatusId;
    }

    public void setCommentStatusId(int commentStatusId) {
        this.commentStatusId = commentStatusId;
    }

    @Override
    public String toString() {
        return "CommentDTO{" + "commentId=" + commentId + ", postId=" + postId + ", userId=" + userId + ", commentDetail=" + commentDetail + ", commentTime=" + commentTime + ", commentStatusId=" + commentStatusId + '}';
    }
    
    
}
