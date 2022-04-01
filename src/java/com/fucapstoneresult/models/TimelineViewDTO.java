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
public class TimelineViewDTO {
    private String semesterName;
    private String semesterID;
    private int numberItem;

    public TimelineViewDTO() {
    }

    public TimelineViewDTO(String semesterID, String semesterName, int numberItem) {
        this.semesterName = semesterName;
        this.semesterID = semesterID;
        this.numberItem = numberItem;
    }

    public String getSemesterName() {
        return semesterName;
    }

    public void setSemesterName(String semesterName) {
        this.semesterName = semesterName;
    }

    public String getSemesterID() {
        return semesterID;
    }

    public void setSemesterID(String semesterID) {
        this.semesterID = semesterID;
    }

    public int getNumberItem() {
        return numberItem;
    }

    public void setNumberItem(int numberItem) {
        this.numberItem = numberItem;
    }

    
    
}
