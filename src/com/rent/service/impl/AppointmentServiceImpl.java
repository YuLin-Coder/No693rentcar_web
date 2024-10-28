package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.AppointmentDao;
import com.rent.entity.Admin;
import com.rent.entity.Appointment;
import com.rent.entity.Statics;
import com.rent.service.AppointmentService;

@Service
public class AppointmentServiceImpl implements AppointmentService{
	
	@Autowired 
	AppointmentDao dao;


	public List<Appointment> selectAppointmentList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectAppointmentList(maps);
	}

	public void addAppointment(Appointment ss) {
		// TODO Auto-generated method stub
		dao.addAppointment(ss);
	}

	public void deleteAppointment(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteAppointment(parseInt);
	}


	public void updateAppointment(Appointment ss) {
		// TODO Auto-generated method stub
		dao.updateAppointment(ss);
	}

	@Override
	public Appointment selectAppointmentById(int id) {
		
		return dao.selectAppointmentById(id);
	}

	@Override
	public List<Statics> selectAppStatics() {
		// TODO Auto-generated method stub
		return dao.selectAppStatics();
	}




}
