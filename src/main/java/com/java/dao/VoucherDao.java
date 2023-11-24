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

import com.java.bean.Appointment;
import com.java.bean.Consultant;
import com.java.bean.Instruction;
import com.java.bean.Patient;
import com.java.bean.User;
import com.java.bean.Voucher;
import com.java.bean.VoucherDetail;

import util.PasswordEncoder;


public class VoucherDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int getVoucherCount() {
		String sql="SELECT COUNT(*) FROM voucher";
		return template.queryForObject(sql,Integer.class);
	}
	
	public int addVoucher(Voucher v) throws NoSuchAlgorithmException, IOException {
		String sql="insert into voucher (voucherDate,instructionId) values('"+ v.getVoucherDate()+"','"+v.getInstructionId()+"') ";
		return template.update(sql);
	}
	
	public int getMaxVoucherId() {
		String sql = "SELECT max(voucherId) FROM voucher";
		
		return template.queryForObject(sql,Integer.class);	
		
		
	}
	
	public int checkVoucherDuplicate(Voucher voucher) {
		String sql="SELECT COUNT(*) FROM voucher WHERE instructionId='"+voucher.getInstructionId()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public List<Voucher> getVoucher(){
		 List<Voucher> voucherList=template.query("select * From voucher", new RowMapper<Voucher>() {
			public Voucher mapRow(ResultSet rs,int row) throws SQLException{
				Voucher v=new Voucher();	
				v.setVoucherId(rs.getInt(1));
				v.setVoucherDate(rs.getString(2));
				v.setInstructionId(rs.getInt(3));
				return v;
			}
		});
		 return voucherList;
	}
	
	public List<Voucher> getVoucherByVid(){
		 List<Voucher> vList=template.query("select p.patientId,p.patientName,v.voucherId,v.voucherDate,i.instructionId From instruction i,appointment a,patient p,voucher v where v.instructionId=i.instructionId and i.appointmentId = a.appointmentId and a.patientId = p.patientID and a.appointmentId", new RowMapper<Voucher>() {
			public Voucher mapRow(ResultSet rs,int row) throws SQLException{
				Voucher v=new Voucher();
				v.setPatientId(rs.getInt(1));
				v.setPatientName(rs.getString(2));
				v.setVoucherId(rs.getInt(3));
				v.setVoucherDate(rs.getString(4));
				v.setInstructionId(rs.getInt(5));
				return v;
			}
		});
		 return vList;
	}
	
	public List<Voucher> getVoucherDetail(){
		 List<Voucher> vdetailList=template.query("SELECT patient.patientId,patient.patientName,patient.gender,patient.age,s.serviceName,s.servicePrice,vd.quantity,v.voucherId,v.voucherDate From patient inner join appointment on appointment.patientID=patient.patientID inner join instruction i on i.appointmentId=appointment.appointmentId inner join instruction_detail id on id.instructionId=i.instructionId inner join service s on s.serviceId=id.serviceId inner join voucher v on v.instructionId=i.instructionId inner join voucher_detail vd on v.voucherId=vd.voucherId;", new RowMapper<Voucher>() {
			public Voucher mapRow(ResultSet rs,int row) throws SQLException{
				Voucher v=new Voucher();
				v.setPatientId(rs.getInt(1));
				v.setPatientName(rs.getString(2));
				v.setGender(rs.getString(3));
				v.setAge(rs.getString(4));
				v.setServiceName(rs.getString(5));
				v.setServicePrice(rs.getString(6));
				v.setQuantity(rs.getString(7));
				v.setVoucherId(rs.getInt(8));
				v.setVoucherDate(rs.getString(9));
				return v;
			}
		});
		 return vdetailList;
	}
	
	public List<Voucher> getPatientByVid(int voucherId){
		 List<Voucher> vList=template.query("SELECT patient.patientId,patient.patientName,patient.gender,patient.age From patient inner join appointment on appointment.patientID=patient.patientID inner join instruction on instruction.appointmentId=appointment.appointmentId inner join voucher on voucher.instructionId=instruction.instructionId where voucher.voucherId="+voucherId+";", new RowMapper<Voucher>() {
			public Voucher mapRow(ResultSet rs,int row) throws SQLException{
				Voucher v=new Voucher();
				v.setVoucherId(voucherId);
				v.setPatientId(rs.getInt(1));
				v.setPatientName(rs.getString(2));
				v.setGender(rs.getString(3));
				v.setAge(rs.getString(4));				
				return v;
			}
		});
		 return vList;
	}
	
	public List<Voucher> getPatientId(int id){
		 List<Voucher> voucherList=template.query("select a.patientId from instruction i,appointment a,patient p where i.appointmentId=a.appointmentId and patientId='"+id+"'", new RowMapper<Voucher>() {
			public Voucher mapRow(ResultSet rs,int row) throws SQLException{
				Voucher v=new Voucher();	
				v.setPatientId(rs.getInt(1));
				return v;
			}
		});
		 return voucherList;
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
	
	public User getRole(int userRole) {
		String sql = "select  userEmail,userPassword,userRole From user where userRole=" + userRole;
		return template.queryForObject(sql, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int row) throws SQLException {
				User u=new User();	
				u.setUserId(rs.getInt(1));
				u.setUserName(rs.getString(2));
				u.setUserEmail(rs.getString(3));
				u.setUserPassword(rs.getString(4));
				u.setUserRole(rs.getString(5));
				
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
	
	//Voucher Detail Method
	public int addVoucherDetail(VoucherDetail v) throws NoSuchAlgorithmException, IOException {
		String sql="insert into  voucher_detail (serviceId,quantity,voucherId) values("+v.getServiceId()+","+v.getQuantity()+","+v.getVoucherId()+") ";
		return template.update(sql);
	}
	
	//Voucher Detail get Method
	public List<VoucherDetail> getVoucherDetailByVId(int vid){
		 List<VoucherDetail> voucherDetailList=template.query("select s.serviceId,s.serviceName,s.servicePrice, vd.quantity,vd.voucherId from service s, voucher_detail vd where s.serviceId=vd.serviceId and vd.voucherId='"+vid+"'", new RowMapper<VoucherDetail>() {
			public VoucherDetail mapRow(ResultSet rs,int row) throws SQLException{
				VoucherDetail vd=new VoucherDetail();	
				vd.setServiceId(rs.getInt(1));
				vd.setServiceName(rs.getString(2));
				vd.setServicePrice(rs.getInt(3));
				vd.setQuantity(rs.getInt(4));
				vd.setVoucherId(vid);
				return vd;
			}
		});
		 return voucherDetailList;
	}
	
	public Voucher getVoucherIdByInstructionId(int instructionId) {
		String sql = "SELECT voucherId From voucher where instructionId='"+instructionId+"'";
		return template.queryForObject(sql, new RowMapper<Voucher>() {
			public Voucher mapRow(ResultSet rs, int row) throws SQLException {
				Voucher v= new Voucher();
				v.setInstructionId(instructionId);
				v.setVoucherId(rs.getInt(1));
				
				return v;
			}
		});
	}
	
	
	public Voucher getPatientIdByVoucherId(int instructionId) {
		String sql = "SELECT patient.patientId,patient.patientName,patient.gender,patient.age From patient inner join appointment on appointment.patientID=patient.patientID inner join instruction on instruction.appointmentId=appointment.appointmentId where instruction.instructionId='"+instructionId+"'";
		return template.queryForObject(sql, new RowMapper<Voucher>() {
			public Voucher mapRow(ResultSet rs, int row) throws SQLException {
				Voucher v= new Voucher();
				v.setInstructionId(instructionId);
				v.setPatientId(rs.getInt(1));
				v.setPatientName(rs.getString(2));
				v.setGender(rs.getString(3));
				v.setAge(rs.getString(4));
			
				return v;
			}
		});
	}
	
	public Voucher getVoucherNoByDate(String voucherDate) {
		String sql = "SELECT voucher.voucherNumber From voucher where voucher.voucherDate=''+voucherDate ORDER BY voucher.voucherId DESC LIMIT 1"; 
			return template.queryForObject(sql, new RowMapper<Voucher>() {
				public Voucher mapRow(ResultSet rs, int row) throws SQLException {
				Voucher v=new Voucher();	
				v.setVoucherDate(voucherDate);
				v.setVoucherNumber(rs.getString(1));
				
				return v;
			}
			});
	}
	
	
}
