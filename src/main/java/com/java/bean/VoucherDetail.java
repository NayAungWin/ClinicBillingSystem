package com.java.bean;

public class VoucherDetail {
	
 private int voucherdetailId;
 private int serviceId;
 private int quantity;
 private int voucherId;
 
 private String serviceName;
 private int servicePrice;
 
 
 
public VoucherDetail() {
}

public VoucherDetail(int serviceId, int quantity, int voucherId) {
	super();
	this.serviceId = serviceId;
	this.quantity = quantity;
	this.voucherId = voucherId;
}

public int getVoucherdetailId() {
	return voucherdetailId;
}
public void setVoucherdetailId(int voucherdetailId) {
	this.voucherdetailId = voucherdetailId;
}
public int getServiceId() {
	return serviceId;
}
public void setServiceId(int serviceId) {
	this.serviceId = serviceId;
}
public int getQuantity() {
	return quantity;
}
public void setQuantity(int quantity) {
	this.quantity = quantity;
}
public int getVoucherId() {
	return voucherId;
}
public void setVoucherId(int voucherId) {
	this.voucherId = voucherId;
}

public String getServiceName() {
	return serviceName;
}

public void setServiceName(String serviceName) {
	this.serviceName = serviceName;
}

public int getServicePrice() {
	return servicePrice;
}

public void setServicePrice(int servicePrice) {
	this.servicePrice = servicePrice;
}
 

}
