package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.Car;

public interface CarService {

	List<Car> selectCarList(Map<String, Object> maps);


	void addCar(Car ss);

	void deleteCar(int parseInt);

	Car selectCarById(int parseInt);

	void updateCar(Car ss);
	
	

}
