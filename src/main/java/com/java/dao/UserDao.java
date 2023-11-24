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

import com.java.bean.Consultant;
import com.java.bean.User;

import util.PasswordEncoder;


public class UserDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int addUser(User u) throws NoSuchAlgorithmException, IOException {
		String hashedPassword=PasswordEncoder.encodePassword(u.getUserPassword());
		String sql="insert into user (userName,userEmail,userPassword,userRole,userPhoneNo,userAddress) values('"+u.getUserName()+"','"+u.getUserEmail()+"','"+hashedPassword+"','"+u.getUserRole()+"','"+u.getUserPhoneNo()+"','"+u.getUserAddress()+"') ";
		return template.update(sql);
	}
	
	public int checkUserDuplicate(User user) {
		String sql="SELECT COUNT(*) FROM user WHERE userEmail='"+user.getUserEmail()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public int authenticateUser(User user) throws NoSuchAlgorithmException, IOException {	
		String   userEmail=user.getUserEmail();
   	    String   hashedPassword=PasswordEncoder.encodePassword(user.getUserPassword());
   	    String   userRole=user.getUserRole();
		String sql="SELECT count(*) FROM  user where userEmail='"+userEmail+"' and userPassword='"+hashedPassword+"' and userRole='"+userRole+"'";
		return template.queryForObject(sql,Integer.class);		
	}
	
	
	
	public User getUser(User user) throws NoSuchAlgorithmException, IOException {
		String hashedPassword=PasswordEncoder.encodePassword(user.getUserPassword());		
		String sql = "select * from user where userEmail='"+user.getUserEmail()+"' and userPassword='"+hashedPassword+"'";
		return template.queryForObject(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User u= new User();
		        u.setUserId(rs.getInt(1));
		        u.setUserName(rs.getString(2));
		        u.setUserEmail(rs.getString(3));
		        u.setUserPassword(rs.getString(4));
		        u.setUserRole(rs.getString(5));
		        u.setUserPhoneNo(rs.getString(6));
		        u.setUserAddress(rs.getString(7));
				return u;
			}
		});
	}
	
	public List<User> getUserList(){
		 List<User> userList=template.query("select * From user", new RowMapper<User>() {
			public User mapRow(ResultSet rs,int row) throws SQLException{
				User u=new User();	
				u.setUserId(rs.getInt(1));
				u.setUserName(rs.getString(2));
				u.setUserEmail(rs.getString(3));
		        u.setUserPassword(rs.getString(4));
		        u.setUserRole(rs.getString(5));
		        u.setUserPhoneNo(rs.getString(6));
		        u.setUserAddress(rs.getString(7));
				return u;
			}
		});
		 return userList;
	}
	
	public User getUserById(int id) {
		String sql = "select  userName,userEmail,userPassword,userRole From user where userId=" + id;
		return template.queryForObject(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User u=new User();	
				u.setUserId(id);
				u.setUserName(rs.getString(1));
				u.setUserEmail(rs.getString(2));
				u.setUserPassword(rs.getString(3));
				u.setUserRole(rs.getString(4));
				
				return u;
			}
		});
	}
	
	public User getRole(String userRole) {
		String sql = "select  userEmail,userPassword,userRole From user where userRole=" + userRole;
		return template.queryForObject(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User u=new User();	
				u.setUserId(rs.getInt(1));
				u.setUserName(rs.getString(2));
				u.setUserEmail(rs.getString(3));
				u.setUserPassword(rs.getString(4));
				u.setUserRole(userRole);
				
				return u;
			}
		});
	}
	
	public void updateUser(User u) {
		String sql="update user set userName='"+u.getUserName()+"',userEmail='"+u.getUserEmail()+"',userPassword='"+u.getUserPassword()+"',userRole='"+u.getUserRole()+"' where userID="+u.getUserId()+""; 
	      template.update(sql);
	}
	
	public void deleteUser(String id){ 
		 String sql="delete from user where userID="+id+""; 
		  template.update(sql); 
		}
}
