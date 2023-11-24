package com.java.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Consultant;
import com.java.bean.Patient;

public class PatientDao {

	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int addPatient(Patient p) {
		String sql = "insert into patient (patientName,gender,age,phoneNumber,blood,diabete,address) values('"+ p.getPatientName()+"','" + p.getGender() + "'," + p.getAge() + ",'" 						
				+ p.getPhoneNumber()+"','"+ p.getBlood() + "','" + p.getDiabete() + "','" + p.getAddress() +"')";
		return template.update(sql);
	}
	
	public List<Patient> getPatient(){
		 List<Patient> patientList=template.query("select * from patient", new RowMapper<Patient>() {
			public Patient mapRow(ResultSet rs,int row) throws SQLException{
				Patient p=new Patient();	
				p.setPatientId(rs.getInt(1));
				p.setPatientName(rs.getString(2));
				p.setGender(rs.getString(3));
				p.setAge(rs.getInt(4));
				p.setPhoneNumber(rs.getString(5));
				p.setBlood(rs.getString(6));
				p.setDiabete(rs.getString(7));
				p.setAddress(rs.getString(8));
				return p;
			}
		});
		 return patientList;
	}
	
	public int getPatientCount() {
		String sql="SELECT COUNT(*) FROM patient";
		return template.queryForObject(sql,Integer.class);
	}
	
	public int checkPatientDuplicate(Patient patient) {
		String sql="SELECT COUNT(*) FROM patient WHERE patientName='"+patient.getPatientName()+"' and gender='"+patient.getGender()+"' and age='"+patient.getAge()+"' and phoneNumber='"+patient.getPhoneNumber()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public Patient getPatientById(int id) {
		String sql = "select patientName,gender,age,phoneNumber,blood,diabete,address from patient where patientID=" + id;
		return template.queryForObject(sql, new RowMapper<Patient>() {
			public Patient mapRow(ResultSet rs, int row) throws SQLException {
				Patient p= new Patient();
				p.setPatientId(id);
				p.setPatientName(rs.getString(1));
				p.setGender(rs.getString(2));
				p.setAge(rs.getInt(3));
				p.setPhoneNumber(rs.getString(4));
				p.setBlood(rs.getString(5));
				p.setDiabete(rs.getString(6));
				p.setAddress(rs.getString(7));
				return p;
			}
		});
	}
	
	
	public void updatePatient(Patient p) {
		String sql="update patient set  patientName='"+p.getPatientName()+"',gender='"+p.getGender()+"',age='"+p.getAge()+"',phoneNumber='"+p.getPhoneNumber()+"',blood='"+p.getBlood()+"',diabete='"+p.getDiabete()+"',address='"+p.getAddress()+"' where patientID="+p.getPatientId()+""; 
	      template.update(sql);
	}
	
	public int confirmPatientForDelete(String patientId) {
		String sql="SELECT COUNT(*) FROM appointment WHERE patientId='"+patientId+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public void deletePatient(String patientId){ 
		 String sql="delete from patient where patientID="+patientId+""; 
		  template.update(sql); 
	}
	
}
