package org.hasan.model;

/**
 * Created by ENVY on 5/21/2017.
 */
public class EmployeeInformation
{
    Long emid;
    String emname;
    String emaddress;
    Float salary;
    String designation;
    Long mobile_no;

    public Long getEmid() {
        return emid;
    }

    public void setEmid(Long emid) {
        this.emid = emid;
    }

    public String getEmname() {
        return emname;
    }

    public void setEmname(String emname) {
        this.emname = emname;
    }

    public String getEmaddress() {
        return emaddress;
    }

    public void setEmaddress(String emaddress) {
        this.emaddress = emaddress;
    }

    public Float getSalary() {
        return salary;
    }

    public void setSalary(Float salary) {
        this.salary = salary;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public Long getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(Long mobile_no) {
        this.mobile_no = mobile_no;
    }
}
