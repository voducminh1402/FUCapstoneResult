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
public class JsonSlideDTO {
    private String NameSlide;
    private String ImageSlide;
    private String DateSlide;

    public JsonSlideDTO() {
    }

    public JsonSlideDTO(String NameSlide, String ImageSlide, String DateSlide) {
        this.NameSlide = NameSlide;
        this.ImageSlide = ImageSlide;
        this.DateSlide = DateSlide;
    }
    
    public String getNameSlide() {
        return NameSlide;
    }

    public void setNameSlide(String NameSlide) {
        this.NameSlide = NameSlide;
    }

    public String getImageSlide() {
        return ImageSlide;
    }

    public void setImageSlide(String ImageSlide) {
        this.ImageSlide = ImageSlide;
    }

    public String getDateSlide() {
        return DateSlide;
    }

    public void setDateSlide(String DateSlide) {
        this.DateSlide = DateSlide;
    }
}
