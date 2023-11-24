   package com.java.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.text.SimpleDateFormat;
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
import com.java.bean.Instruction;
import com.java.bean.Patient;
import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.bean.Voucher;
import com.java.bean.VoucherDetail;
import com.java.dao.AppointmentDao;
import com.java.dao.ConsultantDao;
import com.java.dao.InstructionDao;
import com.java.dao.PatientDao;
import com.java.dao.ServiceDao;
import com.java.dao.VoucherDao;
@Controller
public class VoucherController {
	@Autowired
	VoucherDao voucherDao;
	@Autowired
	InstructionDao instructionDao;
	@Autowired
	AppointmentDao appointmentDao;
	@Autowired
	PatientDao patientDao;
	@Autowired
	ServiceDao serviceDao;
	
	@RequestMapping("/voucherLists")
	public String showVoucherList(Model m,String patientId) {
		m.addAttribute("voucher", new Voucher());	

		List<Voucher> voucherlist = voucherDao.getVoucher();
		m.addAttribute("voucherlist",voucherlist);
		List<Voucher> vlist = voucherDao.getVoucherByVid();
		m.addAttribute("vlist",vlist);
		List<Appointment> list=appointmentDao.AppointmentList();
		m.addAttribute("list",list);
		
		return "staff/voucherLists";
	}
	
	@RequestMapping("/adminVoucherLists")
	public String showAdminVoucherList(Model m,String patientId) {
		m.addAttribute("voucher", new Voucher());	

		List<Voucher> voucherlist = voucherDao.getVoucher();
		m.addAttribute("voucherlist",voucherlist);
		List<Voucher> vlist = voucherDao.getVoucherByVid();
		m.addAttribute("vlist",vlist);
		List<Appointment> list=appointmentDao.AppointmentList();
		m.addAttribute("list",list);
		
		return "admin/adminVoucherLists";
	}
	
	@RequestMapping(value ="/addVoucher")	
	public String saveVoucher(Model m) {
		m.addAttribute("voucher",new Voucher());
		
		return "staff/addVoucher";
	}
	
	@RequestMapping(value ="/viewDoctorInstruction/addsaveVoucher", method = RequestMethod.POST)	
	public String saveVoucher(@ModelAttribute("voucher") Voucher voucher,RedirectAttributes reAtt) throws NoSuchAlgorithmException, IOException {
		voucherDao.addVoucher(voucher);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Add Voucher Information");
		return "redirect:/addVoucherDetail";
	}
	
	
	
	@RequestMapping(value ="/viewDoctorInstruction/{instructionId}")	
	public String viewDoctorInstruction(@ModelAttribute("voucher") Voucher voucher,@ModelAttribute("appointment") Appointment appointment,HttpSession session,@PathVariable int instructionId,@ModelAttribute("instruction") Instruction instruction, Model m) {
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
			m.addAttribute("voucher",new Voucher());
			
			m.addAttribute("appointment", new Appointment());
			//String instructionId=String.valueOf(voucher.getInstructionId());
			List<Appointment> appointmentList=appointmentDao.getVoucherListByPatientId(instructionId);
			m.addAttribute("appointmentList",appointmentList);

			return "staff/viewDoctorInstruction";
		}
	
	@PostMapping("/voucherByPatientId")
    @ResponseBody
    public String findAppointmentListById(@RequestParam("patientId") String id ) { 
		try {
			Appointment appointment=appointmentDao.getVoucherByPatientId(id);
	
			return appointment.getPatientName()+"="+appointment.getGender()+"="+appointment.getAge()+"="+appointment.getAppointmentId()
			+"="+appointment.getInstructionId()+"="+appointment.getServiceId();
		}catch(org.springframework.dao.EmptyResultDataAccessException e){
			return e.toString();
		}catch(org.springframework.dao.IncorrectResultSizeDataAccessException e){
			return e.toString();		
		}
        
        
    }
	
	@RequestMapping("/invoice_print")
	public String printInvoice(Model m) {
		m.addAttribute("voucher", new Voucher());	
		
		List<Voucher> list = voucherDao.getVoucher();
		m.addAttribute("list",list);	
		
		return "staff/invoice_print";
	}
	
