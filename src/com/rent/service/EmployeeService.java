package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.Employee;

public interface EmployeeService {

	Employee selectEmployee(Employee u);

	List<Employee> selectEmployeeList(Map<String, Object> maps);

	Employee selectEmployeeByKey(String key);

	void addEmployee(Employee ss);

	void deleteEmployee(int parseInt);

	Employee selectEmployeeById(int parseInt);

	void updateEmployee(Employee ss);
	
	

}
