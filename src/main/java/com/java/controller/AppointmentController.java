package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.bean.Appointment;
import com.java.bean.Consultant;
import com.java.bean.Instruction;
import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.bean.Token;
import com.java.bean.Patient;
import com.java.bean.User;
import com.java.dao.AppointmentDao;
import com.java.dao.ConsultantDao;
import com.java.dao.PatientDao;
import com.java.dao.TokenDao;
import com.java.dao.UserDao;


@Controller
public class AppointmentController {
	@Autowired
	AppointmentDao appointmentDao;
	@Autowired
	PatientDao patientDao;
	@Autowired
	ConsultantDao consultantDao;
	@Autowired
	TokenDao tokenDao;

	@RequestMapping("/addAppointment")
	public String showAddAppointPage(Model m) {
		m.addAttribute("token", new Token());
		m.addAttribute("appointment", new Appointment());
		List<Appointment> list = appointmentDao.getAppointment();
		m.addAttribute("list",list);
		List<Appointment> appointmentList = appointmentDao.getAppointment();
		m.addAttribute("appointmentList",appointmentList);
		List<Patient> patientList=patientDao.getPatient();
		m.addAttribute("patientList",patientList);
		m.addAttribute("patient", new Patient());
		List<Consultant> consultantList=consultantDao.getConsultant();
		m.addAttribute("consultantList",consultantList);
		m.addAttribute("consultant", new Consultant());
		return "staff/addAppointment";
	}
	
	@RequestMapping("/consultantAppointmentList")
	public String showConsultantAppointmentList(Model m,HttpSession httpSession) {
		m.addAttribute("appointment", new Appointment());
		
		List<Appointment> appointmentList = appointmentDao.getAppointment();
		m.addAttribute("appointmentList",appointmentList);
		
		
		List<Appointment> list = appointmentDao.getAppointment();
		m.addAttribute("list",list);
		
		List<Patient> patientList=patientDao.getPatient();
		m.addAttribute("patientList",patientList);
		
		m.addAttribute("patient", new Patient());
		List<Consultant> consultantList=consultantDao.getConsultant();
		m.addAttribute("consultantList",consultantList);
		m.addAttribute("consultant", new Consultant());
		return "consultant/appointmentLists";
	}
	
	@RequestMapping("/adminAppointmentList")
	public String AppointmentList(Model m) {
		m.addAttribute("appointment", new Appointment());
		List<Appointment> list = appointmentDao.getAppointment();
		m.addAttribute("list",list);
		List<Appointment> appointmentList = appointmentDao.getAppointment();
		m.addAttribute("appointmentList",appointmentList);
		List<Patient> patientList=patientDao.getPatient();
		m.addAttribute("patientList",patientList);
		m.addAttribute("patient", new Patient());
		List<Consultant> consultantList=consultantDao.getConsultant();
		m.addAttribute("consultantList",consultantList);
		m.addAttribute("consultant", new Consultant());
		return "admin/appointmentLists";
	}
	
	@RequestMapping("appointmentList")
	public String showAppointmentListPage(Model m,HttpSession session) {
		m.addAttribute("appointment", new Appointment());
		List<Appointment> list = appointmentDao.getAppointment();
		m.addAttribute("list",list);
		List<Appointment> appointmentList = appointmentDao.getAppointment();
		m.addAttribute("appointmentList",appointmentList);
		List<Patient> patientList=patientDao.getPatient();
		m.addAttribute("patientList",patientList);
		m.addAttribute("patient", new Patient());
		List<Consultant> consultantList=consultantDao.getConsultant();
		m.addAttribute("consultantList",consultantList);
		m.addAttribute("consultant", new Consultant());

		return "staff/appointmentList";
	}
	
