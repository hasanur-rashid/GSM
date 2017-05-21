package org.hasan.service;

import org.hasan.dbaccess.DataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by ENVY on 5/20/2017.
 */
@Component
public class SellStoreService
{
    @Autowired
    private DataAccess db;

    public void performSellToRegular (String name, Long mobile_no, Long pid, Long emid, Long quantity)
    {
        db.sellProductToRegular(name, mobile_no, pid, emid, quantity);
    }

    public boolean performSellToPremier (Long pid,Long emid, Long cuid, Long quantity)
    {
        if ( db.isPrCustomer(cuid) > 0 )
        {
            db.sellProductToPremier(pid, emid, cuid, quantity);
            return true;
        }
        else
        {
            return false;
        }
    }

    public void performStore(Long pid,Long emid, Long price, Long quantity)
    {
        db.storeProduct(pid, emid, price, quantity);
    }
}
