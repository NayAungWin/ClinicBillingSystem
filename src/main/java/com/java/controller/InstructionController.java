package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import com.java.bean.Patient;
import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.bean.User;
import com.java.bean.Voucher;
import com.java.bean.VoucherDetail;
import com.java.dao.AppointmentDao;
import com.java.dao.ConsultantDao;
import com.java.dao.InstructionDao;
import com.java.dao.PatientDao;
import com.java.dao.ServiceDao;
import com.java.dao.ServiceTypeDao;
import com.java.dao.UserDao;
import com.java.dao.VoucherDao;
@Controller
public class InstructionController {
	@Autowired
	InstructionDao instructionDao;
	@Autowired
	AppointmentDao appointmentDao;
	@Autowired
	ConsultantDao consultantDao;
	@Autowired
	PatientDao patientDao;
	@Autowired
	ServiceDao serviceDao;
	
	@Autowired
	VoucherDao voucherDao;
	
	@RequestMapping("consultant_home")	
	public String consultantHomePage(Model m,HttpSession httpSession) {
		m.addAttribute("instruction",new Instruction());
		m.addAttribute("service",new Service());
		List<Instruction> list = instructionDao.getInstruction();
		m.addAttribute("list",list);
		
		int patientCount=patientDao.getPatientCount();
		httpSession.setAttribute("patientCount", patientCount);
		int consultantCount=consultantDao.getConsultantCount();
		httpSession.setAttribute("consultantCount", consultantCount);
		int appointmentCount=appointmentDao.getAppointmentCount();
		httpSession.setAttribute("appointmentCount", appointmentCount);
//		int billCount=patientDao.getBillCount();
//		httpSession.setAttribute("billCount", billCount);
		return "consultant/consultant_home";
	}
	
	@RequestMapping("/instructionLists")
	public String showInstructionList(Model m,String appointmentId) {
		m.addAttribute("instruction", new Instruction());
		
		LocalDate currentDate = LocalDate.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String instructionDate = currentDate.format(formatter);
	    
	    m.addAttribute("currentDate", instructionDate);
	    
		List<Instruction> list = instructionDao.getInstructionPRN();
		m.addAttribute("list",list);
		
		List<Instruction> instructionList = instructionDao.getInstructionPRNByCurrentDate(instructionDate);
		m.addAttribute("instructionList",instructionList);
		
		List<Appointment> appointmentList=appointmentDao.AppointmentList();
		m.addAttribute("appointmentList",appointmentList);
		
		return "consultant/instructionLists";
	}
	
	@RequestMapping("/doctorInstruction")
	public String showInstructionLists(Model m,String appointmentId) {
		m.addAttribute("instruction", new Instruction());
		
		List<Instruction> list = instructionDao.getInstructionPRN();
		m.addAttribute("list",list);
		
		
		List<Appointment> appointmentList=appointmentDao.AppointmentList();
		m.addAttribute("appointmentList",appointmentList);
		
		return "staff/doctorInstruction";
	}
	
	@RequestMapping(value ="/addInstruction", method = RequestMethod.POST)	
	public String saveInstruction(@ModelAttribute("instruction") Instruction Instruction,Model m,String appointmentDate,RedirectAttributes reAtt) {
		int i=instructionDao.checkInstructionDuplicate(Instruction);
		if(i>0) {
			String message="Duplicate Appointment Information!";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/instructionLists";
		}else {
			instructionDao.addInstruction(Instruction);
			String message="Successfully create new Instruction";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",1);
			return "redirect:/instructionLists";
		}
	}
	
	@RequestMapping("/addInstruction")
	public String showAddInstruction(Model m) {
		m.addAttribute("instruction", new Instruction());
		
		LocalDate currentDate = LocalDate.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	    String appointmentDate = currentDate.format(formatter);
	    
	    m.addAttribute("currentDate", appointmentDate);
	    
	    List<Appointment> appointmentList=appointmentDao.getPatientByAppointmentDate(appointmentDate);
		m.addAttribute("appointmentList",appointmentList);
		m.addAttribute("appointment", new Appointment());
		List<Patient> patientList=patientDao.getPatient();
		m.addAttribute("patientList",patientList);
		m.addAttribute("patient", new Patient());
		
		return "consultant/addInstruction";
	}
	

	//@RequestMapping(value="/addInstructionDetail/{instructionId}", method = RequestMethod.POST)
	@RequestMapping("/addInstructionDetail")
	public String showAddInstructionDetail(Model m,@ModelAttribute("serviceId") Service service,@ModelAttribute("instruction") Instruction instruction,HttpSession session,Model model) {
		m.addAttribute("instructionModel", new Instruction());
		Appointment patientInfo=(Appointment)session.getAttribute("patientInfo");
		
		int instructionId=instruction.getInstructionId();
		session.setAttribute("instructionId",instructionId);
		model.addAttribute("instructionIdFix",instructionId);
		
		model.addAttribute("patientInfo",patientInfo);
		
		
		
		List<Instruction> list = instructionDao.getInstruction();
		m.addAttribute("list",list);

		List<Instruction> insrtuctionDetaillist = instructionDao.getInstructionDetail(patientInfo.getInstructionId());
		m.addAttribute("insrtuctionDetaillist",insrtuctionDetaillist);
		
		
		m.addAttribute("service", new Service());
		
		List<Service> serviceList = serviceDao.getService();
		m.addAttribute("serviceList",serviceList);
		

		instructionId=(Integer)session.getAttribute("instructionId");
		
		List<Instruction> list1 = instructionDao.getInstructionById(patientInfo.getInstructionId());
		m.addAttribute("list1",list1);
		
		return "consultant/addInstructionDetail";
	}
	
