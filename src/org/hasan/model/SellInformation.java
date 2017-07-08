package org.hasan.model;

/**
 * Created by ENVY on 7/8/2017.
 */
public class SellInformation
{
    Long pid;
    Long emid;
    Long cuid;
    String date;
    Long price;
    Long quantity;
    String pname;
    String emname;
    String cuname;
    Long mobile_no;

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public Long getEmid() {
        return emid;
    }

    public void setEmid(Long emid) {
        this.emid = emid;
    }

    public Long getCuid() {
        return cuid;
    }

    public void setCuid(Long cuid) {
        this.cuid = cuid;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Long getPrice() {
        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Long getQuantity() {
        return quantity;
    }

    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getEmname() {
        return emname;
    }

    public void setEmname(String emname) {
        this.emname = emname;
    }

    public String getCuname() {
        return cuname;
    }

    public void setCuname(String cuname) {
        this.cuname = cuname;
    }

    public Long getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(Long mobile_no) {
        this.mobile_no = mobile_no;
    }
}
