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
public class InstructorDTO {
    private String instructorID;
    private String instructorName;
    private String instructorImage;
    private String projectID;
    
    public InstructorDTO() {
    }

    public InstructorDTO(String instructorID, String instructorName, String instructorImage, String projectID) {
        this.instructorID = instructorID;
        this.instructorName = instructorName;
        this.instructorImage = instructorImage;
        this.projectID = projectID;
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

    public String getProjectID() {
        return projectID;
    }

    public void setProjectID(String projectID) {
        this.projectID = projectID;
    }

    
    
    
}