	@RequestMapping(value ="/addInstructionDetailByServiceName", method = RequestMethod.POST)	
	public String saveInstructionDetail(@ModelAttribute("serviceId") Service service,Model m,@RequestParam("serviceId")String serviceId,@RequestParam("instructionId")int instructionId,@ModelAttribute("instruction") Instruction instruction,Model model,HttpSession session,RedirectAttributes  rm) {
		
			instruction.setServiceId(serviceId);
			
			instructionId=instruction.getInstructionId();
			session.setAttribute("instructionId",instructionId);
			int i=instructionDao.checkInstructionDetailDuplicate(instruction);
			if(i>0) {
				String message="Duplicate Consultant Information!";
				rm.addFlashAttribute("message",message);
				rm.addFlashAttribute("resultFlag",0);
				Appointment patientInfo=(Appointment)session.getAttribute("patientInfo");
				m.addAttribute("service", new Service());
				
				List<Service> serviceList = serviceDao.getService();
				m.addAttribute("serviceList",serviceList);
				List<Instruction> list = instructionDao.getInstruction();
				model.addAttribute("list",list);
				instructionId=(int)session.getAttribute("instructionId");
				
				List<Instruction> insrtuctionDetaillist1 = instructionDao.getInstructionDetail(patientInfo.getInstructionId());
				List<Instruction> insrtuctionDetaillist = instructionDao.getInstructionDetail(instructionId);
				model.addAttribute("insrtuctionDetaillist",insrtuctionDetaillist);		
				rm.addFlashAttribute("insrtuctionDetaillist",insrtuctionDetaillist);
				return "redirect:/addInstructionDetail";
			}else {
				
				instructionDao.addInstructionDetail(instruction);				
				Appointment patientInfo=(Appointment)session.getAttribute("patientInfo");
				m.addAttribute("service", new Service());
				
				List<Service> serviceList = serviceDao.getService();
				m.addAttribute("serviceList",serviceList);
				List<Instruction> list = instructionDao.getInstruction();
				model.addAttribute("list",list);
				instructionId=(int)session.getAttribute("instructionId");
				
				List<Instruction> insrtuctionDetaillist1 = instructionDao.getInstructionDetail(patientInfo.getInstructionId());
				List<Instruction> insrtuctionDetaillist = instructionDao.getInstructionDetail(instructionId);
				model.addAttribute("insrtuctionDetaillist",insrtuctionDetaillist);		
				rm.addFlashAttribute("insrtuctionDetaillist",insrtuctionDetaillist);
				return "redirect:/addInstructionDetail";
			}
			
			
			
			
		}
	
	@RequestMapping(value ="/viewInstructionDetail/{instructionId}")	
	public String viewInstructionDetail(@PathVariable int instructionId,@ModelAttribute("instruction") Instruction instruction, Model m) {
			
		
			List<Instruction> list = instructionDao.getInstructionById(instructionId);
			m.addAttribute("list",list);
			List<Instruction> instructionList = instructionDao.getInstructionDetailByInstructionId(instructionId);
			m.addAttribute("instructionList",instructionList);
			m.addAttribute("instruction",instruction);
			List<Instruction> insrtuctionDetaillist = instructionDao.getInstructionDetail(instructionId);
			m.addAttribute("insrtuctionDetaillist",insrtuctionDetaillist);
			m.addAttribute("service", new Service());
			List<Service> serviceList = serviceDao.getService();
			m.addAttribute("serviceList",serviceList);
			
			
			
			return "consultant/viewInstructionDetail";
		}
	
	
	
	@RequestMapping(value ="/viewInstructionDetail/editInstructionDetail/{instructionId}")	
	public String editInstructionDetail(@PathVariable int instructionId,@ModelAttribute("instruction") Instruction instruction, Model m) {
			instructionDao.addInstructionDetail(instruction);
			m.addAttribute("instruction", new Instruction());
		
			List<Instruction> list = instructionDao.getInstructionById(instructionId);
			m.addAttribute("list",list);
			List<Instruction> instructionList = instructionDao.getInstructionDetailByInstructionId(instructionId);
			m.addAttribute("instructionList",instructionList);
			m.addAttribute("instruction",instruction);
			List<Instruction> insrtuctionDetaillist = instructionDao.getInstructionDetail(instructionId);
			m.addAttribute("insrtuctionDetaillist",insrtuctionDetaillist);
			m.addAttribute("service", new Service());
			List<Service> serviceList = serviceDao.getService();
			m.addAttribute("serviceList",serviceList);
			return "consultant/viewInstructionDetail";
		}
	
