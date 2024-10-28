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
import com.rent.entity.Ycxq;
import com.rent.service.BrandService;
import com.rent.service.CategoryService;
import com.rent.service.YcxqService;

@RestController
public class YcxqController {
	
	@Autowired 
	YcxqService YcxqService;
	
	@Autowired 
	CategoryService categoryService;
	
	@Autowired 
	BrandService brandService;


	/**
	 * 用车需求列表
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/YcxqList")
    public ModelAndView YcxqList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		String key = request.getParameter("key");
		List<Ycxq> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		PageHelper.startPage(currentPage,10); 
		list=YcxqService.selectYcxqList(maps);
		for(Ycxq ycxq: list) {
			ycxq.setBrand(brandService.selectBrandById(ycxq.getBid()));
			ycxq.setCategory(categoryService.selectCategoryById(ycxq.getCid()));
		}
		PageInfo<Ycxq> pageInfo=new PageInfo<Ycxq>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/ycxq/list");
	} 
	

	/**
	 * 去新增用车需求
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toAddYcxq")
    public ModelAndView toAddYcxq(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/ycxq/add");
		return mv;
	}
	
	/**
	 * 新增用车需求
	 * @param ss
	 * @return
	 */
	@RequestMapping("/addYcxq")
	@ResponseBody
	public boolean addYcxq(Ycxq ss){
		boolean re = false;
		YcxqService.addYcxq(ss);
		re = true;
		return re;
	}
	
	/**
	 * 删除用车需求
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteYcxq")
    public boolean deleteYcxq(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		YcxqService.deleteYcxq(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	/**
	 * 去修改用车需求
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toUpdateYcxq")
    public ModelAndView toUpdateYcxq(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    Ycxq ff = YcxqService.selectYcxqById(Integer.parseInt(id));
		mv.addObject("YcxqDate", ff);
		mv.setViewName("view/ycxq/update");
		return mv;
	}
	
	/**
	 * 修改用车需求
	 * @param ss
	 * @return
	 */
	@RequestMapping("/updateYcxq")
	@ResponseBody
	public boolean updateYcxq(Ycxq ss){
		boolean re = false;
		YcxqService.updateYcxq(ss);
		re = true;
		return re;
	}

}
