package org.hasan.controller;

import org.hasan.model.ProductInformation;
import org.hasan.service.BasicInfoService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ENVY on 5/18/2017.
 */
@Controller
public class BasicInfoController implements ApplicationContextAware
{
    private ApplicationContext applicationContext;

    @RequestMapping("/prBasicInfo")
    public ModelAndView prBasicInfo(@RequestParam("pid") Long pid, HttpServletRequest request, HttpServletResponse response)
    {
        BasicInfoService sv = (BasicInfoService) applicationContext.getBean("basicInfoServ");
        ModelAndView mv = new ModelAndView();
        ProductInformation pInfo = sv.getPrInfo(pid);
        mv.setViewName("basicPrInfo.jsp");
        mv.addObject("pInfo",pInfo);
        return mv;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
    }
}