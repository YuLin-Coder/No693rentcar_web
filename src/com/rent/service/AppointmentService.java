package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.Appointment;
import com.rent.entity.Statics;

public interface AppointmentService {

	List<Appointment> selectAppointmentList(Map<String, Object> maps);


	void addAppointment(Appointment ss);

	void deleteAppointment(int parseInt);

	Appointment selectAppointmentById(int parseInt);

	void updateAppointment(Appointment ss);


	List<Statics> selectAppStatics();
	
	

}
