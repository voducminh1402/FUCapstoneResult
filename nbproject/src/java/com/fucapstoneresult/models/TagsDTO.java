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
public class TagsDTO {
    private String PostID;
    private String TagDetailID;

    public TagsDTO() {
    }

    public TagsDTO(String PostID, String TagDetailID) {
        this.PostID = PostID;
        this.TagDetailID = TagDetailID;
    }

    public String getPostID() {
        return PostID;
    }

    public void setPostID(String PostID) {
        this.PostID = PostID;
    }

    public String getTagdetailID() {
        return TagDetailID;
    }

    public void setTagdetailID(String TagdetailID) {
        this.TagDetailID = TagdetailID;
    }

    @Override
    public String toString() {
        return PostID +" | "+ TagDetailID; //To change body of generated methods, choose Tools | Templates.
    }
}
