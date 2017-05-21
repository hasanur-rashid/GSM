package org.hasan.model;

import java.util.List;

/**
 * Created by ENVY on 5/21/2017.
 */
public class RepresentativeInformation
{
    Long rid;
    Long cmid;
    String rname;
    Long mobile_no;
    String cmname;
    List<Long> pid;
    List<String> pname;

    public Long getRid() {
        return rid;
    }

    public void setRid(Long rid) {
        this.rid = rid;
    }

    public Long getCmid() {
        return cmid;
    }

    public void setCmid(Long cmid) {
        this.cmid = cmid;
    }

    public String getRname() {
        return rname;
    }

    public void setRname(String rname) {
        this.rname = rname;
    }

    public Long getMobile_no() {
        return mobile_no;
    }

    public void setMobile_no(Long mobile_no) {
        this.mobile_no = mobile_no;
    }

    public String getCmname() {
        return cmname;
    }

    public void setCmname(String cmname) {
        this.cmname = cmname;
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
}
