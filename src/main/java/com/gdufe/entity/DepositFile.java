package com.gdufe.entity;

public class DepositFile {

    private int fId;
    private String name;
    private String size;
    private String url;

    public int getfId() {
        return fId;
    }

    public void setfId(int fId) {
        this.fId = fId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        return "DepositFile{" +
                "fId=" + fId +
                ", name='" + name + '\'' +
                ", size='" + size + '\'' +
                ", url='" + url + '\'' +
                '}';
    }
}
