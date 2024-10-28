package com.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rent.entity.Admin;
import com.rent.entity.Employee;

public interface EmployeeDao {


	Employee selectEmployee(@Param("Employee") Employee Employee);

	List<Employee> selectEmployeeList(@Param("map") Map<String, Object> maps);

	void addEmployee(@Param("cc")  Employee ss);

	void deleteEmployee(@Param("id") int parseInt);

	Employee selectEmployeeById(@Param("id")  Integer id);

	void updateEmployee(@Param("cc") Employee ss);

	Employee selectEmployeeByKey(@Param("key") String key);


}
