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
import com.rent.entity.Category;
import com.rent.service.CategoryService;

@RestController
public class CategoryController {
	
	@Autowired 
	CategoryService CategoryService;


	/**
	 * 汽车品牌列表
	 * @param currentPage
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/CategoryList")
    public ModelAndView CategoryList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		String key = request.getParameter("key");
		List<Category> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("key", key);
		PageHelper.startPage(currentPage,10); 
		list=CategoryService.selectCategoryList(maps);
		PageInfo<Category> pageInfo=new PageInfo<Category>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", key);
		return new ModelAndView("view/category/list");
	} 
	

	/**
	 * 去新增汽车品牌
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toAddCategory")
    public ModelAndView toAddCategory(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/category/add");
		return mv;
	}
	
	/**
	 * 新增汽车品牌
	 * @param ss
	 * @return
	 */
	@RequestMapping("/addCategory")
	@ResponseBody
	public boolean addCategory(Category ss){
		boolean re = false;
		CategoryService.addCategory(ss);
		re = true;
		return re;
	}
	
	/**
	 * 删除汽车品牌
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/deleteCategory")
    public boolean deleteCategory(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		CategoryService.deleteCategory(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	/**
	 * 去修改汽车品牌
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping("/toUpdateCategory")
    public ModelAndView toUpdateCategory(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    Category ff = CategoryService.selectCategoryById(Integer.parseInt(id));
		mv.addObject("CategoryDate", ff);
		mv.setViewName("view/category/update");
		return mv;
	}
	
	/**
	 * 修改汽车品牌
	 * @param ss
	 * @return
	 */
	@RequestMapping("/updateCategory")
	@ResponseBody
	public boolean updateCategory(Category ss){
		boolean re = false;
		CategoryService.updateCategory(ss);
		re = true;
		return re;
	}

}
