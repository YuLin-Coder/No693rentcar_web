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
import com.rent.entity.Employee;
import com.rent.service.EmployeeService;

@RestController
public class EmployeeController {
	
	@Autowired 
	EmployeeService EmployeeService;


	@RequestMapping("/EmployeeList")
    public ModelAndView EmployeeList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		Employee Employee = (Employee)request.getSession().getAttribute("employee");
		String key = request.getParameter("key");
		List<Employee> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		maps.put("uid", Employee!=null?Employee.getId():null);
		PageHelper.startPage(currentPage,10); 
		list=EmployeeService.selectEmployeeList(maps);
		PageInfo<Employee> pageInfo=new PageInfo<Employee>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/employee/list");
	} 
	
	

	@RequestMapping("/toAddEmployee")
    public ModelAndView toAddEmployee(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/employee/add");
		return mv;
	}
	
	@RequestMapping("/addEmployee")
	@ResponseBody
	public boolean addEmployee(Employee ss){
		ss.setCreate_date(new  SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		boolean re = false;
		Employee Employee = EmployeeService.selectEmployeeByKey(ss.getEno());
		if(Employee == null) {
			EmployeeService.addEmployee(ss);
			re = true;
		}
		return re;
	}
	
	@RequestMapping("/deleteEmployee")
    public boolean deleteEmployee(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		EmployeeService.deleteEmployee(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	
	@RequestMapping("/toUpdateEmployee")
    public ModelAndView toUpdateEmployee(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    Employee ff = EmployeeService.selectEmployeeById(Integer.parseInt(id));
		mv.addObject("EmployeeDate", ff);
		mv.setViewName("view/employee/update");
		return mv;
	}
	
	
	@RequestMapping("/updateEmployee")
	@ResponseBody
	public boolean updateEmployee(Employee ss){
		boolean re = false;
		EmployeeService.updateEmployee(ss);
		re = true;
		return re;
	}

}
