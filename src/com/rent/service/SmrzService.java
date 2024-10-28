package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.Smrz;

public interface SmrzService {

	List<Smrz> selectSmrzList(Map<String, Object> maps);


	void addSmrz(Smrz ss);

	void deleteSmrz(int parseInt);

	Smrz selectSmrzById(int parseInt);

	void updateSmrz(Smrz ss);


	Smrz selectSrmzByUid(Integer id);
	
	

}
