package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.BrandDao;
import com.rent.entity.Admin;
import com.rent.entity.Brand;
import com.rent.service.BrandService;

@Service
public class BrandServiceImpl implements BrandService{
	
	@Autowired 
	BrandDao dao;


	public Brand selectBrand(Brand Brand) {
		// TODO Auto-generated method stub
		return dao.selectBrand(Brand);
	}

	public List<Brand> selectBrandList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectBrandList(maps);
	}

	public void addBrand(Brand ss) {
		// TODO Auto-generated method stub
		dao.addBrand(ss);
	}

	public void deleteBrand(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteBrand(parseInt);
	}


	public void updateBrand(Brand ss) {
		// TODO Auto-generated method stub
		dao.updateBrand(ss);
	}

	public Brand selectBrandByKey(String key) {
		// TODO Auto-generated method stub
		return dao.selectBrandByKey(key);
	}
	
	@Override
	public Brand selectBrandById(int id) {
		
		return dao.selectBrandById(id);
	}




}
