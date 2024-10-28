package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.Category;

public interface CategoryService {

	List<Category> selectCategoryList(Map<String, Object> maps);


	void addCategory(Category ss);

	void deleteCategory(int parseInt);

	Category selectCategoryById(int parseInt);

	void updateCategory(Category ss);
	
	

}
