package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.SmrzDao;
import com.rent.entity.Admin;
import com.rent.entity.Smrz;
import com.rent.service.SmrzService;

@Service
public class SmrzServiceImpl implements SmrzService{
	
	@Autowired 
	SmrzDao dao;


	public List<Smrz> selectSmrzList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectSmrzList(maps);
	}

	public void addSmrz(Smrz ss) {
		// TODO Auto-generated method stub
		dao.addSmrz(ss);
	}

	public void deleteSmrz(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteSmrz(parseInt);
	}


	public void updateSmrz(Smrz ss) {
		// TODO Auto-generated method stub
		dao.updateSmrz(ss);
	}

	@Override
	public Smrz selectSmrzById(int id) {
		
		return dao.selectSmrzById(id);
	}

	@Override
	public Smrz selectSrmzByUid(Integer id) {
		// TODO Auto-generated method stub
		return dao.selectSrmzByUid(id);
	}




}
