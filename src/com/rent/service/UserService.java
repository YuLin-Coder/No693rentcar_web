package com.rent.service;

import java.util.List;
import java.util.Map;

import com.rent.entity.Admin;
import com.rent.entity.User;

public interface UserService {

	Admin selectAdmin(Admin admin);

	User selectUser(User u);

	List<User> selectUserList(Map<String, Object> maps);

	User selectUserByUserName(String phone);

	void addUser(User ss);

	void deleteUser(int parseInt);

	User selectUserById(int parseInt);

	void updateAdminPassword(String newpass, Integer id);

	void updateUser(User ss);

	void updateUserStatus(User user);
	
	

}
