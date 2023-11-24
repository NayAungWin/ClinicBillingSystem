package com.java.dao;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Consultant;
import com.java.bean.Patient;
import com.java.bean.User;

import util.PasswordEncoder;

public class ConsultantDao {
	JdbcTemplate template;
	PasswordEncoder passwordEncoder;
	private String  hashedPassword;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int addConsultant(Consultant c) {
		String sql = "insert into consultant (consultantName,dateFrom,dateTo,timeFrom,timeTo,specialist,degree,email,phone) values('"+ c.getConsultantName()+"','" + c.getDutyDateFrom() + "','" + c.getDutyDateTo() + "','" 						
				+ c.getDutyTimeFrom()+"','"+ c.getDutyTimeTo() + "','" +c.getSpecialist() + "','" +  c.getDegree() +"','" + c.getEmail() + "','" + c.getPhone() + "')";
		return template.update(sql);
	}
	
	public List<Consultant> getConsultant(){
		 List<Consultant> consultantList=template.query("select * From consultant", new RowMapper<Consultant>() {
			public Consultant mapRow(ResultSet rs,int row) throws SQLException{
				Consultant c=new Consultant();	
				c.setConsultantId(rs.getInt(1));
				c.setConsultantName(rs.getString(2));
				c.setDutyDateFrom(rs.getString(3));
				c.setDutyDateTo(rs.getString(4));
				c.setDutyTimeFrom(rs.getString(5));
				c.setDutyTimeTo(rs.getString(6));
				c.setSpecialist(rs.getString(7));
				c.setDegree(rs.getString(8));
				c.setEmail(rs.getString(9));
				c.setPhone(rs.getString(10));

				return c;
			}
		});
		 return consultantList;
	}
	
	public int getConsultantCount() {
		String sql="SELECT COUNT(*) FROM consultant";
		return template.queryForObject(sql,Integer.class);
	}
	
	public int checkConsultantDuplicate(Consultant consultant) {
		String sql="SELECT COUNT(*) FROM consultant WHERE consultantName='"+consultant.getConsultantName()+"' and email='"+consultant.getEmail()+"' and phone='"+consultant.getPhone()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public Consultant getConsultantById(int id) {
		String sql = "select  consultantName,dateFrom,dateTo,timeFrom,timeTo,specialist,degree,email,phone From consultant where consultantId=" + id;
		return template.queryForObject(sql, new RowMapper<Consultant>() {
			public Consultant mapRow(ResultSet rs, int row) throws SQLException {
				Consultant c=new Consultant();	
				c.setConsultantId(id);
				c.setConsultantName(rs.getString(1));
				c.setDutyDateFrom(rs.getString(2));
				c.setDutyDateTo(rs.getString(3));
				c.setDutyTimeFrom(rs.getString(4));
				c.setDutyTimeTo(rs.getString(5));
				c.setSpecialist(rs.getString(6));
				c.setDegree(rs.getString(7));
				c.setEmail(rs.getString(8));
				c.setPhone(rs.getString(9));
				return c;
			}
		});
	}
	
	
	
	public void updateConsultant(Consultant c) {
		String sql="update consultant set  consultantName='"+c.getConsultantName()+"',dateFrom='"+c.getDutyDateFrom()+"',timeFrom='"+c.getDutyTimeFrom()+"',timeTo='"+c.getDutyTimeTo()+"',specialist='"+c.getSpecialist()+"',degree='"+c.getDegree()+"',email='"+c.getEmail()+"',phone='"+c.getPhone()+"' where consultantID="+c.getConsultantId()+""; 
	      template.update(sql);
	}
	
	public int updateUserConsultant(User s) {
		String sql="update user set userName='"+s.getUserName()+"', userEmail='"+s.getUserEmail()+"', userPhoneNo='"+s.getUserPhoneNo()+"', userAddress='"+s.getUserAddress()+"' where userId="+s.getUserId()+""; 
	    return  template.update(sql);
	}
	
	public int confirmConsultantForDelete(String consultantId) {
		String sql="SELECT COUNT(*) FROM appointment WHERE consultantId='"+consultantId+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public void deleteConsultant(String id){ 
		 String sql="delete from consultant where consultantID="+id+""; 
		  template.update(sql); 
		}
	
	public void delete(String id){ 
		 String sql="delete from appointment where consultantID="+id+""; 
		  template.update(sql); 
		}
	
	public int authenticateAdmin(User user) throws NoSuchAlgorithmException, IOException {
		
		String userEmail=user.getUserEmail();
	    hashedPassword=PasswordEncoder.encodePassword(user.getUserPassword());
		
		String sql="SELECT count(*) FROM  user where userEmail= '"+userEmail+"' and userPassword='"+hashedPassword+"' ";
		return template.queryForObject(sql,Integer.class);		
	}
	
	public int updateConsultantPassword(User  user) throws NoSuchAlgorithmException, IOException {
		String password=PasswordEncoder.encodePassword(user.getNewPassword());
		String sql="update user set userPassword='"+password+"' where userId="+user.getUserId()+""; 
	    return  template.update(sql);
	}
	
	public User getConsultantByUserId(int userId) {
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
	public User getConsultantUserById(int userId) {
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
