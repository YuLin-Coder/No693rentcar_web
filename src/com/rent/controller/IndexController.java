package com.rent.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rent.entity.Appointment;
import com.rent.entity.Brand;
import com.rent.entity.Car;
import com.rent.entity.Category;
import com.rent.entity.Orders;
import com.rent.entity.Smrz;
import com.rent.entity.User;
import com.rent.service.AppointmentService;
import com.rent.service.BrandService;
import com.rent.service.CarService;
import com.rent.service.CategoryService;
import com.rent.service.EmployeeService;
import com.rent.service.OrdersService;
import com.rent.service.SmrzService;
import com.rent.service.UserService;

@RestController
public class IndexController {
	
	@Autowired 
	CarService CarService;
	
	@Autowired 
	BrandService BrandService;
	
	@Autowired 
	CategoryService CategoryService;
	
	@Autowired 
	EmployeeService EmployeeService;
	
	@Autowired 
	UserService userService;
	
	@Autowired 
	SmrzService SmrzService;
	
	@Autowired 
	AppointmentService AppointmentService;
	
	@Autowired 
	OrdersService OrdersService;
	
	Map<String,Object> param = new HashMap<>();

	/**
	 * 首页
	 * @param request
	 * @return
	 */
	@RequestMapping("/toIndex")
    public ModelAndView toIndex(HttpServletRequest request){
		Map<String,Object> maps = new HashMap<>();
		maps.put("status", "0");
		List<Car> list =CarService.selectCarList(maps);
		request.setAttribute("carList", list);
		List<Category> categoryList = CategoryService.selectCategoryList(param);
	    List<Brand> brandList = BrandService.selectBrandList(param);
	    request.setAttribute("categoryList", categoryList);
	    request.setAttribute("brandList", brandList);
	    request.getSession().setAttribute("url", "toIndex");
		return new ModelAndView("view/index/index");
	} 
	
	/**
	 * 汽车大厅
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/toSearchIndex")
	public ModelAndView toSearchIndex(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		String key = request.getParameter("key");
		String bid = request.getParameter("bid");
		String cid = request.getParameter("cid");
		String pf_stand = request.getParameter("pf_stand");
		List<Car> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		maps.put("key", key);
		maps.put("bid", bid);
		maps.put("cid", cid);
		maps.put("pf_stand", pf_stand);
		maps.put("status", "0");
		PageHelper.startPage(currentPage,10); 
		list=CarService.selectCarList(maps);
		PageInfo<Car> pageInfo=new PageInfo<Car>(list,8);
		maps.put("pageInfo", pageInfo);
		List<Category> categoryList = CategoryService.selectCategoryList(param);
	    List<Brand> brandList = BrandService.selectBrandList(param);
	    request.setAttribute("categoryList", categoryList);
	    request.setAttribute("brandList", brandList);
	    request.setAttribute("pageInfo", pageInfo);
	    request.getSession().setAttribute("url", "toSearchIndex");
		return new ModelAndView("view/index/search_index");
	} 


	/**
	 * 私人订制
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/toSrdz")
    public ModelAndView toSrdz(HttpServletRequest request){
	   List<Category> categoryList = CategoryService.selectCategoryList(param);
	    List<Brand> brandList = BrandService.selectBrandList(param);
	    request.setAttribute("categoryList", categoryList);
	    request.setAttribute("brandList", brandList);
	    request.getSession().setAttribute("url", "toSrdz");
		return new ModelAndView("view/index/srdz");
	} 
	
	/**
	 * 汽车详情页
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/toCarDetail")
	public ModelAndView toCarDetail(Integer cid,HttpServletRequest request){
		List<Category> categoryList = CategoryService.selectCategoryList(param);
		List<Brand> brandList = BrandService.selectBrandList(param);
		request.setAttribute("categoryList", categoryList);
		request.setAttribute("brandList", brandList);
		request.setAttribute("car", CarService.selectCarById(cid));
		return new ModelAndView("view/index/car_detail");
	} 
	
	/**
	 * 个人信息
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/toMyinfo")
	public ModelAndView toMyinfo(Integer cid,HttpServletRequest request){
		User user = (User)request.getSession().getAttribute("user");
		request.setAttribute("data",userService.selectUserById(user.getId()));
	    request.getSession().setAttribute("url", "toMyinfo");
		return new ModelAndView("view/index/myinfo");
	} 
	
	/**
	 * 个人信息
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/toMyOrders")
	public ModelAndView toMyOrders(HttpServletRequest request){
		Map<String,Object> maps = new HashMap<>();
		User user = (User)request.getSession().getAttribute("user");
		maps.put("uid", user!=null?user.getId():null);
		List<Orders> ordersList = OrdersService.selectOrdersList(maps);
		for(Orders aa : ordersList) {
			aa.setCar(CarService.selectCarById(aa.getCid()));
			aa.setUser(userService.selectUserById(aa.getUid()));
			aa.setHt(OrdersService.selectHtByOid(aa.getId()));
		}
		request.setAttribute("ordersList",ordersList);
		List<Appointment> appointmentList = AppointmentService.selectAppointmentList(maps);
		for(Appointment aa : appointmentList) {
			aa.setCar(CarService.selectCarById(aa.getCid()));
			aa.setUser(userService.selectUserById(aa.getUid()));
		}
		request.setAttribute("appointmentList",appointmentList);
		request.getSession().setAttribute("url", "toMyOrders");
		return new ModelAndView("view/index/orders");
	} 

	
	@RequestMapping("/toTest")
	public ModelAndView toTest(Integer cid,HttpServletRequest request){
		return new ModelAndView("view/index/test");
	} 


}
