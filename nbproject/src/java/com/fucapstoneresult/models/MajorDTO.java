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
public class MajorDTO {
    private String majorID;
    private String majorName;
    private String majorImage;

    public MajorDTO() {
    }

    public MajorDTO(String majorID, String majorName, String majorImage) {
        this.majorID = majorID;
        this.majorName = majorName;
        this.majorImage = majorImage;
    }

    public String getMajorID() {
        return majorID;
    }

    public void setMajorID(String majorID) {
        this.majorID = majorID;
    }

    public String getMajorName() {
        return majorName;
    }

    public void setMajorName(String majorName) {
        this.majorName = majorName;
    }

    public String getMajorImage() {
        return majorImage;
    }

    public void setMajorImage(String majorImage) {
        this.majorImage = majorImage;
    }
    
    
}
