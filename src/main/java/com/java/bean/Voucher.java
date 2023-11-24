package com.java.bean;

import java.time.LocalDate;

public class Voucher {
	private int voucherId;
	private int patientId;
	private String patientName;
	private String gender;
	private String age;
	private int instructionId;
	private int appointmentId;
	private String voucherDate;
	private int voucherDetailId;
	private int instructionDetailId;
	private String serviceId;
	private String serviceName;
	private String servicePrice;
	private String unitPrice;
	private String quantity;
	private String amount;
	private String voucherNumber;
	
	public Voucher() { }
	
	public int getVoucherId() {
		return voucherId;
	}
	public void setVoucherId(int voucherId) {
		this.voucherId = voucherId;
	}
	
	public String getVoucherDate() { 
		 return voucherDate; 
	} 
		
	public void setVoucherDate(String voucherDate) { 
		 this.voucherDate = voucherDate; 
	}
	
	public int getVoucherDetailId() {
		return voucherId;
	}
	public void setVoucherDetailId(int voucherDetailId) {
		this.voucherDetailId = voucherDetailId;
	}
	
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}
	
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}

	public int getPatientId() {
		return patientId;
	}

	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}

	

	public int getAppointmentId() {
		return appointmentId;
	}

	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
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

	public String getVoucherNumber() {
		return voucherNumber;
	}

	public void setVoucherNumber(String voucherNumber) {
		this.voucherNumber = voucherNumber;
	}

	public int getInstructionId() {
		return instructionId;
	}

	public void setInstructionId(int instructionId) {
		this.instructionId = instructionId;
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
}
