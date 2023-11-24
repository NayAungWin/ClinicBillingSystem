package com.java.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.java.bean.Consultant;
import com.java.bean.Service;
import com.java.bean.ServiceType;
import com.java.bean.User;
import com.java.dao.ConsultantDao;
import com.java.dao.ServiceDao;
import com.java.dao.ServiceTypeDao;
import com.java.dao.UserDao;
@Controller
public class ServiceController {
	@Autowired
	ConsultantDao consultantDao;
	@Autowired
	ServiceDao serviceDao;
	@Autowired
	ServiceTypeDao serviceTypeDao;
	
	@RequestMapping("/adminServiceList")
	public String showServiceListForm(Model m) {
		m.addAttribute("service", new Service());	
		
		List<Service> list = serviceDao.getService();
		m.addAttribute("list",list);	
		
		return "admin/serviceLists";
	}
	
	@RequestMapping("/serviceList")
	public String showServiceList(Model m) {
		m.addAttribute("service", new Service());	
		
		List<Service> list = serviceDao.getService();
		m.addAttribute("list",list);	
		
		return "staff/serviceList";
	}
	
	@RequestMapping(value ="/addServices")	
	public String showServiceAddPage(Model m) {
		m.addAttribute("service",new Service());
		List<ServiceType> serviceTypeList=serviceTypeDao.getServiceType();
		m.addAttribute("serviceTypeList",serviceTypeList);
		m.addAttribute("serviceType", new ServiceType());
		return "admin/addServices";
	}
	
//	@RequestMapping(value ="/addServices", method = RequestMethod.POST)	
//	public String saveService(@ModelAttribute("service") Service service,Model m) {
//		serviceDao.addService(service); 
//		List<Service> list = serviceDao.getService();
//		 m.addAttribute("list",list);
//		return "admin/addServices";
//	}
	
	@RequestMapping(value ="/addServices", method = RequestMethod.POST)	
	public String saveService(@ModelAttribute("service") Service service,RedirectAttributes reAtt) {
		int i=serviceDao.checkServiceDuplicate(service);
		if(i>0) {
			String message="Already exist Service Name Information!";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/adminServiceList";
		}else {
			serviceDao.addService(service);
			String message="Successfully create new service";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",1);
			return "redirect:/adminServiceList";
		}
	}
	
	@RequestMapping(value = "/deleteService/{serviceId}", method = RequestMethod.GET)
	public String deleteService(@PathVariable String serviceId, Model m,RedirectAttributes reAtt) {
		serviceDao.deleteService(serviceId);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Delete Service Information");
			return "redirect:/adminServiceList";
	}
	
	@RequestMapping(value = "/editServices/{serviceId}")
	public String editService(@PathVariable int serviceId, Model m) {	
		
		Service service = serviceDao.getServiceById(serviceId);
		m.addAttribute("service", service);
		List<ServiceType> serviceTypeList=serviceTypeDao.getServiceType();
		m.addAttribute("serviceTypeList",serviceTypeList);	
		return "admin/editServices";
	}
	
	@RequestMapping(value = "/editsaveServices", method = RequestMethod.POST)
	public String editsaveService(@ModelAttribute("service") Service service,RedirectAttributes reAtt) {
		serviceDao.updateService(service);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Update Service Information");
		return "redirect:/adminServiceList";
	}
	
	@RequestMapping("/addServiceTypes")
	public String showServTypeListForm(Model m) {
		m.addAttribute("serviceType", new ServiceType());
		m.addAttribute("flag",0);		
		
		return "admin/addServiceTypes";
	}
	
	@RequestMapping("/adminServiceTypeList")
	public String ServiceTypeListForm(Model m) {
		m.addAttribute("serviceType", new ServiceType());	
		
		List<ServiceType> list = serviceTypeDao.getServiceType();
		m.addAttribute("list",list);	
		
		return "admin/serviceTypeLists";
	}
	
	@RequestMapping("/serviceTypeList")
	public String ServiceTypeList(Model m) {
		m.addAttribute("serviceType", new ServiceType());	
		
		List<ServiceType> list = serviceTypeDao.getServiceType();
		m.addAttribute("list",list);	
		
		return "staff/serviceTypeList";
	}
	
	@RequestMapping(value ="/addServiceTypes", method = RequestMethod.POST)	
	public String saveServiceType(@ModelAttribute("serviceType") ServiceType serviceType,RedirectAttributes reAtt) {
		int i=serviceTypeDao.checkServiceTypeDuplicate(serviceType);
		if(i>0) {
			String message="Already exist Service Type Information!";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",0);
			return "redirect:/adminServiceTypeList";
		}else {
			serviceTypeDao.addServiceType(serviceType);
			String message="Successfully create new service type";
			reAtt.addFlashAttribute("message",message);
			reAtt.addFlashAttribute("resultFlag",1);
			return "redirect:/adminServiceTypeList";
		}
	}
	
	@RequestMapping(value = "/deleteSerType/{serviceTypeId}", method = RequestMethod.GET)
	public String deleteSerType(@PathVariable String serviceTypeId, Model m,RedirectAttributes reAtt) {
		int i=serviceTypeDao.confirmServiceTypeForDelete(serviceTypeId);
		if(i>0) {
			String message="Can't delete this service type! Already has service in this type!";
			reAtt.addFlashAttribute("resultFlag",0);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/adminServiceTypeList";
		}else {
			serviceTypeDao.deleteSerType(serviceTypeId);
			String message="Successfully delete serviceType information";
			reAtt.addFlashAttribute("resultFlag",1);
			reAtt.addFlashAttribute("message",message);
			return "redirect:/adminServiceTypeList";
		}
	}
	
	@RequestMapping(value = "/editServiceType/{serviceTypeId}")
	public String editServiceType(@PathVariable int serviceTypeId, Model m) {	
		
		ServiceType serviceType = serviceTypeDao.getSerTypeById(serviceTypeId);
		m.addAttribute("serviceType", serviceType);
			
		return "admin/editServiceType";
	}
	
	@RequestMapping(value = "/editsaveServiceType", method = RequestMethod.POST)
	public String editsaveServiceType(@ModelAttribute("serviceType") ServiceType serviceType,RedirectAttributes reAtt) {
		serviceTypeDao.updateSerType(serviceType);
		reAtt.addFlashAttribute("resultFlag",1);
		reAtt.addFlashAttribute("message","Successfully Update Service Type Information");
		return "redirect:/adminServiceTypeList";
	}
}
