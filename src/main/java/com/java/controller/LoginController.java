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

import com.java.bean.Admin;
import com.java.bean.Consultant;
import com.java.bean.Instruction;
import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.bean.Staff;
import com.java.bean.Patient;
import com.java.bean.User;
import com.java.dao.ConsultantDao;
import com.java.dao.PatientDao;
import com.java.dao.UserDao;
import com.java.dao.ServiceDao;
import com.java.dao.InstructionDao;
import com.java.dao.ServiceTypeDao;

@Controller
public class LoginController {

	@Autowired
	UserDao userDao;
	
	String role;
	
	@RequestMapping("/")
	public String showLoginPage(Model m,HttpSession session) {
		
		m.addAttribute("user",new User());
		return "uservalidate/login";
	}
	
	@RequestMapping("/signout")
	public String logout(Model m,HttpSession session) {
		if(session.getAttribute("adminSession")!= null) {
			session.removeAttribute("adminSession");
			session.invalidate();
		}
		else if(session.getAttribute("staffSession")!= null) {
			session.removeAttribute("staffSession");
			session.invalidate();
		}
		else if(session.getAttribute("consultantSession")!= null) {
			session.removeAttribute("consultantSession");
			session.invalidate();
		}
		m.addAttribute("user",new User());
		return "uservalidate/login";
	}
	
	@RequestMapping(value = "/validateUser", method = RequestMethod.POST)
	public String validateUser(@ModelAttribute("user") User user, HttpSession session, Model m, RedirectAttributes reAtt)
	        throws NoSuchAlgorithmException, IOException {

	    int result = userDao.authenticateUser(user);
	    if (result >= 1) {
	        user = userDao.getUser(user);
	        String role = user.getUserRole();
	        System.out.print(role);

	        if (result >= 1 && role.equals("Admin")) {
				m.addAttribute("user", new User());
				
				session.setAttribute("adminSession", user);
				return "redirect:/admin_home";

			} else if (result >= 1 && role.equals("staff")) {
				session.setAttribute("staffSession", user);
				return "redirect:/staff_home";
			} else if (result >= 1 && role.equals("consultant")) {
				session.setAttribute("consultantSession", user);
				return "redirect:/consultant_home";
			}
			 else {
		            // Invalid role, show error message
		            String message = "Invalid role for the user.";
		            reAtt.addFlashAttribute("resultFlag", 0);
		            reAtt.addFlashAttribute("message", message);
		            return "redirect:/login";
		        }
		    } else {
		        // Authentication failed, show error message
		        String message = "Invalid email or password.";
		        reAtt.addFlashAttribute("resultFlag", 0);
		        reAtt.addFlashAttribute("message", message);
		        return "redirect:/login";
		    }
		}
	
	@RequestMapping("/login")
	public String showLogin(Model m) {
		
		m.addAttribute("user",new User());
		return "uservalidate/login";
	}
	
	@RequestMapping("/logout")
	public String showLogoutPage(Model m) {
		
		m.addAttribute("user",new User());
		return "uservalidate/login";
	}
}