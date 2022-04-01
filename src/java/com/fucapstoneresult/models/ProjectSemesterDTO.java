/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.fucapstoneresult.models;

/**
 *
 * @author ADMIN
 */
public class ProjectSemesterDTO {
    private String prjID;
    private String prjName;
    private String semesterID;
    private String semesterName;

    public ProjectSemesterDTO(String prjID, String prjName, String semesterID, String semesterName) {
        this.prjID = prjID;
        this.prjName = prjName;
        this.semesterID = semesterID;
        this.semesterName = semesterName;
    }
    
    
    public ProjectSemesterDTO() {

    }

    public String getPrjID() {
        return prjID;
    }

    public String getPrjName() {
        return prjName;
    }

    public String getSemesterID() {
        return semesterID;
    }

    public String getSemesterName() {
        return semesterName;
    }

    public void setPrjID(String prjID) {
        this.prjID = prjID;
    }

    public void setPrjName(String prjName) {
        this.prjName = prjName;
    }

    public void setSemesterID(String semesterID) {
        this.semesterID = semesterID;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }
    
    
}
