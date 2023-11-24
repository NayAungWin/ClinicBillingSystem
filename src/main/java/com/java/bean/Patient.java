package com.java.bean;

public class Patient {
	private int patientId;
	private String patientName;  
	private String phoneNumber;
	private int age;
	private String gender;
	private String blood;
	private String diabete;
	private String address;
	
	public Patient() { }
	
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	} 
	
	public String getPatientName() { 
	 return patientName; 
	 } 
	
	 public void setPatientName(String patientName) { 
	 this.patientName = patientName; 
	 } 
	 
	 public String getPhoneNumber() { 
	 return phoneNumber; 
	 } 
	 public void setPhoneNumber(String phoneNumber) { 
	 this.phoneNumber = phoneNumber; 
	 }
	 
	 public String getGender() { 
		 return gender; 
	} 
	public void setGender(String gender) { 
		this.gender = gender; 
	}
	
	public int getAge() { 
		 return age; 
	} 
	public void setAge(int age) { 
		this.age = age; 
	}
	
	public String getBlood() { 
		 return blood; 
	} 
	public void setBlood(String blood) { 
		this.blood = blood; 
	}
	
	public String getDiabete() { 
		 return diabete; 
	} 
	public void setDiabete(String diabete) { 
		this.diabete = diabete; 
	}
	
	public String getAddress() { 
		 return address; 
	} 
	public void setAddress(String address) { 
		this.address = address; 
	}
}
