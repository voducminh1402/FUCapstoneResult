/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.models;

/**
 *
 * @author Nguuyennkt
 */
public class ProjectOwnerPostsDTO {
    private String popostID;
    private String popostTitle;
    private String popostDate;
    private String popostAuthorID;
    private String popostContent;
    private String popostImage;
    private String LastEditedUser;
    private int upvote;
    private int StatusID;
    private String postID;

    public ProjectOwnerPostsDTO(String popostID, String popostTitle, String popostDate, String popostAuthorID, String popostContent, String popostImage, String LastEditedUser, int upvote, int StatusID, String postID) {
        this.popostID = popostID;
        this.popostTitle = popostTitle;
        this.popostDate = popostDate;
        this.popostAuthorID = popostAuthorID;
        this.popostContent = popostContent;
        this.popostImage = popostImage;
        this.LastEditedUser = LastEditedUser;
        this.upvote = upvote;
        this.StatusID = StatusID;
        this.postID = postID;
    }
    
    public ProjectOwnerPostsDTO(){
    }                                                                       

    public String getPopostID() {
        return popostID;
    }

    public String getPopostTitle() {
        return popostTitle;
    }

    public String getPopostDate() {
        return popostDate;
    }

    public String getPopostAuthorID() {
        return popostAuthorID;
    }

    public String getPostID() {
        return postID;
    }

    public String getPopostContent() {
        return popostContent;
    }

    public String getPopostImage() {
        return popostImage;
    }

    public String getLastEditedUser() {
        return LastEditedUser;
    }

    public int getUpvote() {
        return upvote;
    }

    public int getStatusID() {
        return StatusID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public void setPopostID(String popostID) {
        this.popostID = popostID;
    }

    public void setPopostTitle(String popostTitle) {
        this.popostTitle = popostTitle;
    }

    public void setPopostDate(String popostDate) {
        this.popostDate = popostDate;
    }

    public void setPopostAuthorID(String popostAuthorID) {
        this.popostAuthorID = popostAuthorID;
    }

    public void setPopostContent(String popostContent) {
        this.popostContent = popostContent;
    }

    public void setPopostImage(String popostImage) {
        this.popostImage = popostImage;
    }

    public void setLastEditedUser(String LastEditedUser) {
        this.LastEditedUser = LastEditedUser;
    }

    public void setUpvote(int upvote) {
        this.upvote = upvote;
    }

    public void setStatusID(int StatusID) {
        this.StatusID = StatusID;
    }

    }
    
 
