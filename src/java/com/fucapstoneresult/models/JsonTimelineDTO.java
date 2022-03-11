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
public class JsonTimelineDTO {
    private String NameTimeline;
    private String DateTimeline;
    private String Team;

    public JsonTimelineDTO() {
    }

    public JsonTimelineDTO(String NameTimeline, String DateTimeline, String Team) {
        this.NameTimeline = NameTimeline;
        this.DateTimeline = DateTimeline;
        this.Team = Team;
    }


    public String getNameTimeline() {
        return NameTimeline;
    }

    public void setNameTimeline(String NameTimeline) {
        this.NameTimeline = NameTimeline;
    }

    public String getDateTimeline() {
        return DateTimeline;
    }

    public void setDateTimeline(String DateTimeline) {
        this.DateTimeline = DateTimeline;
    }

    public String getTeam() {
        return Team;
    }

    public void setTeam(String Team) {
        this.Team = Team;
    }
}
