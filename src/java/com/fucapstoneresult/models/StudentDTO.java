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
public class StudentDTO {
    private String studentID;
    private String studentName;
    private String majorID;
    private String studentImage;
    private String teamID;

    public StudentDTO() {
    }

    public StudentDTO(String studentID, String studentName, String majorID, String studentImage, String teamID) {
        this.studentID = studentID;
        this.studentName = studentName;
        this.majorID = majorID;
        this.studentImage = studentImage;
        this.teamID = teamID;
    }

    public String getStudentID() {
        return studentID;
    }

    public void setStudentID(String studentID) {
        this.studentID = studentID;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getMajorID() {
        return majorID;
    }

    public void setMajorID(String majorID) {
        this.majorID = majorID;
    }

    public String getStudentImage() {
        return studentImage;
    }

    public void setStudentImage(String studentImage) {
        this.studentImage = studentImage;
    }

    public String getTeamID() {
        return teamID;
    }

    public void setTeamID(String teamID) {
        this.teamID = teamID;
    }

    @Override
    public String toString() {
        return "StudentDTO{" + "studentID=" + studentID + ", studentName=" + studentName + ", majorID=" + majorID + ", studentImage=" + studentImage + ", teamID=" + teamID + '}';
    }

}
