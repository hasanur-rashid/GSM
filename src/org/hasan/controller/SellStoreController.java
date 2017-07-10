package org.hasan.controller;

import org.hasan.model.SoldProductList;
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
import java.util.*;

/**
 * Created by ENVY on 5/20/2017.
 */
@Controller
public class SellStoreController implements ApplicationContextAware
{
    private ApplicationContext applicationContext;
    private SellStoreService sv;

    @RequestMapping("/doSellToRegular")
    public ModelAndView doSellToRegular(@RequestParam("name") String name, @RequestParam("mobile_no") Long mobile_no, HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        session.setAttribute("cuname",name);
        session.setAttribute("cumob",mobile_no);
        List<SoldProductList> sList = new ArrayList<SoldProductList>();
        session.setAttribute("sList",sList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeHome.jsp");
        mv.addObject("openPrListRegAgain","open");
        return mv;
    }

    @RequestMapping("/prListReg")
    public ModelAndView prListReg(@RequestParam("pid") Long pid, @RequestParam("quantity") Long quantity, HttpServletRequest request, HttpServletResponse response)
    {
        SoldProductList s = new SoldProductList();
        s.setPid(pid);
        s.setQuantity(quantity);
        HttpSession session = request.getSession();
        List<SoldProductList> sList = (List<SoldProductList>) session.getAttribute("sList");
        sList.add(s);
        session.setAttribute("sList",sList);
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeHome.jsp");
        mv.addObject("openPrListRegAgain","open");
        return mv;
    }

    @RequestMapping("/genMemoReg")
    public ModelAndView genMemoReg(HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        String name = (String) session.getAttribute("cuname");
        Long mobile_no = (Long) session.getAttribute("cumob");
        Long emid = (Long) session.getAttribute("emid");
        Long cuid = sv.getRegularID(name,mobile_no);
        session.setAttribute("cuid",cuid);
        List<SoldProductList> sList = (List<SoldProductList>) session.getAttribute("sList");
        ModelAndView mv = new ModelAndView();
        mv.setViewName("sellMemo.jsp");
        mv.addObject("sList", sv.performSellToRegular(cuid,emid,sList));
        return mv;
    }

    @RequestMapping("/doSellToPremier")
    public ModelAndView doSellToPremier(@RequestParam("pid") Long pid, @RequestParam("cuid") Long cuid, @RequestParam("quantity") Long quantity, HttpServletRequest request, HttpServletResponse response)
    {
        HttpSession session = request.getSession();
        Long emid = (Long)session.getAttribute("emid");
        ModelAndView mv = new ModelAndView();
        if ( sv.performSellToPremier(pid, emid, cuid, quantity) )
        {
            mv.setViewName("employeeHome.jsp");
        }
        else
        {
            mv.setViewName("employeeHome.jsp");
            mv.addObject("errorValidCuid","Invalid Premier Customer ID !!!");
        }
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
