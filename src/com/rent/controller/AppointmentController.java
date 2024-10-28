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
import com.rent.entity.Appointment;
import com.rent.entity.Employee;
import com.rent.entity.Statics;
import com.rent.entity.User;
import com.rent.service.AppointmentService;
import com.rent.service.CarService;
import com.rent.service.UserService;

@RestController
public class AppointmentController {
	
	@Autowired 
	AppointmentService AppointmentService;
	@Autowired 
	CarService carService;
	@Autowired
	UserService userService;


	/**
	 * 汽车预约列表
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/AppointmentList")
    public ModelAndView AppointmentList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		Employee Employee = (Employee)request.getSession().getAttribute("employee");
		String key = request.getParameter("key");
		List<Appointment> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		maps.put("uid", Employee!=null?Employee.getId():null);

		PageHelper.startPage(currentPage,10); 
		list=AppointmentService.selectAppointmentList(maps);
		for(Appointment aa : list) {
			aa.setCar(carService.selectCarById(aa.getCid()));
			aa.setUser(userService.selectUserById(aa.getUid()));
		}
		PageInfo<Appointment> pageInfo=new PageInfo<Appointment>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/appointment/list");
	} 
	

	/**
	 * 去新增汽车预约
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toAddAppointment")
    public ModelAndView toAddAppointment(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/appointment/add");
		return mv;
	}
	
	/**
	 * 新增汽车预约
	 * @param ss
	 * @return
	 */
	@RequestMapping("/addAppointment")
	@ResponseBody
	public boolean addAppointment(HttpServletRequest request, Appointment ss){
		boolean re = false;
		User user = (User)request.getSession().getAttribute("user");
		if(user != null) {
			ss.setUid(user.getId());
			AppointmentService.addAppointment(ss);
			re = true;
		}
		return re;
	}
	
	/**
	 * 删除汽车预约
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteAppointment")
    public boolean deleteAppointment(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		AppointmentService.deleteAppointment(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	/**
	 * 去修改汽车预约
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toUpdateAppointment")
    public ModelAndView toUpdateAppointment(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    Appointment ff = AppointmentService.selectAppointmentById(Integer.parseInt(id));
		mv.addObject("AppointmentDate", ff);
		mv.setViewName("view/appointment/update");
		return mv;
	}
	
	/**
	 * 修改汽车预约
	 * @param ss
	 * @return
	 */
	@RequestMapping("/updateAppointment")
	@ResponseBody
	public boolean updateAppointment(Appointment ss){
		boolean re = false;
		AppointmentService.updateAppointment(ss);
		re = true;
		return re;
	}
	/**
	 * 修改汽车预约
	 * @param ss
	 * @return
	 */
	@RequestMapping("/selectAppStatics")
	@ResponseBody
	public List<Statics> selectAppStatics(){
		return AppointmentService.selectAppStatics();
	}

}
