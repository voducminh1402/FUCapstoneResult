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
    private String indexContent;
    private String timelineContent;
    private String slideContent;

    public ContentDTO() {
    }

    public ContentDTO(String indexContent, String timelineContent, String slideContent) {
        this.indexContent = indexContent;
        this.timelineContent = timelineContent;
        this.slideContent = slideContent;
    }

    public String getIndexContent() {
        return indexContent;
    }

    public void setIndexContent(String indexContent) {
        this.indexContent = indexContent;
    }

    public String getTimelineContent() {
        return timelineContent;
    }

    public void setTimelineContent(String timelineContent) {
        this.timelineContent = timelineContent;
    }

    public String getSlideContent() {
        return slideContent;
    }

    public void setSlideContent(String slideContent) {
        this.slideContent = slideContent;
    }
    
            
}
