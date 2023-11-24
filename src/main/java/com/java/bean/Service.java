package com.java.bean;

public class Service {
	private int serviceId;
	private String serviceName;
	private String servicePrice;
	private int serviceTypeId;
	private String serviceTypeName;
	
	public Service() { }
	
	public int getServiceId() {
		return serviceId;
	}
	public void setServiceId(int serviceId) {
		this.serviceId = serviceId;
	}
	
	public String getServiceName() { 
		 return serviceName; 
	} 
		
	public void setServiceName(String serviceName) { 
		 this.serviceName = serviceName; 
	}
	
	public String getServicePrice() { 
		 return servicePrice; 
	} 
		
	public void setServicePrice(String servicePrice) { 
		 this.servicePrice = servicePrice; 
	}
	
	public int getServiceTypeId() {
		return serviceTypeId;
	}
	public void setServiceTypeId(int serviceTypeId) {
		this.serviceTypeId = serviceTypeId;
	}
	
	public String getServiceTypeName() { 
		 return serviceTypeName; 
	} 
		
	public void setServiceTypeName(String serviceTypeName) { 
		 this.serviceTypeName = serviceTypeName; 
	}
}
