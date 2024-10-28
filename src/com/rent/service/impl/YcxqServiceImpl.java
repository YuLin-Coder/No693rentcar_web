package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.YcxqDao;
import com.rent.entity.Admin;
import com.rent.entity.Ycxq;
import com.rent.service.YcxqService;

@Service
public class YcxqServiceImpl implements YcxqService{
	
	@Autowired 
	YcxqDao dao;


	public List<Ycxq> selectYcxqList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectYcxqList(maps);
	}

	public void addYcxq(Ycxq ss) {
		// TODO Auto-generated method stub
		dao.addYcxq(ss);
	}

	public void deleteYcxq(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteYcxq(parseInt);
	}


	public void updateYcxq(Ycxq ss) {
		// TODO Auto-generated method stub
		dao.updateYcxq(ss);
	}

	@Override
	public Ycxq selectYcxqById(int id) {
		
		return dao.selectYcxqById(id);
	}




}
