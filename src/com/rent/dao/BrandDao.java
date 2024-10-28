package com.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rent.entity.Admin;
import com.rent.entity.Brand;

public interface BrandDao {


	Brand selectBrand(@Param("Brand") Brand Brand);

	List<Brand> selectBrandList(@Param("map") Map<String, Object> maps);

	void addBrand(@Param("cc")  Brand ss);

	void deleteBrand(@Param("id") int parseInt);

	Brand selectBrandById(@Param("id")  Integer id);

	void updateBrand(@Param("cc") Brand ss);

	Brand selectBrandByKey(@Param("key") String key);


}