	@PostMapping("/viewDoctorInstruction/voucherNoByDate")
    @ResponseBody
    public String getVoucherNoByDate(@RequestParam("voucherDate")String voucherDate) {
		
		Voucher voucher=voucherDao.getVoucherNoByDate(voucherDate);
		
		String voucherNumber = voucher.getVoucherNumber();
		return voucherNumber;
    }
	
	@RequestMapping(value="/viewDoctorInstruction/addInvoices", method = RequestMethod.POST)
	public String saveInvoice(Model m,int instructionId,@ModelAttribute("appointment") Appointment appointment,@ModelAttribute("instruction") Instruction instruction,@ModelAttribute("voucher") Voucher voucher,HttpSession session,RedirectAttributes reAtt)throws NoSuchAlgorithmException, IOException {
		m.addAttribute("appointment", new Appointment());
		m.addAttribute("voucher",voucher);
				    
        instructionId = voucher.getInstructionId();
        System.out.print(instructionId);
        
        int i=voucherDao.checkVoucherDuplicate(voucher);
		if(i>0) {
			String message="Duplicate Voucher Information!";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/viewDoctorInstruction/"+instructionId;
		}else {
		voucherDao.addVoucher(voucher);		
	}
		
		
		return "redirect:/addVoucherDetail/"+ instructionId;
	}
	
	@RequestMapping("/addVoucherDetail/{instructionId}")
	public String saveVoucherDetailList(Model m,@ModelAttribute("appointment") Appointment appointment,@ModelAttribute("voucher") Voucher voucher,HttpSession session) {
		m.addAttribute("appointment", new Appointment());
		m.addAttribute("voucher",voucher);
		
		Voucher patientInfo=(Voucher)session.getAttribute("patientInfo");
		int instructionId=voucher.getInstructionId();
		
		List<Instruction> list = instructionDao.getInstructionById(instructionId);
		m.addAttribute("list",list);
		voucher = voucherDao.getPatientIdByVoucherId(instructionId);
		session.setAttribute("patientInfo", voucher);
		int patientId=voucher.getPatientId();
		
		
		m.addAttribute("service", new Service());
		
		List<Service> serviceList = serviceDao.getService();
		m.addAttribute("serviceList",serviceList);
		
		voucher = voucherDao.getVoucherIdByInstructionId(instructionId);
		m.addAttribute("voucher", voucher);
		int voucherId=voucher.getVoucherId();
		
		List<Appointment> appointmentList=appointmentDao.getVoucherListByPatientId(instructionId);
		m.addAttribute("appointmentList",appointmentList);
		
		int appointmentId=appointment.getAppointmentId();
		session.setAttribute("appointmentId",appointmentId);
		
		
		m.addAttribute("voucherId",voucher.getVoucherId());
//		m.addAttribute("pIdForPrint",voucher.getPatientId());
		System.out.print(patientId);
		
		return "staff/addVoucherDetail";
	}
	
//	@RequestMapping(value ="/addVoucherDetailByClinicFee", method = RequestMethod.POST)	
//	public String saveInstructionDetail(@ModelAttribute("serviceId") Service service,@ModelAttribute("voucher") Voucher voucher,Model m,@RequestParam("serviceId")String serviceId,@RequestParam("instructionId")int instructionId,@ModelAttribute("instruction") Instruction instruction,Model model,HttpSession session,RedirectAttributes  rm) {
//		
//		instruction.setServiceId(serviceId);
//		
//		instructionId=instruction.getInstructionId();
//		session.setAttribute("instructionId",instructionId);
//		model.addAttribute("instruction", new Instruction());
//		
//		Appointment patientInfo=(Appointment)session.getAttribute("patientInfo");
//		m.addAttribute("service", new Service());
//		
//		List<Service> serviceList = serviceDao.getService();
//		m.addAttribute("serviceList",serviceList);
//		
//		voucher = voucherDao.getVoucherIdByInstructionId(instructionId);
//		m.addAttribute("voucher", voucher);
//		int voucherId=voucher.getVoucherId();
//		
//		List<Appointment> appointmentList=appointmentDao.getVoucherListByPatientId(instructionId);
//		m.addAttribute("appointmentList",appointmentList);
//				
//			return "redirect:/addInstructionDetail";
//		}
	
