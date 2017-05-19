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
}
