package com.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rent.entity.Admin;
import com.rent.entity.Smrz;

public interface SmrzDao {



	List<Smrz> selectSmrzList(@Param("map") Map<String, Object> maps);

	void addSmrz(@Param("cc")  Smrz ss);

	void deleteSmrz(@Param("id") int parseInt);

	Smrz selectSmrzById(@Param("id")  Integer id);

	void updateSmrz(@Param("cc") Smrz ss);

	Smrz selectSrmzByUid(@Param("id") Integer id);



}
