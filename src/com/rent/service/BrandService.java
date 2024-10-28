package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.Brand;

public interface BrandService {

	Brand selectBrand(Brand u);

	List<Brand> selectBrandList(Map<String, Object> maps);

	Brand selectBrandByKey(String key);

	void addBrand(Brand ss);

	void deleteBrand(int parseInt);

	Brand selectBrandById(int parseInt);

	void updateBrand(Brand ss);
	
	

}
