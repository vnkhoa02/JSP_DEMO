package com.vnk.jspdemo.Model;

import java.util.List;

public class Employee {
    private String key;

    private String name;

    private Integer age;

    private List<Child> childs;

    public Employee() {
    }

    public Employee(String key, String name, Integer age, List<Child> childs) {
        this.key = key;
        this.name = name;
        this.age = age;
        this.childs = childs;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public List<Child> getChilds() {
        return childs;
    }

    public void setChilds(List<Child> childs) {
        this.childs = childs;
    }
}
