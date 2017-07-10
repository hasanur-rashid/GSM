package org.hasan.controller;

import org.hasan.service.EditInfoService;
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
 * Created by ENVY on 7/10/2017.
 */
@Controller
public class EditInfoController implements ApplicationContextAware
{
    private ApplicationContext applicationContext;
    private EditInfoService sv;

    @RequestMapping("/editPrPrice")
    public ModelAndView editPrPrice(@RequestParam("pid") Long pid, @RequestParam("price") Float price, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updatePrPrice(pid, price) )
        {
            mv.addObject("succMsg", "Product Price Updated !!!");
        }
        else
        {
            mv.addObject("errPid", "Invalid Product ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editPrName")
    public ModelAndView editPrName(@RequestParam("pid") Long pid, @RequestParam("name") String name, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updatePrName(pid, name) )
        {
            mv.addObject("succMsg", "Product Name Updated !!!");
        }
        else
        {
            mv.addObject("errPid", "Invalid Product ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editCuAdr")
    public ModelAndView editCuAdr(@RequestParam("cuid") Long cuid, @RequestParam("address") String address, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updateCuAdr(cuid, address) )
        {
            mv.addObject("succMsg", "Customer Address Updated !!!");
        }
        else
        {
            mv.addObject("errCuid", "Invalid Customer ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editCuMob")
    public ModelAndView editCuMob(@RequestParam("cuid") Long cuid, @RequestParam("mobile_no") Long mobile_no, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updateCuMob(cuid, mobile_no) )
        {
            mv.addObject("succMsg", "Customer Mobile No. Updated !!!");
        }
        else
        {
            mv.addObject("errCuid", "Invalid Customer ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editComAdr")
    public ModelAndView editComAdr(@RequestParam("cmid") Long cmid, @RequestParam("address") String address, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updateComAdr(cmid, address) )
        {
            mv.addObject("succMsg", "Company Address Updated !!!");
        }
        else
        {
            mv.addObject("errCmid", "Invalid Company ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editRepMob")
    public ModelAndView editRepMob(@RequestParam("rid") Long rid, @RequestParam("mobile_no") Long mobile_no, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updateRepMob(rid, mobile_no) )
        {
            mv.addObject("succMsg", "Representative Mobile No. Updated !!!");
        }
        else
        {
            mv.addObject("errRid", "Invalid Representative ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editEmDesg")
    public ModelAndView editEmDesg(@RequestParam("emid") Long emid, @RequestParam("designation") String designation, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updateEmDesg(emid, designation) )
        {
            mv.addObject("succMsg", "Employee Designation Updated !!!");
        }
        else
        {
            mv.addObject("errEmid", "Invalid Employee ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editEmSal")
    public ModelAndView editEmSal(@RequestParam("emid") Long emid, @RequestParam("salary") Long salary, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updateEmSal(emid, salary) )
        {
            mv.addObject("succMsg", "Employee Salary Updated !!!");
        }
        else
        {
            mv.addObject("errEmid", "Invalid Employee ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editEmAdr")
    public ModelAndView editEmAdr(@RequestParam("emid") Long emid, @RequestParam("address") String address, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updateEmAdr(emid, address) )
        {
            mv.addObject("succMsg", "Employee Address Updated !!!");
        }
        else
        {
            mv.addObject("errEmid", "Invalid Employee ID!!!");
        }
        return mv;
    }

    @RequestMapping("/editEmMob")
    public ModelAndView editEmMob(@RequestParam("emid") Long emid, @RequestParam("mobile_no") Long mobile_no, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        if ( sv.updateEmMob(emid, mobile_no) )
        {
            mv.addObject("succMsg", "Employee Mobile No. Updated !!!");
        }
        else
        {
            mv.addObject("errEmid", "Invalid Employee ID!!!");
        }
        return mv;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        sv = (EditInfoService) this.applicationContext.getBean("editServ");
    }
}
