package com.vnk.jspdemo.Model;

public class Child {

    private Integer id;

    private String fatherKey;

    private String childname;

    private Integer childage;

    public Child() {
    }

    public Child(Integer id, String fatherKey, String childname, Integer childage) {
        this.id = id;
        this.fatherKey = fatherKey;
        this.childname = childname;
        this.childage = childage;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFatherKey() {
        return fatherKey;
    }

    public void setFatherKey(String fatherKey) {
        this.fatherKey = fatherKey;
    }

    public String getChildname() {
        return childname;
    }

    public void setChildname(String childname) {
        this.childname = childname;
    }

    public Integer getChildage() {
        return childage;
    }

    public void setChildage(Integer childage) {
        this.childage = childage;
    }
}
