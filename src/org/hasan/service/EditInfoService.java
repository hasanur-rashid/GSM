package org.hasan.service;

import org.hasan.dbaccess.DataAccess;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by ENVY on 7/10/2017.
 */
public class EditInfoService
{
    @Autowired
    private DataAccess db;

    public boolean updatePrPrice ( Long pid, Float price )
    {
        if ( db.isProduct(pid) > 0 )
        {
            db.updatePrPrice(pid,price);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updatePrName ( Long pid, String name )
    {
        if ( db.isProduct(pid) > 0 )
        {
            db.updatePrName(pid,name);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updateCuAdr ( Long cuid, String address )
    {
        if ( db.isCustomer(cuid) > 0 )
        {
            db.updateCuAdr(cuid,address);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updateCuMob ( Long cuid, Long mobile_no )
    {
        if ( db.isCustomer(cuid) > 0 )
        {
            db.updateCuMob(cuid,mobile_no);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updateComAdr ( Long cmid, String address )
    {
        if ( db.isCompany(cmid) > 0 )
        {
            db.updateComAdr(cmid,address);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updateRepMob ( Long rid, Long mobile_no )
    {
        if ( db.isRep(rid) > 0 )
        {
            db.updateRepMob(rid,mobile_no);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updateEmAdr ( Long emid, String address )
    {
        if ( db.isEmployee(emid) > 0 )
        {
            db.updateEmAdr(emid,address);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updateEmMob ( Long emid, Long mobile_no )
    {
        if ( db.isEmployee(emid) > 0 )
        {
            db.updateEmMob(emid,mobile_no);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updateEmDesg ( Long emid, String designation )
    {
        if ( db.isEmployee(emid) > 0 )
        {
            db.updateEmDesg(emid,designation);
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean updateEmSal ( Long emid, Long salary )
    {
        if ( db.isEmployee(emid) > 0 )
        {
            db.updateEmSal(emid,salary);
            return true;
        }
        else
        {
            return false;
        }
    }
}
