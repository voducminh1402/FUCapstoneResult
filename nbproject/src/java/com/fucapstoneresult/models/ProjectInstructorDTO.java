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
public class ProjectInstructorDTO {
    private String projectID;
    private String instructorID;

    public ProjectInstructorDTO() {
    }

    public ProjectInstructorDTO(String projectID, String instructorID) {
        this.projectID = projectID;
        this.instructorID = instructorID;
    }

    public String getProjectID() {
        return projectID;
    }

    public void setProjectID(String projectID) {
        this.projectID = projectID;
    }

    public String getInstructorID() {
        return instructorID;
    }

    public void setInstructorID(String instructorID) {
        this.instructorID = instructorID;
    }
    
    
    
}
