package com.java.bean;

public class Staff {
	private String staffEmail;
	private String staffPassword;
	private String staffName;
	private String newPassword;
	private String confirmPassword;
	
	public Staff() { }
	
	public String getStaffEmail() { 
		 return staffEmail; 
	} 
		
	public void setStaffEmail(String staffEmail) { 
		 this.staffEmail = staffEmail; 
	}
	
	public String getStaffPassword() { 
		 return staffPassword; 
	} 
		
	public void setStaffPassword(String staffPassword) { 
		 this.staffPassword = staffPassword; 
	}
	
	public String getStaffName() { 
		 return staffName; 
	} 
		
	public void setStaffName(String staffName) { 
		 this.staffName = staffName; 
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
