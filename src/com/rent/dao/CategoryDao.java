package com.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rent.entity.Admin;
import com.rent.entity.Category;

public interface CategoryDao {



	List<Category> selectCategoryList(@Param("map") Map<String, Object> maps);

	void addCategory(@Param("cc")  Category ss);

	void deleteCategory(@Param("id") int parseInt);

	Category selectCategoryById(@Param("id")  Integer id);

	void updateCategory(@Param("cc") Category ss);



}
