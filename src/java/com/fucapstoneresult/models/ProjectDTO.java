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
public class ProjectDTO {
    private String projectID;
    private String projectName;
    private String projectDescription;
    private String projectImage;
    private float projectScore;
    private String majorID;
    private String semesterID;
    private String teamID;
    private String instructorID;
    private String postID;

    public ProjectDTO() {
    }

    public ProjectDTO(String projectID, String projectName, String projectDescription, String projectImage, float projectScore, String majorID, String semesterID, String teamID, String instructorID, String postID) {
        this.projectID = projectID;
        this.projectName = projectName;
        this.projectDescription = projectDescription;
        this.projectImage = projectImage;
        this.projectScore = projectScore;
        this.majorID = majorID;
        this.semesterID = semesterID;
        this.teamID = teamID;
        this.instructorID = instructorID;
        this.postID = postID;
    }

    public String getProjectID() {
        return projectID;
    }

    public void setProjectID(String projectID) {
        this.projectID = projectID;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public String getProjectImage() {
        return projectImage;
    }

    public void setProjectImage(String projectImage) {
        this.projectImage = projectImage;
    }

    public float getProjectScore() {
        return projectScore;
    }

    public void setProjectScore(float projectScore) {
        this.projectScore = projectScore;
    }

    public String getMajorID() {
        return majorID;
    }

    public void setMajorID(String majorID) {
        this.majorID = majorID;
    }

    public String getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(String semesterID) {
        this.semesterID = semesterID;
    }

    public String getTeamID() {
        return teamID;
    }

    public void setTeamID(String teamID) {
        this.teamID = teamID;
    }

    public String getInstructorID() {
        return instructorID;
    }

    public void setInstructorID(String instructorID) {
        this.instructorID = instructorID;
    }

    public String getPostID() {
        return postID;
    }

    public void setPostID(String postID) {
        this.postID = postID;
    }
    
    
}
