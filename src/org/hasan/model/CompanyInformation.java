package org.hasan.model;

import java.util.List;

/**
 * Created by ENVY on 5/21/2017.
 */
public class CompanyInformation
{
    Long cmid;
    String cmname;
    String cmaddress;
    List <Long> pid;
    List <String> pname;
    List <Long> rid;
    List <String> rname;
    List<Long> mobile_no;

    public Long getCmid() {
        return cmid;
    }

    public void setCmid(Long cmid) {
        this.cmid = cmid;
    }

    public String getCmname() {
        return cmname;
    }

    public void setCmname(String cmname) {
        this.cmname = cmname;
    }

    public String getCmaddress() {
        return cmaddress;
    }

    public void setCmaddress(String cmaddress) {
        this.cmaddress = cmaddress;
    }

    public List<Long> getPid() {
        return pid;
    }

    public void setPid(List<Long> pid) {
        this.pid = pid;
    }

    public List<String> getPname() {
        return pname;
    }

    public void setPname(List<String> pname) {
        this.pname = pname;
    }

    public List<Long> getRid() {
        return rid;
    }

    public void setRid(List<Long> rid) {
        this.rid = rid;
    }

    public List<String> getRname() {
        return rname;
    }

    public void setRname(List<String> rname) {
        this.rname = rname;
    }

    public List<Long> getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(List<Long> mobile_no) {
        this.mobile_no = mobile_no;
    }
}
