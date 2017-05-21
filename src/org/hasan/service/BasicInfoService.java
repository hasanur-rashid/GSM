package org.hasan.service;

import org.hasan.dbaccess.DataAccess;
import org.hasan.model.CompanyInformation;
import org.hasan.model.ProductInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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
        return db.getProductInfo(pid);
    }

    public CompanyInformation getComInfo ( Long cmid )
    {
        return db.getCompanyInfo(cmid);
    }
}
