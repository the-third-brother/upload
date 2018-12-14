package com.gdufe.entity;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class Entry {
    private int id;
    private Category category;
    private String title;
    private String summary;
    private String uploadUser;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getUploadUser() {
        return uploadUser;
    }

    public void setUploadUser(String uploadUser) {
        this.uploadUser = uploadUser;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    @Override
    public String toString() {
        return "Entry{" +
                "id=" + id +
                ", category=" + category +
                ", title='" + title + '\'' +
                ", summary='" + summary + '\'' +
                ", uploadUser='" + uploadUser + '\'' +
                ", createDate=" + createDate +
                '}';
    }
}
