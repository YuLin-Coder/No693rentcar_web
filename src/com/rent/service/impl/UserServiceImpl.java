package com.rent.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rent.dao.UserDao;
import com.rent.entity.Admin;
import com.rent.entity.User;
import com.rent.service.UserService;

@Service
public class UserServiceImpl implements UserService{
	
	@Autowired 
	UserDao dao;

	public Admin selectAdmin(Admin admin) {
		// TODO Auto-generated method stub
		return dao.selectAdmin(admin);
	}

	public User selectUser(User user) {
		// TODO Auto-generated method stub
		return dao.selectUser(user);
	}

	public List<User> selectUserList(Map<String, Object> maps) {
		// TODO Auto-generated method stub
		return dao.selectUserList(maps);
	}

	public void addUser(User ss) {
		// TODO Auto-generated method stub
		dao.addUser(ss);
	}

	public void deleteUser(int parseInt) {
		// TODO Auto-generated method stub
		dao.deleteUser(parseInt);
	}



	public void updateUser(User ss) {
		// TODO Auto-generated method stub
		dao.updateUser(ss);
	}

	public User selectUserByUserName(String username) {
		// TODO Auto-generated method stub
		return dao.selectUserByUserName(username);
	}

	public void updateAdminPassword(String newpass, Integer id) {
		// TODO Auto-generated method stub
		dao.updateAdminPassword(newpass,id);
	}

	@Override
	public User selectUserById(int id) {
		
		return dao.selectUserById(id);
	}

	@Override
	public void updateUserStatus(User user) {
		// TODO Auto-generated method stub
		dao.updateUserStatus(user);
	}




}
