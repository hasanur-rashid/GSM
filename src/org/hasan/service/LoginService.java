package org.hasan.service;

import org.hasan.dbaccess.DataAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * Created by ENVY on 4/28/2017.
 */
@Component
public class LoginService
{
    @Autowired
    private DataAccess db;

    public boolean doLogin (String usrName, Long passWd )
    {
        if ( db.isUser(usrName,passWd) > 0 )
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    public boolean checkAdmin ( Long passWd )
    {
        if ( db.getDesignation( passWd ).lastIndexOf("#administration#")!=-1 )
        {
            return true;
        }
        else
        {
            return false;
        }
    }
}
