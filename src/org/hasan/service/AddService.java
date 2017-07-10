package org.hasan.service;

import org.hasan.dbaccess.DataAccess;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by ENVY on 5/21/2017.
 */
public class AddService
{
    @Autowired
    private DataAccess db;

    public boolean checkCompanyID( Long cmid )
    {
        if ( db.isCompany(cmid) > 0 )
        {
            return true;
        }
        return false;
    }

    public boolean checkRep( Long rid )
    {
        if ( db.isRep(rid) > 0 )
        {
            return true;
        }
        return false;
    }

    /*public boolean checkRepOfCom( Long rid, Long cmid )
    {
        if ( db.isRepOfCom(rid,cmid) > 0 )
        {
            return true;
        }
        return false;
    }*/

    public boolean createNewCom(Long cmid, String name, String address)
    {
        if ( db.isCompany(cmid) > 0 )
        {
            return false;
        }
        else
        {
            db.createCompany(cmid, name, address);
            return true;
        }
    }

    public boolean createNewRep(Long rid, Long cmid, String name, Long mobile_no)
    {
        if ( db.isRep(rid) > 0 )
        {
            return false;
        }
        else
        {
            db.createRepresentative(rid, cmid, name, mobile_no);
            return true;
        }
    }

    public boolean createNewPr(Long pid, Long cmid, String name, Long price, Long quantity, String category, Long rid, Long emid)
    {
        if ( db.isEmployee(emid) > 0 )
        {
            return false;
        }
        else
        {
            db.createProduct(pid, cmid, name, price, quantity, category, rid, emid);
            return true;
        }
    }

    public boolean createNewCu(Long cuid, String name,  Long mobile_no, String address)
    {
        if ( db.isCustomer(cuid) > 0 )
        {
            return false;
        }
        else
        {
            db.createCustomer(cuid, name, mobile_no, address);
            return true;
        }
    }

    public boolean createNewEm(Long emid, String name, Long mobile_no, String address, String designation)
    {
        if ( db.isEmployee(emid) > 0 )
        {
            return false;
        }
        else
        {
            db.createEmployee(emid, name, mobile_no, address, designation);
            return true;
        }
    }
}
