package com.gdufe.entity;

public class Category {
    private int cId;
    private String name;

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Category{" +
                "cId=" + cId +
                ", name='" + name + '\'' +
                '}';
    }
}
