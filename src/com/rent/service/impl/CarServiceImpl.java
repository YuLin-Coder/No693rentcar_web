package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.CarDao;
import com.rent.entity.Admin;
import com.rent.entity.Car;
import com.rent.service.CarService;

@Service
public class CarServiceImpl implements CarService{
	
	@Autowired 
	CarDao dao;


	public List<Car> selectCarList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectCarList(maps);
	}

	public void addCar(Car ss) {
		// TODO Auto-generated method stub
		dao.addCar(ss);
	}

	public void deleteCar(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteCar(parseInt);
	}


	public void updateCar(Car ss) {
		// TODO Auto-generated method stub
		dao.updateCar(ss);
	}

	@Override
	public Car selectCarById(int id) {
		
		return dao.selectCarById(id);
	}




}
