package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.Ycxq;

public interface YcxqService {

	List<Ycxq> selectYcxqList(Map<String, Object> maps);


	void addYcxq(Ycxq ss);

	void deleteYcxq(int parseInt);

	Ycxq selectYcxqById(int parseInt);

	void updateYcxq(Ycxq ss);
	
	

}
