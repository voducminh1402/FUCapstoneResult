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
public class PostCommentDTO {
    private String postID;
    private String postTitle;
    private String postImage;
    private int upvote;
    private int numOfComment;

    public PostCommentDTO(String postID, String postTitle, String postImage, int upvote, int numOfComment) {
        this.postID = postID;
        this.postTitle = postTitle;
        this.postImage = postImage;
        this.upvote = upvote;
        this.numOfComment = numOfComment;
    }

    public String getPostID() {
        return postID;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public String getPostImage() {
        return postImage;
    }

    public int getUpvote() {
        return upvote;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public void setPostImage(String postImage) {
        this.postImage = postImage;
    }

    public void setUpvote(int upvote) {
        this.upvote = upvote;
    }

    public int getNumOfComment() {
        return numOfComment;
    }

    public void setNumOfComment(int numOfComment) {
        this.numOfComment = numOfComment;
    }
    
    
}
