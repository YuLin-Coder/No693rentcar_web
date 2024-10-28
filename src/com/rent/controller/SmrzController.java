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
import com.rent.entity.Smrz;
import com.rent.entity.User;
import com.rent.service.SmrzService;
import com.rent.service.UserService;

@RestController
public class SmrzController {
	
	@Autowired 
	SmrzService SmrzService;
	
	@Autowired
	UserService userService;


	/**
	 * 实名认证列表
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/SmrzList")
    public ModelAndView SmrzList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		String key = request.getParameter("key");
		List<Smrz> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		PageHelper.startPage(currentPage,10); 
		list=SmrzService.selectSmrzList(maps);
		for(Smrz smrz : list) {
			smrz.setUser(userService.selectUserById(smrz.getUid()));
		}
		PageInfo<Smrz> pageInfo=new PageInfo<Smrz>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/smrz/list");
	} 
	

	/**
	 * 去新增实名认证
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toAddSmrz")
    public ModelAndView toAddSmrz(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/smrz/add");
		return mv;
	}
	
	/**
	 * 新增实名认证
	 * @param ss
	 * @return
	 */
	@RequestMapping("/addSmrz")
	@ResponseBody
	public boolean addSmrz(HttpServletRequest request , Smrz ss){
		boolean re = false;
		User user = (User)request.getSession().getAttribute("user");
	    if(user!=null) {
	    	Smrz smrz = SmrzService.selectSrmzByUid(user.getId());
	    	if(smrz == null) {
	    		ss.setUid(user.getId());
		    	SmrzService.addSmrz(ss);
		    	re = true;
	    	}
	    }
		return re;
	}
	
	/**
	 * 删除实名认证
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteSmrz")
    public boolean deleteSmrz(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		SmrzService.deleteSmrz(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	/**
	 * 去修改实名认证
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toUpdateSmrz")
    public ModelAndView toUpdateSmrz(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    Smrz ff = SmrzService.selectSmrzById(Integer.parseInt(id));
		mv.addObject("SmrzDate", ff);
		mv.setViewName("view/smrz/update");
		return mv;
	}
	
	/**
	 * 修改实名认证
	 * @param ss
	 * @return
	 */
	@RequestMapping("/updateSmrz")
	@ResponseBody
	public boolean updateSmrz(Smrz ss){
		boolean re = false;
		User user = new User();
		SmrzService.updateSmrz(ss);
        if(ss.getState().equals("1")) {
        	
        	user.setId(ss.getUid());
        	user.setStatus("1");
        	userService.updateUserStatus(user);
		}
		re = true;
		return re;
	}

}
