package com.rent.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.rent.entity.Admin;
import com.rent.entity.Appointment;
import com.rent.entity.Statics;

public interface AppointmentDao {



	List<Appointment> selectAppointmentList(@Param("map") Map<String, Object> maps);

	void addAppointment(@Param("cc")  Appointment ss);

	void deleteAppointment(@Param("id") int parseInt);

	Appointment selectAppointmentById(@Param("id")  Integer id);

	void updateAppointment(@Param("cc") Appointment ss);

	List<Statics> selectAppStatics();



}
