package com.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rent.entity.Admin;
import com.rent.entity.Ycxq;

public interface YcxqDao {



	List<Ycxq> selectYcxqList(@Param("map") Map<String, Object> maps);

	void addYcxq(@Param("cc")  Ycxq ss);

	void deleteYcxq(@Param("id") int parseInt);

	Ycxq selectYcxqById(@Param("id")  Integer id);

	void updateYcxq(@Param("cc") Ycxq ss);



}
