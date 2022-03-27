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
public class ContentDTO {
   private ContentIndexDTO contentIndex;
   private TimelineDTO timeline;
   private SlideDTO slide;

    public ContentDTO() {
    }

    public ContentDTO(ContentIndexDTO contentIndex, TimelineDTO timeline, SlideDTO slide) {
        this.contentIndex = contentIndex;
        this.timeline = timeline;
        this.slide = slide;
    }

    public ContentIndexDTO getContentIndex() {
        return contentIndex;
    }

    public void setContentIndex(ContentIndexDTO contentIndex) {
        this.contentIndex = contentIndex;
    }

    public TimelineDTO getTimeline() {
        return timeline;
    }

    public void setTimeline(TimelineDTO timeline) {
        this.timeline = timeline;
    }

    public SlideDTO getSlide() {
        return slide;
    }

    public void setSlide(SlideDTO slide) {
        this.slide = slide;
    }
   
   
            
}
