package com.rent.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rent.entity.Admin;
import com.rent.entity.Appointment;
import com.rent.entity.Car;
import com.rent.entity.Employee;
import com.rent.entity.Ht;
import com.rent.entity.Orders;
import com.rent.entity.User;
import com.rent.service.CarService;
import com.rent.service.OrdersService;
import com.rent.service.UserService;

@RestController
public class OrdersController {
	
	@Autowired 
	OrdersService OrdersService;
	@Autowired 
	CarService carService;
	@Autowired
	UserService userService;


	/**
	 * 订单列表
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/OrdersList")
    public ModelAndView OrdersList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		Employee Employee = (Employee)request.getSession().getAttribute("employee");
		String key = request.getParameter("key");
		List<Orders> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		maps.put("eid", Employee!=null?Employee.getId():null);
		PageHelper.startPage(currentPage,10); 
		list=OrdersService.selectOrdersList(maps);
		for(Orders aa : list) {
			aa.setCar(carService.selectCarById(aa.getCid()));
			aa.setUser(userService.selectUserById(aa.getUid()));
			aa.setHt(OrdersService.selectHtByOid(aa.getId()));
		}
		PageInfo<Orders> pageInfo=new PageInfo<Orders>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/orders/list");
	} 
	
	
	/**
	 * 合同列表
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/HtList")
    public ModelAndView HtList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		Employee Employee = (Employee)request.getSession().getAttribute("employee");
		String key = request.getParameter("key");
		List<Ht> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		maps.put("eid", Employee!=null?Employee.getId():null);
		PageHelper.startPage(currentPage,10); 
		list=OrdersService.selectHtList(maps);
		for(Ht aa : list) {
			aa.setCar(carService.selectCarById(aa.getCid()));
			aa.setUser(userService.selectUserById(aa.getUid()));
		}
		PageInfo<Ht> pageInfo=new PageInfo<Ht>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/ht/list");
	} 
	

	/**
	 * 去新增订单
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toAddOrders")
    public ModelAndView toAddOrders(HttpServletRequest request,ModelAndView mv){
		String cid = request.getParameter("cid");
		request.setAttribute("cid", cid);
		mv.setViewName("view/orders/add");
		return mv;
	}
	
	/**
	 * 去新增合同
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toAddHt")
	public ModelAndView toAddHt(Integer id,HttpServletRequest request,ModelAndView mv){
		Orders orders = OrdersService.selectOrdersById(id);
		request.setAttribute("orders", orders);
		mv.setViewName("view/orders/addHt");
		return mv;
	}
	
	/**
	 * 新增订单
	 * @param ss
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addOrders")
	@ResponseBody
	public boolean addOrders(HttpServletRequest request,Orders ss) throws Exception{
		boolean re = false;
		User user = (User)request.getSession().getAttribute("user");
		if(user!=null) {
			Car car = carService.selectCarById(ss.getCid());
			ss.setUid(user.getId());
			ss.setDays(daysBetween(ss.getStart_date(),ss.getEnd_date()));
			ss.setTotal_price(car.getPrice2()*ss.getDays());
			ss.setCreate_time(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
			ss.setOrder_no(getRno());
			ss.setEid(car.getEid());
		}
		OrdersService.addOrders(ss);
		re = true;
		return re;
	}
	
	
	/**
	 * 上传合同
	 * @param ss
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addHt")
	@ResponseBody
	public boolean addHt(HttpServletRequest request,Ht ht) throws Exception{
		boolean re = false;
		ht.setHtbh(getRno());
		OrdersService.addHt(ht);
		re = true;
		return re;
	}
	
    public String getRno() {//生成订单号
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate=sdf.format(new Date());
        String result="";
        Random random=new Random();
        for(int i=0;i<3;i++){
            result+=random.nextInt(10);
        }
        return newDate+result;

    }
	
	   /** 
     * 计算两个日期之间相差的天数 
     * @param smdate 较小的时间
     * @param bdate  较大的时间
     * @return 相差天数
     * @throws ParseException 
     */  
    public static int daysBetween(String smdate,String bdate) throws Exception{  
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date small=sdf.parse(smdate);
        Date big=sdf.parse(bdate);
        Calendar cal = Calendar.getInstance();  
        cal.setTime(small);  
        long time1 = cal.getTimeInMillis();               
        cal.setTime(big);  
        long time2 = cal.getTimeInMillis();       
        long between_days=(time2-time1)/(1000*3600*24);
          
       return Integer.parseInt(String.valueOf(between_days))+1;         
    }  
	
	/**
	 * 删除订单
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteOrders")
    public boolean deleteOrders(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		OrdersService.deleteOrders(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	/**
	 * 删除合同
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteHt")
	public boolean deleteHt(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		OrdersService.deleteHt(Integer.parseInt(id));
		re = true;
		return re;
	}
	
	/**
	 * 去修改订单
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toUpdateOrders")
    public ModelAndView toUpdateOrders(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    Orders ff = OrdersService.selectOrdersById(Integer.parseInt(id));
		mv.addObject("OrdersDate", ff);
		mv.setViewName("view/orders/update");
		return mv;
	}
	
	/**
	 * 修改订单
	 * @param ss
	 * @return
	 */
	@RequestMapping("/updateOrders")
	@ResponseBody
	public boolean updateOrders(Orders ss){
		boolean re = false;
		OrdersService.updateOrders(ss);
		re = true;
		return re;
	}

}
