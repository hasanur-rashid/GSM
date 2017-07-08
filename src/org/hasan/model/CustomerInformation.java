package org.hasan.model;

/**
 * Created by ENVY on 5/21/2017.
 */
public class CustomerInformation
{
    Long cuid;
    String cuname;
    Long mobile_no;
    String joindate;
    String cuaddress;
    Float purchase;
    Float commission_pct;

    public Long getCuid() {
        return cuid;
    }

    public void setCuid(Long cuid) {
        this.cuid = cuid;
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

    public String getJoindate() {
        return joindate;
    }

    public void setJoindate(String joindate) {
        this.joindate = joindate;
    }

    public String getCuaddress() {
        return cuaddress;
    }

    public void setCuaddress(String cuaddress) {
        this.cuaddress = cuaddress;
    }

    public Float getPurchase() {
        return purchase;
    }

    public void setPurchase(Float purchase) {
        this.purchase = purchase;
    }

    public Float getCommission_pct() {
        return commission_pct;
    }

    public void setCommission_pct(Float commission_pct) {
        this.commission_pct = commission_pct;
    }
}
