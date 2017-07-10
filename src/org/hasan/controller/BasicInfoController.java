package org.hasan.controller;

import org.hasan.model.*;
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
import java.util.List;

/**
 * Created by ENVY on 5/18/2017.
 */
@Controller
public class BasicInfoController implements ApplicationContextAware
{
    private ApplicationContext applicationContext;
    private BasicInfoService sv;

    @RequestMapping("/prBasicInfo")
    public ModelAndView prBasicInfo(@RequestParam("pid") Long pid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        ProductInformation pInfo = sv.getPrInfo(pid);
        if ( pInfo == null )
        {
            mv.setViewName("employeeHome.jsp");
            mv.addObject("errorValidPid","Invalid Product ID !!!");
        }
        else
        {
            mv.setViewName("basicPrInfo.jsp");
            mv.addObject("pInfo", pInfo);
        }
        return mv;
    }

    @RequestMapping("/comBasicInfo")
    public ModelAndView comBasicInfo(@RequestParam("cmid") Long cmid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        CompanyInformation comInfo = sv.getComInfo(cmid);
        if ( comInfo == null )
        {
            mv.setViewName("employeeHome.jsp");
            mv.addObject("errorValidCmid","Invalid Company ID !!!");
        }
        else
        {
            mv.setViewName("basicComInfo.jsp");
            mv.addObject("comInfo", comInfo);
        }
        return mv;
    }

    @RequestMapping("/emBasicInfo")
    public ModelAndView emBasicInfo(@RequestParam("emid") Long emid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        EmployeeInformation emInfo = sv.getEmInfo(emid);
        if ( emInfo == null )
        {
            mv.setViewName("employeeHome.jsp");
            mv.addObject("errorValidEmid","Invalid Employee ID !!!");
        }
        else
        {
            mv.setViewName("basicEmInfo.jsp");
            mv.addObject("emInfo", emInfo);
        }
        return mv;
    }

    @RequestMapping("/cuBasicInfo")
    public ModelAndView cuBasicInfo(@RequestParam("cuid") Long cuid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        CustomerInformation cuInfo = sv.getCuInfo(cuid);
        if ( cuInfo == null )
        {
            mv.setViewName("employeeHome.jsp");
            mv.addObject("errorValidCuid","Invalid Customer ID !!!");
        }
        else
        {
            mv.setViewName("basicCuInfo.jsp");
            mv.addObject("cuInfo", cuInfo);
        }
        return mv;
    }

    @RequestMapping("/repBasicInfo")
    public ModelAndView repBasicInfo(@RequestParam("rid") Long rid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        RepresentativeInformation rInfo = sv.getRepInfo(rid);
        if ( rInfo == null )
        {
            mv.setViewName("employeeHome.jsp");
            mv.addObject("errorValidRid","Invalid Representative ID !!!");
        }
        else
        {
            mv.setViewName("basicRepInfo.jsp");
            mv.addObject("rInfo", rInfo);
        }
        return mv;
    }

    @RequestMapping("/sellPrInfo")
    public ModelAndView sellPrInfo(@RequestParam("pid") Long pid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        List<SellInformation> sInfo = sv.getSellPrInfo(pid);
        if ( sInfo == null )
        {
            mv.setViewName("adminHome.jsp");
            mv.addObject("errPid","Invalid Product ID !!!");
        }
        else
        {
            mv.setViewName("sellPrInfo.jsp");
            mv.addObject("sInfo", sInfo);
        }
        return mv;
    }

    @RequestMapping("/sellEmInfo")
    public ModelAndView sellEmInfo(@RequestParam("emid") Long emid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        List<SellInformation> sInfo = sv.getSellEmInfo(emid);
        if ( sInfo == null )
        {
            mv.setViewName("adminHome.jsp");
            mv.addObject("errEmid","Invalid Employee ID !!!");
        }
        else
        {
            mv.setViewName("sellEmInfo.jsp");
            mv.addObject("sInfo", sInfo);
        }
        return mv;
    }

    @RequestMapping("/sellCuInfo")
    public ModelAndView sellCuInfo(@RequestParam("cuid") Long cuid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        List<SellInformation> sInfo = sv.getSellCuInfo(cuid);
        if ( sInfo == null )
        {
            mv.setViewName("adminHome.jsp");
            mv.addObject("errCuid","Invalid Customer ID !!!");
        }
        else
        {
            mv.setViewName("sellCuInfo.jsp");
            mv.addObject("sInfo", sInfo);
        }
        return mv;
    }

    @RequestMapping("/sellDateInfo")
    public ModelAndView sellDateInfo(@RequestParam("sdate") String sdate, @RequestParam("edate") String edate, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        List<SellInformation> sInfo = sv.getSellDateInfo(sdate, edate);
        mv.setViewName("sellDateInfo.jsp");
        mv.addObject("sInfo", sInfo);
        return mv;
    }

    @RequestMapping("/storePrInfo")
    public ModelAndView storePrInfo(@RequestParam("pid") Long pid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        List<StoreInformation> sInfo = sv.getStorePrInfo(pid);
        if ( sInfo == null )
        {
            mv.setViewName("adminHome.jsp");
            mv.addObject("errPid","Invalid Product ID !!!");
        }
        else
        {
            mv.setViewName("storePrInfo.jsp");
            mv.addObject("sInfo", sInfo);
        }
        return mv;
    }

    @RequestMapping("/storeEmInfo")
    public ModelAndView storeEmInfo(@RequestParam("emid") Long emid, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        List<StoreInformation> sInfo = sv.getStoreEmInfo(emid);
        if ( sInfo == null )
        {
            mv.setViewName("adminHome.jsp");
            mv.addObject("errEmid","Invalid Employee ID !!!");
        }
        else
        {
            mv.setViewName("storeEmInfo.jsp");
            mv.addObject("sInfo", sInfo);
        }
        return mv;
    }

    @RequestMapping("/storeDateInfo")
    public ModelAndView storeDateInfo(@RequestParam("sdate") String sdate, @RequestParam("edate") String edate, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        List<StoreInformation> sInfo = sv.getStoreDateInfo(sdate, edate);
        mv.setViewName("storeDateInfo.jsp");
        mv.addObject("sInfo", sInfo);
        return mv;
    }

    @RequestMapping("/totPrSale")
    public ModelAndView totPrSale(@RequestParam("sdate") String sdate, HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("prTotSaleList.jsp");
        mv.addObject("pList", sv.getPrTotSaleInfo(sdate));
        return mv;
    }

    @RequestMapping("/backAdminHome")
    public ModelAndView backAdminHome(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("adminHome.jsp");
        return mv;
    }

    @RequestMapping("/backEmployeeHome")
    public ModelAndView backEmployeeHome(HttpServletRequest request, HttpServletResponse response)
    {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("employeeHome.jsp");
        return mv;
    }

    @Override
    public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        this.applicationContext = applicationContext;
        sv = (BasicInfoService) this.applicationContext.getBean("basicInfoServ");
    }
}
