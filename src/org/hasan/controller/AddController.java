package org.hasan.controller;

import org.hasan.service.AddService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;

/**
 * Created by ENVY on 5/21/2017.
 */
@Controller
public class AddController implements ApplicationContextAware
{
    private ApplicationContext applicationContext;
    private AddService sv;

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        sv = (AddService) this.applicationContext.getBean("addServ");
    }
}
