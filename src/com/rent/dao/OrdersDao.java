package com.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rent.entity.Admin;
import com.rent.entity.Ht;
import com.rent.entity.Orders;

public interface OrdersDao {



	List<Orders> selectOrdersList(@Param("map") Map<String, Object> maps);

	void addOrders(@Param("cc")  Orders ss);

	void deleteOrders(@Param("id") int parseInt);

	Orders selectOrdersById(@Param("id")  Integer id);

	void updateOrders(@Param("cc") Orders ss);

	void addHt(@Param("cc") Ht ht);

	Ht selectHtByOid(@Param("id") Integer id);

	List<Ht> selectHtList(@Param("map") Map<String, Object> maps);

	void deleteHt(@Param("id") int parseInt);



}
