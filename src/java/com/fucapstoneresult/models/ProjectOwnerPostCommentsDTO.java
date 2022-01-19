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
public class ProjectOwnerPostCommentsDTO {
    private String commentID;
    private String poPostID;
    private String userID;
    private String commentDetail;
    private String commentTime;
    private int commentStatusID;

    public ProjectOwnerPostCommentsDTO() {
    }

    public ProjectOwnerPostCommentsDTO(String commentID, String popostID, String userID, String commentDetail, String commentTime, int commentStatusID) {
        this.commentID = commentID;
        this.poPostID = popostID;
        this.userID = userID;
        this.commentDetail = commentDetail;
        this.commentTime = commentTime;
        this.commentStatusID = commentStatusID;
    }

    public String getCommentID() {
        return commentID;
    }

    public void setCommentID(String commentID) {
        this.commentID = commentID;
    }

    public String getPopostID() {
        return poPostID;
    }

    public void setPopostID(String popostID) {
        this.poPostID = popostID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
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

    public int getCommentStatusID() {
        return commentStatusID;
    }

    public void setCommentStatusID(int commentStatusID) {
        this.commentStatusID = commentStatusID;
    }
    
    
}
