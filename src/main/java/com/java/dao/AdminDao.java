package com.java.dao;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Admin;
import com.java.bean.Patient;
import com.java.bean.Staff;
import com.java.bean.User;

import util.PasswordEncoder;


public class AdminDao {
	JdbcTemplate template;
	PasswordEncoder passwordEncoder;
	private String  hashedPassword;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int insertAdmin(Admin a) throws NoSuchAlgorithmException, IOException {
		String hashedPassword=PasswordEncoder.encodePassword(a.getAdminPassword());
		String sql="insert into admin (adminName,adminEmail,adminPassword,adminRole) values('"+a.getAdminName()+"','"+a.getAdminEmail()+"','"+hashedPassword+"','"+a.getAdminRole()+"') ";
		return template.update(sql);
	}
	
	public int checkAdminDuplicate(Admin admin) {
		String sql="SELECT COUNT(*) FROM admin WHERE adminEmail='"+admin.getAdminEmail()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public int updateAdmin(User s) {
		String sql="update user set userName='"+s.getUserName()+"', userEmail='"+s.getUserEmail()+"', userPhoneNo='"+s.getUserPhoneNo()+"', userAddress='"+s.getUserAddress()+"' where userId="+s.getUserId()+""; 
	    return  template.update(sql);
	}
	
	public int authenticateAdmin(User user) throws NoSuchAlgorithmException, IOException {
			
			String userEmail=user.getUserEmail();
		    hashedPassword=PasswordEncoder.encodePassword(user.getUserPassword());
			
			String sql="SELECT count(*) FROM  user where userEmail= '"+userEmail+"' and userPassword='"+hashedPassword+"' ";
			return template.queryForObject(sql,Integer.class);		
		}

	public int updateAdminPassword(User  user) throws NoSuchAlgorithmException, IOException {
		String password=PasswordEncoder.encodePassword(user.getNewPassword());
		String sql="update user set userPassword='"+password+"' where userId="+user.getUserId()+""; 
	    return  template.update(sql);
	}
	
	public User getAdminById(int userId) {
		String sql = "select userName,userEmail,userPassword,userRole,userPhoneNo,userAddress from user where userID=" + userId;
		return template.queryForObject(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User u= new User();
				u.setUserId(userId);
				u.setUserName(rs.getString(1));
				u.setUserEmail(rs.getString(2));
				u.setUserPassword(rs.getString(3));
				u.setUserRole(rs.getString(4));
				u.setUserPhoneNo(rs.getString(5));
				u.setUserAddress(rs.getString(6));
				return u;
			}
		});
	}
	
	public User getAdminUserById(int userId) {
		String sql = "select userName,userEmail from user where userID=" + userId;
		return template.queryForObject(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User u= new User();
				u.setUserId(userId);
				u.setUserName(rs.getString(1));
				u.setUserEmail(rs.getString(2));
				
				return u;
			}
		});
	}
}
