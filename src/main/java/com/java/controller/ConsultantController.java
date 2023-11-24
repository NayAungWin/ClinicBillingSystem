package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.bean.Staff;
import com.java.bean.User;
import com.java.dao.ConsultantDao;
import com.java.dao.PatientDao;
import com.java.dao.ServiceDao;
import com.java.dao.ServiceTypeDao;
import com.java.dao.UserDao;
@Controller

public class ConsultantController {
	@Autowired
	ConsultantDao consultantDao;
	@Autowired
	ServiceDao serviceDao;
	@Autowired
	ServiceTypeDao serviceTypeDao;
	@Autowired
	PatientDao patientDao;
	
	@RequestMapping(value ="/addConsultants")	
	public String showConsultantAddPage(Model m) {
		m.addAttribute("consultant",new Consultant());
		return "admin/addConsultants";
	}
	
	
	@RequestMapping(value ="/addConsultants", method = RequestMethod.POST)	
	public String saveConsultant(@ModelAttribute("consultant") Consultant consultant,RedirectAttributes reAtt) {
		int i=consultantDao.checkConsultantDuplicate(consultant);
		if(i>0) {
			String message="Duplicate Consultant Information!";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/adminConsultantList";
		}else {
			consultantDao.addConsultant(consultant);
			String message="Successfully create new consultant";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",1);
			return "redirect:/adminConsultantList";
		}
	}
	
	@RequestMapping("/adminConsultantList")
	public String showConsultantLists(Model m) {
		m.addAttribute("consultant", new Consultant());
		
		List<Consultant> list = consultantDao.getConsultant();
		m.addAttribute("list",list);	
		
		return "admin/consultantLists";
	}
	
	@RequestMapping("/consultantList")
	public String showConsultantList(Model m) {
		m.addAttribute("consultant", new Consultant());
		
		List<Consultant> list = consultantDao.getConsultant();
		m.addAttribute("list",list);	
		
		return "staff/consultantList";
	}
	
	
	@RequestMapping("/consultantPatientList")
	public String showPatientList(Model m) {
		m.addAttribute("patient", new Patient());
		
		List<Patient> patientlist = patientDao.getPatient();
		m.addAttribute("patientlist",patientlist);	
		
		return "consultant/consultantPatientList";
	}
	
	@RequestMapping(value = "/deletConsultant/{consultantId}", method = RequestMethod.GET)
	public String deleteConsultant(@PathVariable String consultantId, Model m,RedirectAttributes reAtt) {
		int i=consultantDao.confirmConsultantForDelete(consultantId);
		if(i>0) {
			String message="Can't delete this consultant! Already has Appointment!";
			reAtt.addFlashAttribute("resultFlag",0);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/adminConsultantList";
		}else {
			consultantDao.deleteConsultant(consultantId);
			String message="Successfully delete consultatn information";
			reAtt.addFlashAttribute("resultFlag",1);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/adminConsultantList";
		}
	}
	
	@RequestMapping(value = "/editConsultants/{consultantId}")
	public String editConsultant(@PathVariable int consultantId, Model m) {	
		
		Consultant consultant = consultantDao.getConsultantById(consultantId);
		m.addAttribute("consultant", consultant);
			
		return "admin/editConsultants";
	}
	
	@RequestMapping(value = "/editsaveConsultants", method = RequestMethod.POST)
	public String editsaveConsultant(@ModelAttribute("consultant") Consultant consultant,RedirectAttributes reAtt) {
		consultantDao.updateConsultant(consultant);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Update Consultant Information");
		return "redirect:/adminConsultantList";
	}
	
	@RequestMapping("/consultant_profile")
	public String consultantProfile(Model m,HttpSession httpSession) {
		
		m.addAttribute("consultant", new Consultant());
		User user = (User) httpSession.getAttribute("consultantSession");
		User consultantInfo = consultantDao.getConsultantByUserId(user.getUserId());
		m.addAttribute("user", consultantInfo);
		
		return "consultant/consultant_profile";
	}
	
	@RequestMapping("/editConsultantProfile")
	public String consultantProfileUpdate(Model m,HttpSession httpSession) {
		
		m.addAttribute("consultant", new Consultant());
		User user = (User) httpSession.getAttribute("consultantSession");
		User consultantInfo = consultantDao.getConsultantByUserId(user.getUserId());
		m.addAttribute("user", consultantInfo);
		
		return "consultant/editConsultantProfile";
	}
	
	@RequestMapping(value = "/consultantProfilesaveUpdate", method = RequestMethod.POST)
	public String staffProfilesaveUpdate(@ModelAttribute("user") User user, Model m,HttpSession httpSession, RedirectAttributes reAtt)
			throws NoSuchAlgorithmException, IOException {
			User user1 = (User) httpSession.getAttribute("consultantSession");
			user.setUserId(user1.getUserId());
		if (consultantDao.updateUserConsultant(user) == 1) {
			String message = "Successfully Update profile";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 1);
			return "redirect:/consultant_profile";
		} else {
			String message = "Can't update";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 0);
			return "redirect:/consultant_profile";
		}

	}
	
	@RequestMapping("/consultantChangePassword")
	public String changePassword(Model m,HttpSession httpSession) {
		
		m.addAttribute("user", new User());
		User user = (User) httpSession.getAttribute("consultantSession");
		User consultantInfo = consultantDao.getConsultantUserById(user.getUserId());
		m.addAttribute("user", consultantInfo);
		
		return "consultant/consultantChangePassword";
	}
	
	@RequestMapping(value = "/updateConsultantPassword", method = RequestMethod.POST)
	public String changePassword(@ModelAttribute("consultantUpdate") Consultant consultant,@ModelAttribute("User") User user, Model m, RedirectAttributes reAtt,HttpSession httpSession)
			throws NoSuchAlgorithmException, IOException {

		String newPassword = consultant.getNewPassword();
		String confirmPassword = consultant.getConfirmPassword();
		
		System.out.println(user.getUserId());
		boolean result = newPassword.equals(confirmPassword);
		System.out.println(user.getUserPassword());
		System.out.println(newPassword);
		System.out.println(confirmPassword);
		
		if (consultantDao.authenticateAdmin(user) == 1) {
			if (result) {
				consultantDao.updateConsultantPassword(user);
				String message = "Successfully Update password";
				reAtt.addFlashAttribute("message", message);
				reAtt.addFlashAttribute("resultFlag", 1);
				return "redirect:/consultant_profile";
			} else {
				String message = "Doesn't match password!";
				reAtt.addFlashAttribute("message", message);
				reAtt.addFlashAttribute("resultFlag", 0);
				return "redirect:/consultant_profile";
			}
		} else {
			String message = "Wrong old passwod";
			reAtt.addFlashAttribute("message", message);
			reAtt.addFlashAttribute("resultFlag", 0);
			return "redirect:/consultant_profile";
		}
	}
}
