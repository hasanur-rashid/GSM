package org.hasan.model;

/**
 * Created by ENVY on 7/10/2017.
 */
public class PrTotSaleList
{
    Long pid;
    String pname;
    Double totSale;

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public Double getTotSale() {
        return totSale;
    }

    public void setTotSale(Double totSale) {
        this.totSale = totSale;
    }
}
