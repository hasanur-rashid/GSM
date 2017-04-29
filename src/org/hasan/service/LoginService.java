package org.hasan.service;

import org.hasan.dbaccess.DataAccess;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import javax.annotation.PostConstruct;

/**
 * Created by ENVY on 4/28/2017.
 */
public class LoginService
{
    private DataAccess db;

    public boolean doLogin ( String usrName, Long passWd )
    {
        ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        db = (DataAccess) context.getBean("db");
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
