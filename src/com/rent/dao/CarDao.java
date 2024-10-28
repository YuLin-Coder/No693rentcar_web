package com.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rent.entity.Admin;
import com.rent.entity.Car;

public interface CarDao {



	List<Car> selectCarList(@Param("map") Map<String, Object> maps);

	void addCar(@Param("cc")  Car ss);

	void deleteCar(@Param("id") int parseInt);

	Car selectCarById(@Param("id")  Integer id);

	void updateCar(@Param("cc") Car ss);



}
