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
