package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.CategoryDao;
import com.rent.entity.Admin;
import com.rent.entity.Category;
import com.rent.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{
	
	@Autowired 
	CategoryDao dao;


	public List<Category> selectCategoryList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectCategoryList(maps);
	}

	public void addCategory(Category ss) {
		// TODO Auto-generated method stub
		dao.addCategory(ss);
	}

	public void deleteCategory(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteCategory(parseInt);
	}


	public void updateCategory(Category ss) {
		// TODO Auto-generated method stub
		dao.updateCategory(ss);
	}

	@Override
	public Category selectCategoryById(int id) {
		
		return dao.selectCategoryById(id);
	}




}
