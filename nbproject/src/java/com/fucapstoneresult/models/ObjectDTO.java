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
public class ObjectDTO {
    private String id;
    private String email;
    private String name;
    private String image;
    private String team;

    public ObjectDTO() {
    }

    public ObjectDTO(String id, String email, String name, String image, String team) {
        this.id = id;
        this.email = email;
        this.name = name;
        this.image = image;
        this.team = team;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    @Override
    public String toString() {
        return "ObjectDTO{" + "id=" + id + ", email=" + email + ", name=" + name + ", image=" + image + ", team=" + team + '}';
    }
}
