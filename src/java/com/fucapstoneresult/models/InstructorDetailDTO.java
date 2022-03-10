/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.models;

/**
 *
 * @author HP
 */
public class InstructorDetailDTO {
    private String instructorID;
    private String instructorName;
    private String instructorImage;
    private int number;

    public InstructorDetailDTO() {
    }

    public InstructorDetailDTO(String instructorID, String instructorName, String instructorImage, int number) {
        this.instructorID = instructorID;
        this.instructorName = instructorName;
        this.instructorImage = instructorImage;
        this.number = number;
    }

    public String getInstructorID() {
        return instructorID;
    }

    public void setInstructorID(String instructorID) {
        this.instructorID = instructorID;
    }

    public String getInstructorName() {
        return instructorName;
    }

    public void setInstructorName(String instructorName) {
        this.instructorName = instructorName;
    }

    public String getInstructorImage() {
        return instructorImage;
    }

    public void setInstructorImage(String instructorImage) {
        this.instructorImage = instructorImage;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "InstructorDetailDTO{" + "instructorID=" + instructorID + ", instructorName=" + instructorName + ", instructorImage=" + instructorImage + ", number=" + number + '}';
    }
    
}
