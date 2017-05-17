package org.hasan.controller;


import org.hasan.service.LoginService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by ENVY on 4/28/2017.
 */
@Controller
public class LoginController
{
    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("usrName") String usrName, @RequestParam("passWd") Long passWd, HttpServletRequest request, HttpServletResponse response)
    {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        LoginService sv  = (LoginService) applicationContext.getBean("loginServ");

        ModelAndView mv = new ModelAndView();

        if ( sv.doLogin(usrName,passWd) )
        {
            HttpSession session = request.getSession();
            session.setAttribute("emid",passWd);
            if ( sv.checkAdmin(passWd) )
            {
                mv.setViewName("adminHome.jsp");
            }
            else
            {
                mv.setViewName("employeeHome.jsp");
            }
        }
        else
        {
            mv.setViewName("index.jsp");
            mv.addObject("errorLoginMessage","Invalid User Name or Password !!!");
        }
        return mv;
    }

    @RequestMapping("/logout")
    public ModelAndView logout(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        session.removeAttribute("emid");

        ModelAndView mv = new ModelAndView();
        mv.setViewName("index.jsp");
        return mv;
    }
}
