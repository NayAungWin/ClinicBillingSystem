package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.bean.Consultant;
import com.java.bean.User;
import com.java.dao.UserDao;
@Controller
public class UserController {
	@Autowired
	UserDao userDao;
	
	@RequestMapping("/addUser")
	public String showUserAddPage(Model m) {
		m.addAttribute("user", new User());
		return "admin/addUser";
	}
	
	
	@RequestMapping(value ="/addUser", method = RequestMethod.POST)	
	public String saveUser(@ModelAttribute("user") User user,RedirectAttributes reAtt) throws NoSuchAlgorithmException, IOException {
		userDao.addUser(user);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Add User Information");
		return "redirect:/userLists";
	}
	
	@RequestMapping("/userLists")
	public String showUserListPage(Model m) {
		m.addAttribute("user", new User());
		
		List<User> list = userDao.getUserList();
		m.addAttribute("list",list);	
		
		return "admin/userLists";
	}
	
	@RequestMapping(value = "/deletUser/{userId}", method = RequestMethod.GET)
	public String deletUser(@PathVariable String userId, Model m,RedirectAttributes reAtt) {
		userDao.deleteUser(userId);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Delete User Information");
			return "redirect:/userLists";
		}
	
	@RequestMapping(value = "/editUser/{userId}")
	public String editUser(@PathVariable int userId, Model m) {	
		
		User user = userDao.getUserById(userId);
		m.addAttribute("user", user);
			
		return "admin/editUser";
	}
	
	@RequestMapping(value = "/editsaveUser", method = RequestMethod.POST)
	public String editsaveUser(@ModelAttribute("user") User user,RedirectAttributes reAtt) {
		userDao.updateUser(user);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Update User Information");
		return "redirect:/userLists";
	}
}
