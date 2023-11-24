package com.java.controller;

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
import com.java.bean.Instruction;
import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.bean.Patient;
import com.java.bean.User;
import com.java.dao.ConsultantDao;
import com.java.dao.PatientDao;
import com.java.dao.UserDao;
import com.java.dao.ServiceDao;
import com.java.dao.InstructionDao;
import com.java.dao.ServiceTypeDao;

@Controller
public class PatientController {
	@Autowired
	PatientDao patientDao;
	
	
	@RequestMapping(value ="/addPatients")	
	public String showAddPatient(Model m) {
		m.addAttribute("patient",new Patient());
		return "staff/addPatients";
	}
	
	
	@RequestMapping(value ="/addPatients", method = RequestMethod.POST)	
	public String savePatient(@ModelAttribute("patient") Patient patient,RedirectAttributes reAtt) {
		int i=patientDao.checkPatientDuplicate(patient);
		if(i>0) {
			String message="Duplicate Patient Information!";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/patientLists";
		}else {
			patientDao.addPatient(patient);
			String message="Successfully create new patient";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",1);
			return "redirect:/patientLists";
		}
	}
	
	@RequestMapping("/patientLists")
	public String showPatientListPage(Model m) {
		m.addAttribute("patient", new Patient());
		m.addAttribute("flag",0);	
		
		List<Patient> list = patientDao.getPatient();
		m.addAttribute("list",list);	
		
		return "staff/patientLists";
	}
	
	@RequestMapping("/adminPatientList")
	public String PatientList(Model m) {
		m.addAttribute("patient", new Patient());
		m.addAttribute("flag",0);	
		
		List<Patient> list1 = patientDao.getPatient();
		m.addAttribute("list",list1);	
		
		return "admin/patientLists";
	}
	
	@RequestMapping(value = "/deletPatient/{patientId}", method = RequestMethod.GET)
	public String deletePatient(@PathVariable String patientId, Model m,RedirectAttributes reAtt) {
		int i=patientDao.confirmPatientForDelete(patientId);
		if(i>0) {
			String message="Can't delete this patient! Already has Appointment!";
			reAtt.addFlashAttribute("resultFlag",0);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/patientLists";
		}else {
			patientDao.deletePatient(patientId);
			String message="Successfully delete patient information";
			reAtt.addFlashAttribute("resultFlag",1);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/patientLists";
		}
	}
	
	@RequestMapping(value = "/editPatient/{patientId}")
	public String editPatient(@PathVariable int patientId, Model m) {	
		
		Patient patient = patientDao.getPatientById(patientId);
		m.addAttribute("patient", patient);
		
		return "staff/editPatients";
	}
	
	@RequestMapping(value = "/editsavePatient", method = RequestMethod.POST)
	public String editsavePatient(@ModelAttribute("patient") Patient patient,RedirectAttributes reAtt) {
		patientDao.updatePatient(patient);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Update Patient Information");
		return "redirect:/patientLists";
	}
	
	
	
}