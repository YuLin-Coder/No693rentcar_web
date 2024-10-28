package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.Ht;
import com.rent.entity.Orders;

public interface OrdersService {

	List<Orders> selectOrdersList(Map<String, Object> maps);


	void addOrders(Orders ss);

	void deleteOrders(int parseInt);

	Orders selectOrdersById(int parseInt);

	void updateOrders(Orders ss);


	void addHt(Ht ht);


	Ht selectHtByOid(Integer id);


	List<Ht> selectHtList(Map<String, Object> maps);


	void deleteHt(int parseInt);
	
	

}
