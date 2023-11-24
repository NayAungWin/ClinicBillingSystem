package com.java.bean;

public class Instruction {
	private int instructionId;
	private int appointmentId;
	private String serviceId;
	private String serviceName;
	private int patientId;
	private String patientName;
	private String gender;
	private String age;
	private String status;
	private String quantity;
	private String appointmentDate;
	private int instructionDetailId;
	private String instructionDate;
	
	public Instruction() { }
	
	
	public Instruction(int instructionId,int appointmentId, String serviceId, String serviceName, int patientId, String patientName,
			String gender, String age, String status, String quantity, int instructionDetailId,String instructionDate) {
		super();
		this.instructionId = instructionId;
		this.appointmentId = appointmentId;
		this.serviceId = serviceId;
		this.serviceName = serviceName;
		this.patientId = patientId;
		this.patientName = patientName;
		this.gender = gender;
		this.age = age;
		this.status = status;
		this.quantity = quantity;
		this.instructionDetailId = instructionDetailId;
		this.instructionDate = instructionDate;
	}


	public int getInstructionId() {
		return instructionId;
	}
	public void setInstructionId(int instructionId) {
		this.instructionId =  instructionId;
	}
	
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	} 
	
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId =  patientId;
	}
	
	public String getPatientName() {
		return patientName;
	}
	public void setPatientName(String patientName) {
		this.patientName = patientName;
	}
	
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getInstructionDetailId() {
		return instructionDetailId;
	}
	public void setInstructionDetailId(int instructionDetailId) {
		this.instructionDetailId = instructionDetailId;
	}

	public String getServiceId() {
		return serviceId;
	}

	public void setServiceId(String serviceId) {
		this.serviceId = serviceId;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}


	public String getAppointmentDate() {
		return appointmentDate;
	}


	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}


	public String getInstructionDate() {
		return instructionDate;
	}


	public void setInstructionDate(String instructionDate) {
		this.instructionDate = instructionDate;
	}
}
