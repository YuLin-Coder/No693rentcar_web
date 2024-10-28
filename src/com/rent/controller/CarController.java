package com.rent.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.rent.entity.Brand;
import com.rent.entity.Car;
import com.rent.entity.Category;
import com.rent.entity.Employee;
import com.rent.service.BrandService;
import com.rent.service.CarService;
import com.rent.service.CategoryService;
import com.rent.service.EmployeeService;

@RestController
public class CarController {
	
	@Autowired 
	CarService CarService;
	
	@Autowired 
	BrandService BrandService;
	
	@Autowired 
	CategoryService CategoryService;
	
	@Autowired 
	EmployeeService EmployeeService;

	Map<String,Object> param = new HashMap<>();


	/**
	 * 汽车列表
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/CarList")
    public ModelAndView CarList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		String key = request.getParameter("key");
		Employee Employee = (Employee)request.getSession().getAttribute("employee");
		List<Car> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		maps.put("eid", Employee!=null?Employee.getId():null);
		PageHelper.startPage(currentPage,10); 
		list=CarService.selectCarList(maps);
		for(Car car:list) {
			car.setEmployee(EmployeeService.selectEmployeeById(car.getEid()));
			car.setCategory(CategoryService.selectCategoryById(car.getCid()));
			car.setBrand(BrandService.selectBrandById(car.getBid()));
		}
		PageInfo<Car> pageInfo=new PageInfo<Car>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/car/list");
	} 
	

	/**
	 * 去新增汽车
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toAddCar")
    public ModelAndView toAddCar(HttpServletRequest request,ModelAndView mv){
	    List<Category> categoryList = CategoryService.selectCategoryList(param);
	    List<Brand> brandList = BrandService.selectBrandList(param);
		mv.addObject("categoryList", categoryList);
		mv.addObject("brandList", brandList);
		mv.setViewName("view/car/add");
		return mv;
	}
	
	/**
	 * 新增汽车
	 * @param ss
	 * @return
	 */
	@RequestMapping("/addCar")
	@ResponseBody
	public boolean addCar(HttpServletRequest request,Car ss){
		Employee Employee = (Employee)request.getSession().getAttribute("employee");
		boolean re = false;
		if(Employee !=null) {
			ss.setEid(Employee.getId());
			ss.setCreate_time(new  SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
			CarService.addCar(ss);
			re = true;
		}
		return re;
	}
	
	/**
	 * 删除汽车
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteCar")
    public boolean deleteCar(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		CarService.deleteCar(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	/**
	 * 去修改汽车
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toUpdateCar")
    public ModelAndView toUpdateCar(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    Car ff = CarService.selectCarById(Integer.parseInt(id));
		mv.addObject("CarDate", ff);
		List<Category> categoryList = CategoryService.selectCategoryList(param);
	    List<Brand> brandList = BrandService.selectBrandList(param);
		mv.addObject("categoryList", categoryList);
		mv.addObject("brandList", brandList);
		mv.setViewName("view/car/update");
		return mv;
	}
	
	/**
	 * 去预约汽车
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toYyCar")
	public ModelAndView toYyCar(HttpServletRequest request,ModelAndView mv){
		String id=request.getParameter("id");
		String eid=request.getParameter("eid");
		mv.addObject("id", id);
		mv.addObject("eid", eid);
		mv.setViewName("view/car/yy");
		return mv;
	}
	
	/**
	 * 修改汽车
	 * @param ss
	 * @return
	 */
	@RequestMapping("/updateCar")
	@ResponseBody
	public boolean updateCar(Car ss){
		boolean re = false;
		CarService.updateCar(ss);
		re = true;
		return re;
	}

}
