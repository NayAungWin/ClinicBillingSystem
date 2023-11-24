package com.java.bean;

public class Consultant {
	private int consultantId;
	private String consultantName;
	private String specialist;
	private String dutyDateFrom;
	private String dutyDateTo;
	private String dutyTimeFrom;
	private String dutyTimeTo;
	private String degree;
	private String email;
	private String phone;
	private String newPassword;
	private String confirmPassword;
	
	public Consultant() { }
	
	public int getConsultantId() {
		return consultantId;
	}
	public void setConsultantId(int consultantId) {
		this.consultantId = consultantId;
	} 
	
	public String getConsultantName() { 
		 return consultantName; 
	} 
		
	public void setConsultantName(String consultantName) { 
		 this.consultantName = consultantName; 
	}
	
	public String getSpecialist() { 
		 return specialist; 
	} 
		
	public void setSpecialist(String specialist) { 
		 this.specialist = specialist; 
	}
	
	public String getDutyDateFrom() { 
		 return dutyDateFrom; 
	} 
		
	public void setDutyDateFrom(String dutyDateFrom) { 
		 this.dutyDateFrom = dutyDateFrom; 
	}
	
	public String getDutyDateTo() { 
		 return dutyDateTo; 
	} 
		
	public void setDutyDateTo(String dutyDateTo) { 
		 this.dutyDateTo = dutyDateTo; 
	}
	
	public String getDutyTimeFrom() { 
		 return dutyTimeFrom; 
	} 
		
	public void setDutyTimeFrom(String dutyTimeFrom) { 
		 this.dutyTimeFrom = dutyTimeFrom; 
	}
	
	public String getDutyTimeTo() { 
		 return dutyTimeTo; 
	} 
		
	public void setDutyTimeTo(String dutyTimeTo) { 
		 this.dutyTimeTo = dutyTimeTo; 
	}
	public String getDegree() { 
		 return degree; 
	} 
		
	public void setDegree(String degree) { 
		 this.degree = degree; 
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
}
