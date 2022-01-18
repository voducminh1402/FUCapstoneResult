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
public class ProjectOwnerTagDetailsDTO {
    private String tagDetailID;
    private String tagDetailName;

    public ProjectOwnerTagDetailsDTO() {
    }

    public ProjectOwnerTagDetailsDTO(String tagDetailID, String tagDetailName) {
        this.tagDetailID = tagDetailID;
        this.tagDetailName = tagDetailName;
    }

    public String getTagDetailID() {
        return tagDetailID;
    }

    public void setTagDetailID(String tagDetailID) {
        this.tagDetailID = tagDetailID;
    }

    public String getTagDetailName() {
        return tagDetailName;
    }

    public void setTagDetailName(String tagDetailName) {
        this.tagDetailName = tagDetailName;
    }
    
}
