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
public class TagDetailsDTO {
    private String TagDetailID;
    private String TagDetailName;

    public TagDetailsDTO() {
    }

    public TagDetailsDTO(String TagDetailID, String TagDetailName) {
        this.TagDetailID = TagDetailID;
        this.TagDetailName = TagDetailName;
    }

    public String getTagDetailID() {
        return TagDetailID;
    }

    public void setTagDetailID(String TagDetailID) {
        this.TagDetailID = TagDetailID;
    }

    public String getTagDetailName() {
        return TagDetailName;
    }

    public void setTagDetailName(String TagDetailName) {
        this.TagDetailName = TagDetailName;
    }
    
    
}
