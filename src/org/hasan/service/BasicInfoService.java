package org.hasan.service;

import org.hasan.dbaccess.DataAccess;
import org.hasan.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by ENVY on 5/18/2017.
 */
@Component
public class BasicInfoService
{
    @Autowired
    private DataAccess db;

    public ProductInformation getPrInfo ( Long pid )
    {
        if ( db.isProduct(pid) > 0 )
        {
            return db.getProductInfo(pid);
        }
        else
        {
            return null;
        }
    }

    public CompanyInformation getComInfo ( Long cmid )
    {
        if ( db.isCompany(cmid) > 0 )
        {
            return db.getCompanyInfo(cmid);
        }
        else
        {
            return null;
        }
    }

    public CustomerInformation getCuInfo (Long cuid )
    {
        if ( db.isPrCustomer(cuid) > 0 )
        {
            return db.getCustomerInfo(cuid);
        }
        else
        {
            return null;
        }
    }

    public EmployeeInformation getEmInfo (Long emid )
    {
        if ( db.isEmployee(emid) > 0 )
        {
            return db.getEmployeeInfo(emid);
        }
        else
        {
            return null;
        }
    }

    public RepresentativeInformation getRepInfo (Long rid )
    {
        if ( db.isRep(rid) > 0 )
        {
            return db.getRepInfo(rid);
        }
        else
        {
            return null;
        }
    }

    public List<SellInformation> getSellPrInfo (Long pid )
    {
        if ( db.isProduct(pid) > 0 )
        {
            return db.getSellPrInfo(pid);
        }
        else
        {
            return null;
        }
    }

    public List<SellInformation> getSellEmInfo (Long emid )
    {
        if ( db.isEmployee(emid) > 0 )
        {
            return db.getSellEmInfo(emid);
        }
        else
        {
            return null;
        }
    }

    public List<SellInformation> getSellCuInfo (Long cuid )
    {
        if ( db.isCustomer(cuid) > 0 )
        {
            return db.getSellCuInfo(cuid);
        }
        else
        {
            return null;
        }
    }

    public List<SellInformation> getSellDateInfo (String sdate, String edate)
    {
        return db.getSellDateInfo(sdate, edate);
    }

    public List<StoreInformation> getStoreDateInfo (String sdate, String edate)
    {
        return db.getStoreDateInfo(sdate, edate);
    }

    public List<StoreInformation> getStorePrInfo (Long pid )
    {
        if ( db.isProduct(pid) > 0 )
        {
            return db.getStorePrInfo(pid);
        }
        else
        {
            return null;
        }
    }

    public List<StoreInformation> getStoreEmInfo (Long emid )
    {
        if ( db.isEmployee(emid) > 0 )
        {
            return db.getStoreEmInfo(emid);
        }
        else
        {
            return null;
        }
    }

    public List<PrTotSaleList> getPrTotSaleInfo ( String sdate )
    {
        List<PrTotSaleList> pList = db.getTotSaleList(sdate);
        for ( PrTotSaleList p: pList )
        {
            p.setPname(db.findProductName(p.getPid()));
        }
        return pList;
    }
}
