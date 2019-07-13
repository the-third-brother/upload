package com.gdufe.entity;

import java.util.Date;

public class SoftwareDetails {
//    name	varchar
//    category	int
//    size	double
//    statement	varchar
//    url	varchar
//    uploader	varchar
//    upload_time	datetime
//    download	int
    private int sId;
    private String name;
    private int cId;
    private String size;
    private  String statement;
    private String url;
    private String uploader;
    private Date uploadTime;
    private int download;

    public int getsId() {
        return sId;
    }

    public void setsId(int sId) {
        this.sId = sId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getStatement() {
        return statement;
    }

    public void setStatement(String statement) {
        this.statement = statement;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUploader() {
        return uploader;
    }

    public void setUploader(String uploader) {
        this.uploader = uploader;
    }

    public Date getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(Date uploadTime) {
        this.uploadTime = uploadTime;
    }

    public int getDownload() {
        return download;
    }

    public void setDownload(int download) {
        this.download = download;
    }

    @Override
    public String toString() {
        return "SoftwareDetails{" +
                "name='" + name + '\'' +
                ", cId=" + cId +
                ", size=" + size +
                ", statement='" + statement + '\'' +
                ", url='" + url + '\'' +
                ", uploader='" + uploader + '\'' +
                ", uploadTime=" + uploadTime +
                ", download=" + download +
                '}';
    }
}
