package org.hasan.controller;

import org.hasan.service.AddService;
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
 * Created by ENVY on 5/21/2017.
 */
@Controller
public class AddController implements ApplicationContextAware
{
    private ApplicationContext applicationContext;
    private AddService sv;

    @RequestMapping("/checkComId")
    public ModelAndView checkComId(@RequestParam("cmid") Long cmid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeHome.jsp");
        HttpSession session = request.getSession();
        session.setAttribute("cmid",cmid);
        if ( sv.checkCompanyID(cmid) )
        {
            mv.addObject("openPrRepCheck","open");
        }
        else
        {
            mv.addObject("openShowNewCom","open");
        }
        return mv;
    }

    @RequestMapping("/checkRepId")
    public ModelAndView checkRepId(@RequestParam("rid") Long rid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeHome.jsp");
        HttpSession session = request.getSession();
        session.setAttribute("rid",rid);
        if ( sv.checkRep(rid) )
        {
            mv.addObject("openNewPr","open");
        }
        else
        {
            mv.addObject("openShowNewRep","open");
        }
        return mv;
    }

    @RequestMapping("/addNewCom")
    public ModelAndView addNewCom(@RequestParam("name") String name, @RequestParam("address") String address, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        Long cmid = (Long) session.getAttribute("cmid");
        sv.createNewCom(cmid,name,address);
        mv.setViewName("employeeHome.jsp");
        mv.addObject("openPrRepCheck","open");
        return mv;
    }

    @RequestMapping("/addNewRep")
    public ModelAndView addNewRep(@RequestParam("name") String name, @RequestParam("mobile_no") Long mobile_no, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        Long rid = (Long) session.getAttribute("rid");
        Long cmid = (Long) session.getAttribute("cmid");
        sv.createNewRep(rid,cmid,name,mobile_no);
        mv.setViewName("employeeHome.jsp");
        mv.addObject("openNewPr","open");
        return mv;
    }

    @RequestMapping("/addNewPr")
    public ModelAndView addNewPr(@RequestParam("pid") Long pid, @RequestParam("name") String name, @RequestParam("price") Long price, @RequestParam("quantity") Long quantity, @RequestParam("category") String category, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        Long cmid = (Long) session.getAttribute("cmid");
        Long rid = (Long) session.getAttribute("rid");
        Long emid = (Long) session.getAttribute("emid");
        sv.createNewPr(pid,cmid,name,price,quantity,category,rid,emid);
        mv.setViewName("employeeHome.jsp");
        mv.addObject("openAddPrAgain","open");
        return mv;
    }

    @RequestMapping("/addNewCu")
    public ModelAndView addNewCu(@RequestParam("cuid") Long cuid, @RequestParam("name") String name, @RequestParam("mobile_no") Long mobile_no, @RequestParam("address") String address, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        sv.createNewCu(cuid, name, mobile_no, address);
        mv.setViewName("employeeHome.jsp");
        mv.addObject("openAddCuAgain","open");
        return mv;
    }

    @RequestMapping("/doNullOnPrBtn")
    public ModelAndView doNullOnPrBtn(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        session.setAttribute("cmid",null);
        session.setAttribute("rid",null);
        mv.setViewName("employeeHome.jsp");
        mv.addObject("openPrComCheck","open");
        return mv;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        sv = (AddService) this.applicationContext.getBean("addServ");
    }
}
