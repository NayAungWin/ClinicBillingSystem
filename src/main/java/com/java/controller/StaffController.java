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

import com.java.bean.Patient;
import com.java.bean.Staff;
import com.java.bean.User;
import com.java.dao.AppointmentDao;
import com.java.dao.ConsultantDao;
import com.java.dao.PatientDao;
import com.java.dao.StaffDao;
import com.java.dao.UserDao;
import com.java.dao.VoucherDao;

@Controller
public class StaffController {
	@Autowired
	PatientDao patientDao;
	@Autowired
	ConsultantDao consultantDao;
	@Autowired
	StaffDao staffDao;
	@Autowired
	UserDao userDao;
	@Autowired
	AppointmentDao appointmentDao;
	@Autowired
	VoucherDao voucherDao;
	
	@RequestMapping("/staff_home")
	public String home(Model m,HttpSession httpSession) {
		
		m.addAttribute("patient", new Patient());
		m.addAttribute("flag",0);	
		
		List<Patient> list = patientDao.getPatient();
		m.addAttribute("list",list);	
		
		int patientCount=patientDao.getPatientCount();
		httpSession.setAttribute("patientCount", patientCount);		
		int consultantCount=consultantDao.getConsultantCount();
		httpSession.setAttribute("consultantCount", consultantCount);		
		int appointmentCount=appointmentDao.getAppointmentCount();
		httpSession.setAttribute("appointmentCount", appointmentCount);		
		int invoiceCount=voucherDao.getVoucherCount();
		httpSession.setAttribute("invoiceCount", invoiceCount);
		
		return "staff/staff_home";
	}
	
	@RequestMapping("/staff_profile")
	public String staffProfile(Model m,HttpSession httpSession) {
		
		m.addAttribute("staff", new Staff());
		User user = (User) httpSession.getAttribute("staffSession");
		User staffInfo = staffDao.getStaffById(user.getUserId());
		m.addAttribute("user", staffInfo);
		
		return "staff/staff_profile";
	}
	
	@RequestMapping("/editStaffProfile")
	public String staffProfileUpdate(Model m,HttpSession httpSession) {
		
		m.addAttribute("staff", new Staff());
		User user = (User) httpSession.getAttribute("staffSession");
		User staffInfo = staffDao.getStaffById(user.getUserId());
		m.addAttribute("user", staffInfo);
		
		return "staff/editStaffProfile";
	}
	
	@RequestMapping(value = "/staffProfilesaveUpdate", method = RequestMethod.POST)
	public String staffProfilesaveUpdate(@ModelAttribute("user") User user, Model m,HttpSession httpSession, RedirectAttributes reAtt)
			throws NoSuchAlgorithmException, IOException {
			User user1 = (User) httpSession.getAttribute("staffSession");
			user.setUserId(user1.getUserId());
		if (staffDao.updateStaff(user) == 1) {
			String message = "Successfully Update profile";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 1);
			return "redirect:/staff_profile";
		} else {
			String message = "Can't update";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 0);
			return "redirect:/staff_profile";
		}

	}
	
	@RequestMapping("/changeStaffPassword")
	public String changePassword(Model m,HttpSession httpSession) {
		
		m.addAttribute("staff", new Staff());
		User user = (User) httpSession.getAttribute("staffSession");
		User staffInfo = staffDao.getStaffUserById(user.getUserId());
		m.addAttribute("user", staffInfo);
		
		return "staff/changeStaffPassword";
	}
	
	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public String changePassword(@ModelAttribute("adminUpdate") Staff staff,@ModelAttribute("staffUpdate") User user, Model m, RedirectAttributes reAtt)
			throws NoSuchAlgorithmException, IOException {

		String newPassword = staff.getNewPassword();
		String confirmPassword = staff.getConfirmPassword();

		System.out.println(user.getUserId());
		boolean result = newPassword.equals(confirmPassword);
		System.out.println(user.getUserPassword());
		System.out.println(newPassword);
		System.out.println(confirmPassword);

		if (staffDao.authenticateStaff(user) == 1) {
			if (result) {
				staffDao.updateStaffPassword(user);
				String message = "Successfully Update password";
				reAtt.addFlashAttribute("message", message);
				reAtt.addFlashAttribute("resultFlag", 1);
				return "redirect:/staff_profile";
			} else {
				String message = "Doesn't match password!";
				reAtt.addFlashAttribute("message", message);
				reAtt.addFlashAttribute("resultFlag", 0);
				return "redirect:/staff_profile";
			}
		} else {
			String message = "Wrong old passwod";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 0);
			return "redirect:/staff_profile";
		}
	}
}