	@RequestMapping("/instructionListDetail")
	public String instructionListDetail(Model m) {
		m.addAttribute("instruction", new Instruction());	
			
		
		return "consultant/instructionListDetail";
	}
	
	@RequestMapping(value = "/deleteInstruction/{instructionId}", method = RequestMethod.GET)
	public String deleteInstruction(@PathVariable String instructionId,int appointmentId, Model m,RedirectAttributes reAtt) {
		int i=instructionDao.confirmInstructionForDelete(appointmentId);
		if(i>0) {
			String message="Can't delete this instruction! Already has appointment!";
			reAtt.addFlashAttribute("resultFlag",0);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/appointmentList";
		}else {
			instructionDao.deleteInstruction(instructionId);
			
			String message="Successfully delete instruction information";
			reAtt.addFlashAttribute("resultFlag",1);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/appointmentList";
		}
	}
	
	@RequestMapping(value = "/deleteInstructionDetail/{instructionDetailId}", method = RequestMethod.GET)
	public String deleteInstructionDetail(@PathVariable String instructionDetailId,Model m,RedirectAttributes reAtt) {
		
			instructionDao.deleteInstructionDetail(instructionDetailId);
			
			return "redirect:/addInstructionDetail";
			
	}
	
	@RequestMapping(value = "/editInstruction/{instructionId}")
	public String editInstructionPage(@PathVariable int instructionId, Model m) {	
		
		Instruction instruction = instructionDao.getInstructionId(instructionId);
		m.addAttribute("instruction", instruction);
		List<Appointment> appointmentList=appointmentDao.getAppointment();
		m.addAttribute("appointmentList",appointmentList);
			
		return "consultant/editInstruction";
	}
	
	@RequestMapping(value = "/editsaveInstruction", method = RequestMethod.POST)
	public String editsaveInstruction(@ModelAttribute("instruction") Instruction instruction,RedirectAttributes reAtt) {
		instructionDao.updateInstruction(instruction);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Update Patient Information");
		return "redirect:/instructionLists";
	}
	
//	@PostMapping("/instructionByPatientId")
//    @ResponseBody
//    public String findAppointmentListById(@RequestParam("patientId") int id,HttpSession session) {
//		try {
//			Appointment appointment=appointmentDao.getAppointmentByPatientId(id);
//			session.setAttribute("patientInfo", appointment);
//			return appointment.getAppointmentId()+"="+appointment.getPatientName()+"="+appointment.getGender()+"="+appointment.getAge()+"="+appointment.getInstructionId();
//		}catch(org.springframework.dao.EmptyResultDataAccessException e){
//			return e.toString();
//		}catch(org.springframework.dao.IncorrectResultSizeDataAccessException e){
//			return e.toString();		
//		}        
//    }
	@PostMapping("/instructionByAppointmentId")
	@ResponseBody
	public String findAppointmentListById(@RequestParam("appointmentId") int id,HttpSession session) {
	    try {
	    	
	        Appointment appointment = appointmentDao.getAppointByAppointmentId(id);
	        session.setAttribute("patientInfo", appointment);
	        int appointmentId=appointment.getAppointmentId();
	        System.out.println(appointmentId);
	        return appointment.getAppointmentId() + "=" + appointment.getPatientName() + "=" + appointment.getGender() + "=" + appointment.getAge() + "=" + appointment.getAppointmentDate() + "=" + appointment.getInstructionId();
	    } catch (org.springframework.dao.EmptyResultDataAccessException e) {
	        return e.toString();
	    } catch (org.springframework.dao.IncorrectResultSizeDataAccessException e) {
	        return e.toString();
	    }
	}
	
	@PostMapping("/AppointmentByPaitentId")
    @ResponseBody
    public String findAppointmentByPaitentId(@RequestParam("appointmentId") int id ) {
		
		try {
			
			Appointment appointment=appointmentDao.getPatientById(id);
	
			return appointment.getPatientName()+"="+appointment.getGender()+"="+appointment.getAge();
		}catch(org.springframework.dao.EmptyResultDataAccessException e){
			return e.toString();
		}catch(org.springframework.dao.IncorrectResultSizeDataAccessException e){
			return e.toString();		
		}
        
        
    }
	
	@PostMapping("instructionId")
    @ResponseBody
    public int instructionId(@RequestParam("intId")int id ) {
		Instruction i=instructionDao.getInstructionId(id);
		System.out.println();
		return i.getInstructionId();

    }
	
	@PostMapping("/addInstructions")
    @ResponseBody
    public String findpatientListById(@RequestParam("patientId") int id ) {
		Patient patient=patientDao.getPatientById(id);
		
        return patient.getPatientName()+"="+patient.getGender()+"="+patient.getAge();

    }
	
	
	
	
	
}
