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
public class SemesterDTO {
    private String semesterID;
    private String semesterName;

    public SemesterDTO() {
    }

    public SemesterDTO(String semesterID, String semesterName) {
        this.semesterID = semesterID;
        this.semesterName = semesterName;
    }

    public String getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(String semesterID) {
        this.semesterID = semesterID;
    }

    public String getSemesterName() {
        return semesterName;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }
}
