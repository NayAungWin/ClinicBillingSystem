package com.java.bean;

public class User {
	private int userId;
	private String userName;
	private String userEmail;
	private String userPassword;
	private String userRole;
	private String userPhoneNo;
	private String userAddress;
	private String newPassword;
	private String confirmPassword;
	
	public User() { }
	
	public int getUserId() { 
		 return userId; 
	} 
		
	public void setUserId(int userId) { 
		 this.userId = userId; 
	}
	
	public String getUserName() { 
		 return userName; 
	} 
		
	public void setUserName(String userName) { 
		 this.userName = userName; 
	}
	
	public String getUserEmail() { 
		 return userEmail; 
	} 
		
	public void setUserEmail(String userEmail) { 
		 this.userEmail = userEmail; 
	}
	
	public String getUserPassword() { 
		 return userPassword; 
	} 
		
	public void setUserPassword(String userPassword) { 
		 this.userPassword = userPassword; 
	}
	
	public String getUserRole() { 
		 return userRole; 
	} 
		
	public void setUserRole(String userRole) { 
		 this.userRole = userRole; 
	}

	public String getUserPhoneNo() {
		return userPhoneNo;
	}

	public void setUserPhoneNo(String userPhoneNo) {
		this.userPhoneNo = userPhoneNo;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
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
