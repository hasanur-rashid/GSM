package org.hasan.controller;

import org.hasan.service.LoginService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by ENVY on 4/28/2017.
 */
@Controller
public class LoginController
{
    @RequestMapping("/login")
    public ModelAndView login(@RequestParam("usrName") String usrName, @RequestParam("passWd") Long passWd, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        LoginService sv = new LoginService();
        if ( sv.doLogin(usrName,passWd) )
        {
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
            //mv.setViewName("loginField.jsp");
            mv.setViewName("index.jsp");
            mv.addObject("errorLoginMessage","Invalid User Name or Password !!!");
        }
        return mv;
    }
}