	@RequestMapping(value = "/addVoucherDetail/invoice_print", method = RequestMethod.POST)
	public String test(Model m,@RequestParam ("serviceId") String[]serviceId,@RequestParam("quantity") String[] quantity,@RequestParam ("voucherId") String voucherId,HttpSession session,@RequestParam("pIdForPrint") String pIdForPrint, RedirectAttributes reAtt) throws NoSuchAlgorithmException, IOException {

		int vid=Integer.parseInt(voucherId);
//		int pIdForPrint1=Integer.parseInt(pIdForPrint);
		Voucher patientInfo=(Voucher)session.getAttribute("patientInfo");

		List<VoucherDetail> vd = new ArrayList<>();

		for (int i = 0; i < serviceId.length; i++) {
			int id = Integer.parseInt(serviceId[i]);
			int qty = Integer.parseInt(quantity[i]);

			VoucherDetail voucherDetail = new VoucherDetail();
			voucherDetail.setServiceId(id);
			voucherDetail.setQuantity(qty);
			voucherDetail.setVoucherId(vid);
			vd.add(voucherDetail);
		}
		for(VoucherDetail v:vd) {
			voucherDao.addVoucherDetail(v);	
		}
				
		List<VoucherDetail> vdList=new ArrayList<>();
		vdList=voucherDao.getVoucherDetailByVId(vid);
		
		m.addAttribute("voucherDetailList",vdList);
//		Voucher v=voucherDao.getPatientIdByVoucherId(pIdForPrint1);
//		
//		m.addAttribute("voucher",v);
		
	    return "staff/invoice_print";
	}
	
	@RequestMapping(value ="/viewInvoiceDetail/{voucherId}")	
	public String viewInvoiceDetail(@PathVariable int voucherId,@ModelAttribute("instruction") Instruction instruction,@ModelAttribute("voucher") Voucher voucher, Model m) {
			
		
			List<Voucher> list = voucherDao.getPatientByVid(voucherId);
			m.addAttribute("list",list);
			List<VoucherDetail> voucherDetailList = voucherDao.getVoucherDetailByVId(voucherId);
			m.addAttribute("voucherDetailList",voucherDetailList);
			m.addAttribute("instruction",instruction);
			
			m.addAttribute("service", new Service());
			List<Service> serviceList = serviceDao.getService();
			m.addAttribute("serviceList",serviceList);
			
			
			
			return "staff/viewInvoice";
		}
	
	@RequestMapping(value ="/viewAdminInvoiceDetail/{voucherId}")	
	public String adminViewInvoiceDetail(@PathVariable int voucherId,@ModelAttribute("instruction") Instruction instruction,@ModelAttribute("voucher") Voucher voucher, Model m) {
			
		
			List<Voucher> list = voucherDao.getPatientByVid(voucherId);
			m.addAttribute("list",list);
			List<VoucherDetail> voucherDetailList = voucherDao.getVoucherDetailByVId(voucherId);
			m.addAttribute("voucherDetailList",voucherDetailList);
			m.addAttribute("instruction",instruction);
			
			m.addAttribute("service", new Service());
			List<Service> serviceList = serviceDao.getService();
			m.addAttribute("serviceList",serviceList);
			
			
			
			return "admin/adminViewInvoice";
		}
	
	@RequestMapping(value ="/viewAdminInvoiceDetailList")	
	public String adminViewInvoiceDetailList(@ModelAttribute("instruction") Instruction instruction,@ModelAttribute("voucher") Voucher voucher, Model m) {
			

			List<Voucher> voucherDetailList = voucherDao.getVoucherDetail();
			m.addAttribute("voucherDetailList",voucherDetailList);
			
			
			
			
			return "admin/adminVoucherDetailLists";
		}
}
