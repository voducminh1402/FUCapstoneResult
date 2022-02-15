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
public class ProjectOwnerCommentStatusesDTO {
    private String commentStatusID;
    private String commentStatusName;

    public ProjectOwnerCommentStatusesDTO() {
    }

    public ProjectOwnerCommentStatusesDTO(String commentStatusID, String commentStatusName) {
        this.commentStatusID = commentStatusID;
        this.commentStatusName = commentStatusName;
    }

    public String getCommentStatusID() {
        return commentStatusID;
    }

    public void setCommentStatusID(String commentStatusID) {
        this.commentStatusID = commentStatusID;
    }

    public String getCommentStatusName() {
        return commentStatusName;
    }

    public void setCommentStatusName(String commentStatusName) {
        this.commentStatusName = commentStatusName;
    }
    
}
