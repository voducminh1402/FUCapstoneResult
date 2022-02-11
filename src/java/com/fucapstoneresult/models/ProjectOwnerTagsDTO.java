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
public class ProjectOwnerTagsDTO {
    private String poPostID;
    private String tagDetailID;

    public ProjectOwnerTagsDTO() {
    }

    public ProjectOwnerTagsDTO(String poPostID, String tagDetailID) {
        this.poPostID = poPostID;
        this.tagDetailID = tagDetailID;
    }

    public String getPoPostID() {
        return poPostID;
    }

    public void setPoPostID(String poPostID) {
        this.poPostID = poPostID;
    }

    public String getTagDetailID() {
        return tagDetailID;
    }

    public void setTagDetailID(String tagDetailID) {
        this.tagDetailID = tagDetailID;
    }
    
}
