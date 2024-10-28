package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.OrdersDao;
import com.rent.entity.Admin;
import com.rent.entity.Ht;
import com.rent.entity.Orders;
import com.rent.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService{
	
	@Autowired 
	OrdersDao dao;


	public List<Orders> selectOrdersList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectOrdersList(maps);
	}

	public void addOrders(Orders ss) {
		// TODO Auto-generated method stub
		dao.addOrders(ss);
	}

	public void deleteOrders(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteOrders(parseInt);
	}


	public void updateOrders(Orders ss) {
		// TODO Auto-generated method stub
		dao.updateOrders(ss);
	}

	@Override
	public Orders selectOrdersById(int id) {
		
		return dao.selectOrdersById(id);
	}

	@Override
	public void addHt(Ht ht) {
		// TODO Auto-generated method stub
		dao.addHt(ht);
	}

	@Override
	public Ht selectHtByOid(Integer id) {
		// TODO Auto-generated method stub
		return dao.selectHtByOid(id);
	}

	@Override
	public List<Ht> selectHtList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectHtList(maps);
	}

	@Override
	public void deleteHt(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteHt(parseInt);
	}




}
