package org.hasan.service;

import org.hasan.dbaccess.DataAccess;
import org.hasan.model.SoldProductList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 * Created by ENVY on 5/20/2017.
 */
@Component
public class SellStoreService
{
    @Autowired
    private DataAccess db;

    public Long getRegularID(String name, Long mobile_no)
    {
        return db.findRegularID(name, mobile_no);
    }

    public String getCuName(Long cuid)
    {
        return db.findCuName(cuid);
    }

    public Long getCuMob(Long cuid)
    {
        return db.findCuMob(cuid);
    }

    public boolean isPrCustomer ( Long cuid )
    {
        if ( db.isPrCustomer(cuid) > 0 )
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public List<SoldProductList> performSellToRegular ( Long cuid, Long emid, List<SoldProductList> sList)
    {
        for ( SoldProductList s: sList )
        {
            //Get current date time
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            Long pid = s.getPid();
            Long quantity = s.getQuantity();
            Float price = db.sellProductToRegular(cuid, pid, emid, quantity);
            s.setDate(now.format(formatter));
            s.setPrice(price);
            s.setName(db.findProductName(pid));
        }
        return sList;
    }

    public List<SoldProductList> performSellToPremier (Long cuid,Long emid, List<SoldProductList> sList)
    {
        for ( SoldProductList s: sList )
        {
            //Get current date time
            LocalDateTime now = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            Long pid = s.getPid();
            Long quantity = s.getQuantity();
            Float price = db.sellProductToPremier(pid, emid, cuid, quantity);
            s.setDate(now.format(formatter));
            s.setPrice(price);
            s.setName(db.findProductName(pid));
        }
        return sList;
    }

    public void performStore(Long pid,Long emid, Long price, Long quantity)
    {
        db.storeProduct(pid, emid, price, quantity);
    }
}