	@RequestMapping(value ="/addAppointment", method = RequestMethod.POST)	
	public String saveAppointment(@ModelAttribute("appointment") Appointment appointment,@ModelAttribute("token") Token token,Model m,RedirectAttributes reAtt) {
		List<Appointment> list = appointmentDao.getAppointment();
		 m.addAttribute("list",list);
		 int i=appointmentDao.checkAppointDuplicate(appointment);
		 if(i>0) {
				String message="Already exist Appointment Information!";
				reAtt.addFlashAttribute("message",message);
				reAtt.addFlashAttribute("resultFlag",0);
				return "redirect:/appointmentList";
			}else {				
				tokenDao.addToken(token);
				
				int maxId=tokenDao.getMaxTokenId();				
				appointment.setTokenId(maxId);
				appointmentDao.addAppointment(appointment);
				String message="Successfull Appointment Information!";
				reAtt.addFlashAttribute("message",message);
				reAtt.addFlashAttribute("resultFlag",1);
				return "redirect:/appointmentList";
			}
		 
		}

	
	@RequestMapping(value = "/editAppointment/{appointmentId}")
	public String editAppointmentPage(@PathVariable int appointmentId, Model m) {	
		Appointment appointment = appointmentDao.getAppointmentById(appointmentId);
		m.addAttribute("appointment", appointment);
		List<Appointment> appointmentList=appointmentDao.getAppointment();
		m.addAttribute("appointmentList",appointmentList);
		List<Patient> patientList=patientDao.getPatient();
		m.addAttribute("patientList",patientList);
		List<Consultant> consultantList=consultantDao.getConsultant();
		m.addAttribute("consultantList",consultantList);
		return "staff/editAppointment";
	}
	
	@PostMapping("/editAppointment/test")
    @ResponseBody
    public String test(@RequestParam("t")int id ) {
		Consultant c=consultantDao.getConsultantById(id);
		return c.getConsultantName();
        //patient.getPatientName()+"="+patient.getGender()+"="+patient.getAge();

    }
	@PostMapping("/editAppointment/test2")
    @ResponseBody
    public String test2(@RequestParam("patientId") int id ) {
		Patient patient=patientDao.getPatientById(id);
		
        return patient.getPatientName()+"="+patient.getGender()+"="+patient.getAge();

    }
	
	@RequestMapping(value = "/editsaveAppointment", method = RequestMethod.POST)
	public String editsaveAppointment(@ModelAttribute("appointment") Appointment appointment,RedirectAttributes reAtt) {
		appointmentDao.updateAppointment(appointment);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Update Appointment Information");
		return "redirect:/appointmentList";
	}
	
	@RequestMapping(value = "/printAppointment/{appointmentId}")
	public String showAddInstructionDetail(Model m, String patientId, @PathVariable("appointmentId") String id, @ModelAttribute("appointment") Appointment appointment, HttpSession session) {
		
		List<Appointment> list = appointmentDao.getPatientListByAppId(id);
		m.addAttribute("list",list);
		
		return "staff/doctorInstructionForm";
	}
	
	@RequestMapping(value = "/deleteAppointment/{appointmentId}", method = RequestMethod.GET)
	public String deleteAppointment(@PathVariable int appointmentId, Model m,RedirectAttributes reAtt) {
		int i=appointmentDao.confirmAppointmentForDelete(appointmentId);
		if(i>0) {
			String message="Can't delete this appointment! Already has Instruction!";
			reAtt.addFlashAttribute("resultFlag",0);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/appointmentList";
		}else {
			appointmentDao.deleteAppointment(appointmentId);
			
			String message="Successfully delete appointment information";
			reAtt.addFlashAttribute("resultFlag",1);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/appointmentList";
		}
	}
	
	@PostMapping("/addAppointments")//addAppointments
    @ResponseBody
    public String findpatientListById(@RequestParam("patientId") int id ) {
		Patient patient=patientDao.getPatientById(id);
		
        return patient.getPatientName()+"="+patient.getGender()+"="+patient.getAge();

    }

	@PostMapping("/addAppointments_1")
    @ResponseBody
    public String findconsultantListById(@RequestParam("consultantId") int id ) {
		Consultant consultant=consultantDao.getConsultantById(id);
		
        return consultant.getConsultantName();

    }
	
	@PostMapping("appointmentId")
    @ResponseBody
    public int appointmentId(@RequestParam("appId")int id ) {
		Appointment ap=appointmentDao.getAppointmentById(id);
		return ap.getAppointmentId();

    }
	
	@PostMapping("tokenByAppointDate")
    @ResponseBody
    public String getTokenByAppointDate(@RequestParam("appointmentDate")String appointmentDate,@RequestParam("consultantId")String consultantId) {
		Appointment ap=appointmentDao.getTokenByAppointDate(appointmentDate,consultantId);
		//return ap.getTokenNumber();
		String tokenNumber = ap.getTokenNumber();
		return tokenNumber;

    }
	
}