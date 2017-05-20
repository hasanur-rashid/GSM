package org.hasan.controller;

import org.hasan.service.SellStoreService;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by ENVY on 5/20/2017.
 */
@Controller
public class SellStoreController implements ApplicationContextAware
{
    private ApplicationContext applicationContext;
    private SellStoreService sv;

    @RequestMapping("/doSellToRegular")
    public ModelAndView doSellToRegular(@RequestParam("name") String name, @RequestParam("mobile_no") Long mobile_no, @RequestParam("pid") Long pid, @RequestParam("quantity") Long quantity, HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        Long emid = (Long)session.getAttribute("emid");
        sv.performSellToRegular(name, mobile_no, pid, emid, quantity);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeHome.jsp");
        return mv;
    }

    @RequestMapping("/doSellToPremier")
    public ModelAndView doSellToPremier(@RequestParam("pid") Long pid, @RequestParam("cuid") Long cuid, @RequestParam("quantity") Long quantity, HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        Long emid = (Long)session.getAttribute("emid");
        sv.performSellToPremier(pid, emid, cuid, quantity);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeHome.jsp");
        return mv;
    }

    @RequestMapping("/doStore")
    public ModelAndView doStore(@RequestParam("pid") Long pid, @RequestParam("price") Long price, @RequestParam("quantity") Long quantity, HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        Long emid = (Long)session.getAttribute("emid");
        sv.performStore(pid, emid, price, quantity);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeHome.jsp");
        return mv;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        sv = (SellStoreService) this.applicationContext.getBean("sellStoreServ");
    }
}
