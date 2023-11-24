package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
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
import com.java.bean.Patient;
import com.java.bean.Staff;
import com.java.bean.User;
import com.java.dao.AdminDao;
import com.java.dao.AppointmentDao;
import com.java.dao.ConsultantDao;
import com.java.dao.PatientDao;
import com.java.dao.VoucherDao;

@Controller
public class AdminController {
	@Autowired
	AdminDao adminDao;
	@Autowired
	ConsultantDao consultantDao;
	@Autowired
	PatientDao patientDao;
	@Autowired
	AppointmentDao appointmentDao;
	@Autowired
	VoucherDao voucherDao;
	
	@RequestMapping("/admin_home")
	public String home(Model m,HttpSession httpSession) {
		m.addAttribute("consultant", new Consultant());
		m.addAttribute("patient", new Patient());
		m.addAttribute("flag",0);	
		
		List<Consultant> list = consultantDao.getConsultant();
		m.addAttribute("list",list);
		
		int patientCount=patientDao.getPatientCount();
		httpSession.setAttribute("patientCount", patientCount);
		int consultantCount=consultantDao.getConsultantCount();
		httpSession.setAttribute("consultantCount", consultantCount);
		int appointmentCount=appointmentDao.getAppointmentCount();
		httpSession.setAttribute("appointmentCount", appointmentCount);
		int invoiceCount=voucherDao.getVoucherCount();
		httpSession.setAttribute("invoiceCount", invoiceCount);

		
		return "admin/admin_home";
	}
	
	@RequestMapping("adminProfile")
	public String showAdminAddForm(Model m) {
		m.addAttribute("admin", new Admin());
		return "adminProfile";
	}
	
	@RequestMapping(value = "adminProfile", method = RequestMethod.POST)
	public String saveAdmin(@ModelAttribute("admin") Admin admin, RedirectAttributes reAtt)
			throws NoSuchAlgorithmException, IOException {

		int i = adminDao.checkAdminDuplicate(admin);

		if (i > 0) {
			String message = "Already exist adminEmail for Admin registeration!";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 0);
			return "redirect:/adminProfile";
		} else {
			adminDao.insertAdmin(admin);
			String message = "Successfully create new Admin";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 1);
			return "redirect:/adminProfile";
		}
	}
	
	@RequestMapping("/admin_profile")
	public String adminProfile(Model m,HttpSession httpSession) {
		
		m.addAttribute("admin", new Admin());
		User user = (User) httpSession.getAttribute("adminSession");
		User adminInfo = adminDao.getAdminById(user.getUserId());
		m.addAttribute("user", adminInfo);
		
		return "admin/admin_Profile";
	}
	
	@RequestMapping("/editAdminProfile")
	public String adminProfileUpdate(Model m,HttpSession httpSession) {
		
		m.addAttribute("admin", new Admin());
		User user = (User) httpSession.getAttribute("adminSession");
		User adminInfo = adminDao.getAdminById(user.getUserId());
		m.addAttribute("user", adminInfo);
		
		return "admin/editAdminProfile";
	}
	
	@RequestMapping(value = "/adminProfilesaveUpdate", method = RequestMethod.POST)
	public String adminProfilesaveUpdate(@ModelAttribute("user") User user, Model m,HttpSession httpSession, RedirectAttributes reAtt)
			throws NoSuchAlgorithmException, IOException {
			User user1 = (User) httpSession.getAttribute("adminSession");
			user.setUserId(user1.getUserId());
		if (adminDao.updateAdmin(user) == 1) {
			String message = "Successfully Update profile";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 1);	
			return "redirect:/admin_profile";
		} else {
			String message = "Can't update";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 0);
			return "redirect:/admin_profile";
		}

	}
	
	@RequestMapping("/changePassword")
	public String changePassword(Model m,HttpSession httpSession) {
		
		m.addAttribute("user", new User());
		User user = (User) httpSession.getAttribute("adminSession");
		User adminIdInfo = adminDao.getAdminUserById(user.getUserId());
		m.addAttribute("user", adminIdInfo);
		
		return "admin/adminChangePassword";
	}
	
	@RequestMapping(value = "/updateAdminPassword", method = RequestMethod.POST)
	public String changePassword(@ModelAttribute("adminUpdate") Admin admin,@ModelAttribute("User") User user, Model m, RedirectAttributes reAtt,HttpSession httpSession)
			throws NoSuchAlgorithmException, IOException {

		String newPassword = admin.getNewPassword();
		String confirmPassword = admin.getConfirmPassword();
		
		System.out.println(user.getUserId());
		boolean result = newPassword.equals(confirmPassword);
		System.out.println(user.getUserPassword());
		System.out.println(newPassword);
		System.out.println(confirmPassword);
		
		if (adminDao.authenticateAdmin(user) == 1) {
			if (result) {
				adminDao.updateAdminPassword(user);
				String message = "Successfully Update password";
				reAtt.addFlashAttribute("message", message);
				reAtt.addFlashAttribute("resultFlag", 1);
				return "redirect:/admin_profile";
			} else {
				String message = "Doesn't match password!";
				reAtt.addFlashAttribute("message", message);
				reAtt.addFlashAttribute("resultFlag", 0);
				return "redirect:/admin_profile";
			}
		} else {
			String message = "Wrong old passwod";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 0);
			return "redirect:/admin_profile";
		}
	}
}
