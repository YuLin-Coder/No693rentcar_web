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
import com.rent.service.BrandService;

@RestController
public class BrandController {
	
	@Autowired 
	BrandService BrandService;


	@RequestMapping("/BrandList")
    public ModelAndView BrandList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		String key = request.getParameter("key");
		List<Brand> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		PageHelper.startPage(currentPage,10); 
		list=BrandService.selectBrandList(maps);
		PageInfo<Brand> pageInfo=new PageInfo<Brand>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/brand/list");
	} 
	
	

	@RequestMapping("/toAddBrand")
    public ModelAndView toAddBrand(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/brand/add");
		return mv;
	}
	
	@RequestMapping("/addBrand")
	@ResponseBody
	public boolean addBrand(Brand ss){
		boolean re = false;
		Brand Brand = BrandService.selectBrandByKey(ss.getBname());
		if(Brand == null) {
			BrandService.addBrand(ss);
			re = true;
		}
		return re;
	}
	
	@RequestMapping("/deleteBrand")
    public boolean deleteBrand(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		BrandService.deleteBrand(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	
	@RequestMapping("/toUpdateBrand")
    public ModelAndView toUpdateBrand(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    Brand ff = BrandService.selectBrandById(Integer.parseInt(id));
		mv.addObject("BrandDate", ff);
		mv.setViewName("view/brand/update");
		return mv;
	}
	
	
	@RequestMapping("/updateBrand")
	@ResponseBody
	public boolean updateBrand(Brand ss){
		boolean re = false;
		BrandService.updateBrand(ss);
		re = true;
		return re;
	}

}
