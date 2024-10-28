package com.rent.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rent.entity.Admin;
import com.rent.entity.Employee;
import com.rent.entity.User;
import com.rent.service.EmployeeService;
import com.rent.service.UserService;

@RestController
public class UserController {
	
	@Autowired 
	UserService userService;

	@Autowired 
	EmployeeService EmployeeService;
	
	/**
	 * �登录
	 * @param username
	 * @param request
	 * @param password
	 * @param session
	 * @param response
	 * @param mv
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("/login")
	@ResponseBody
     public String login(@RequestParam("username")String username,
    		 HttpServletRequest request,@RequestParam("password")String password,
    		 HttpSession session,HttpServletResponse response,ModelAndView mv) throws ServletException, IOException {	
		String message = "error";
		session.removeAttribute("admin");
		session.removeAttribute("user");
	    String type=request.getParameter("type").toString();
	    Admin admin = new Admin();
		request.getSession().setAttribute("type", type);
		boolean re = false;
	    if(type != null && type.equals("1")){
	    	admin.setUsername(username);
	    	admin.setPassword(password);
		    Admin admin1 = userService.selectAdmin(admin);
		    if(admin1 != null){
				request.getSession().setAttribute("admin", admin1);
				session.setAttribute("admin", admin1);
				message = "toMain";
		    }
	    }
	    else if(type != null && type.equals("2")){
	    	Employee data = new Employee();
	    	data.setEno(username);
	    	data.setPwd(password);
	    	Employee Employee = EmployeeService.selectEmployee(data);
	    	if(Employee != null){
				request.getSession().setAttribute("employee", Employee);
				session.setAttribute("employee", Employee);
				message = "toMain";
		    }
	    }
	    else if(type != null && type.equals("3")){
	    	User u = new User();
	    	u.setPhone(username);
	    	u.setPassword(password);
	    	User user = userService.selectUser(u);
	    	if(user != null){
				request.getSession().setAttribute("user", user);
				session.setAttribute("user", user);
				message = "toIndex";
		    }
	    }
		return message;
			
	}
	

	@RequestMapping("/userList")
    public ModelAndView UserList(
			@RequestParam(defaultValue="1") Integer currentPage,HttpServletRequest request,
			Map<String,Object> map){
		User user = (User)request.getSession().getAttribute("user");
		String userName = request.getParameter("key");
		List<User> list = new ArrayList<>();
		Map<String,Object> maps = new HashMap<>();
		maps.put("username", userName);
		maps.put("uid", user!=null?user.getId():null);
		PageHelper.startPage(currentPage,10); 
		list=userService.selectUserList(maps);
		PageInfo<User> pageInfo=new PageInfo<User>(list,8);
		map.put("pageInfo", pageInfo);
		map.put("key", userName);
		return new ModelAndView("view/user/list");
	} 
	
	

	@RequestMapping("/toAddUser")
    public ModelAndView toAddUser(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/user/add");
		return mv;
	}
	
	
	@RequestMapping("/toRegister")
	public ModelAndView toRegister(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/user/reg");
		return mv;
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public boolean addUser(User ss){
		ss.setTimes(new  SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
		boolean re = false;
		User user = userService.selectUserByUserName(ss.getPhone());
		if(user == null) {
			userService.addUser(ss);
			re = true;
		}
		return re;
	}
	
	@RequestMapping("/deleteUser")
    public boolean deleteUser(HttpServletRequest request,
			HttpServletResponse response){
		boolean re = false;
		String id = request.getParameter("id");
		userService.deleteUser(Integer.parseInt(id));
		re = true;
	    return re;
	}
	
	
	@RequestMapping("/toUpdateUser")
    public ModelAndView toUpdateUser(HttpServletRequest request,ModelAndView mv){
	    String id=request.getParameter("id");
	    User ff = userService.selectUserById(Integer.parseInt(id));
		mv.addObject("userDate", ff);
		mv.setViewName("view/user/update");
		return mv;
	}
	
	@RequestMapping("/toUpdateAdminPassword")
    public ModelAndView toUpdateAdminPassword(HttpServletRequest request,ModelAndView mv){
		mv.setViewName("view/admin/updatePassword");
		return mv;
	}
	

	@RequestMapping("/updateAdminPassword")
	@ResponseBody
	public boolean updateAdminPassword(HttpServletRequest request){
		boolean re = false;
		Admin admin = (Admin)request.getSession().getAttribute("admin");
		String nowpass = request.getParameter("nowpass");
		String newpass = request.getParameter("newpass");
		if(admin !=null && admin.getPassword().equals(nowpass)) {
			userService.updateAdminPassword(newpass,admin.getId());
			re = true;
		}
		return re;
	}
	
	@RequestMapping("/updateUser")
	@ResponseBody
	public boolean updateUser(User ss){
		boolean re = false;
		userService.updateUser(ss);
		re = true;
		return re;
	}

}
