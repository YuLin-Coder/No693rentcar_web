package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.EmployeeDao;
import com.rent.entity.Admin;
import com.rent.entity.Employee;
import com.rent.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService{
	
	@Autowired 
	EmployeeDao dao;


	public Employee selectEmployee(Employee Employee) {
		// TODO Auto-generated method stub
		return dao.selectEmployee(Employee);
	}

	public List<Employee> selectEmployeeList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectEmployeeList(maps);
	}

	public void addEmployee(Employee ss) {
		// TODO Auto-generated method stub
		dao.addEmployee(ss);
	}

	public void deleteEmployee(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteEmployee(parseInt);
	}


	public void updateEmployee(Employee ss) {
		// TODO Auto-generated method stub
		dao.updateEmployee(ss);
	}

	public Employee selectEmployeeByKey(String key) {
		// TODO Auto-generated method stub
		return dao.selectEmployeeByKey(key);
	}
	
	@Override
	public Employee selectEmployeeById(int id) {
		
		return dao.selectEmployeeById(id);
	}




}
