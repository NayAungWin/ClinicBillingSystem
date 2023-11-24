package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Appointment;
import com.java.bean.Patient;
import com.java.bean.Consultant;
import com.java.bean.Instruction;
import com.java.bean.Service;
import com.java.bean.ServiceType;

public class AppointmentDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public void addAppointment(Appointment ap) {
		String sql="insert into appointment (appointmentDate,patientId,consultantId,tokenId) values('"+ap.getAppointmentDate()+"','"+ap.getPatientId()+"','"+ap.getConsultantId()+"','"+ap.getTokenId()+"') ";
	     template.update(sql);
	}
	
	public Appointment getAppointmentById(int id) {
		String sql = "select appointment.appointmentId,patient.patientId,patient.patientName,patient.gender,patient.age,patient.address,consultant.consultantId,consultant.consultantName,token.tokenId,token.tokenNumber FROM appointment,patient,consultant,token WHERE appointment.patientId=patient.patientId AND appointment.consultantId=consultant.consultantId and token.tokenId=appointment.tokenId and appointmentId=" + id;
		return template.queryForObject(sql, new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs, int row) throws SQLException {
				Appointment ap= new Appointment();
				ap.setAppointmentId(id);
				ap.setPatientId(rs.getInt(2));
				ap.setPatientName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setAddress(rs.getString(6));
				ap.setConsultantId(rs.getInt(7));
				ap.setConsultantName(rs.getString(8));
				ap.setTokenId(rs.getInt(9));
				ap.setTokenNumber(rs.getString(10));
				return ap;
			}
		});
	}
	
//	public Appointment getTokenByAppointDate(String appointmentDate) {
//		String sql = "SELECT tokenNumber FROM token WHERE tokenId = (SELECT MAX(tokenId) FROM token JOIN appointment ON token.tokenId = appointment.tokenId WHERE appointmentDate = '" + appointmentDate  + ")";
//		return template.queryForObject(sql, new RowMapper<Appointment>() {
//			public Appointment mapRow(ResultSet rs, int row) throws SQLException {
//				Appointment ap= new Appointment();
//				ap.setAppointmentDate(appointmentDate);
//				ap.setTokenNumber(rs.getString(1));
//				return ap;
//			}
//		});
//	}
	
	public Appointment getTokenByAppointDate(String appointmentDate,String consultantId) {
		String sql = "SELECT t.tokenNumber FROM token t JOIN appointment a ON t.tokenId = a.tokenId WHERE a.appointmentDate = '" + appointmentDate + "' AND a.consultantId = " + consultantId + " ORDER BY t.tokenId DESC LIMIT 1";
		return template.queryForObject(sql, new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs, int row) throws SQLException {
				Appointment ap= new Appointment();
				ap.setAppointmentDate(appointmentDate);
				ap.setTokenNumber(rs.getString(1));
				return ap;
			}
		});
	}
	
	public int checkAppointDuplicate(Appointment appointment) {
		String sql="SELECT COUNT(*) FROM appointment WHERE consultantId='"+appointment.getConsultantId()+"' and patientId='"+appointment.getPatientId()+"' and appointmentDate='"+appointment.getAppointmentDate()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public Appointment getAppointmentByPatientId(int id) {
		String sql = "select i.instructionId,i.appointmentId,p.patientID,p.patientName,p.gender,p.age,a.appointmentDate FROM instruction i,appointment a,patient p WHERE i.appointmentId=a.appointmentId and  a.patientID=p.patientID  and a.patientId='"+id+"'";
		return template.queryForObject(sql, new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs, int row) throws SQLException {
				Appointment a= new Appointment();
				a.setInstructionId(rs.getInt(1));
				a.setAppointmentId(rs.getInt(2));		
				a.setPatientId(rs.getInt(3));
				a.setPatientName(rs.getString(4));
				a.setGender(rs.getString(5));
				a.setAge(rs.getString(6));
				a.setAppointmentDate(rs.getString(7));
				return a;
			}
		});
	}
	
	public Appointment getAppointByAppointmentId(int id) {
		String sql = "select i.instructionId,i.appointmentId,p.patientID,p.patientName,p.gender,p.age,a.appointmentDate FROM instruction i,appointment a,patient p WHERE i.appointmentId=a.appointmentId and  a.patientID=p.patientID  and a.appointmentId='"+id+"'";
		return template.queryForObject(sql, new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs, int row) throws SQLException {
				Appointment a= new Appointment();
				a.setInstructionId(rs.getInt(1));
				a.setAppointmentId(id);		
				a.setPatientId(rs.getInt(3));
				a.setPatientName(rs.getString(4));
				a.setGender(rs.getString(5));
				a.setAge(rs.getString(6));
				a.setAppointmentDate(rs.getString(7));
				return a;
			}
		});
	}
	
	public List<Appointment> getAppointById(int appointmentId) {
		List<Appointment>appointmentList=template.query("SELECT patient.patientId,patient.patientName,patient.gender,patient.age From patient inner join appointment on appointment.patientID=patient.patientID where appointment.appointmentId="+appointmentId+";", new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs,int row) throws SQLException{
				Appointment i=new Appointment();	
				i.setPatientId(rs.getInt(1));
				i.setPatientName(rs.getString(2));
				i.setGender(rs.getString(3));
				i.setAge(rs.getString(4));
				
				return i;
			}
		});
		 return appointmentList;
}
	
	public Appointment getVoucherByPatientId(String id) {
		String sql = "select i.instructionId,i.appointmentId,p.patientID,p.patientName,p.gender,p.age,s.serviceId,s.serviceName,s.servicePrice FROM instruction i,appointment a,patient p,instruction_detail ind,service s WHERE i.appointmentId=a.appointmentId and  a.patientID=p.patientID and i.instructionId = ind.instructionId and ind.serviceId = s.serviceId and a.patientId='"+id+"'";
		return template.queryForObject(sql, new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs, int row) throws SQLException {
				Appointment a= new Appointment();
				a.setInstructionId(rs.getInt(1));
				a.setAppointmentId(rs.getInt(2));
				a.setPatientId(rs.getInt(3));
				a.setPatientName(rs.getString(1));
				a.setGender(rs.getString(5));
				a.setAge(rs.getString(6));
				a.setServiceId(rs.getInt(7));
				a.setServiceName(rs.getString(8));
				a.setServicePrice(rs.getString(9));
				return a;
			}
		});
	}
	
	public List<Appointment> getVoucherListByPatientId(int id){
		 List<Appointment> appointmentList=template.query("select i.instructionId,i.appointmentId,p.patientID,p.patientName,p.gender,p.age,s.serviceId,s.serviceName,s.servicePrice FROM instruction i,appointment a,patient p,instruction_detail ind,service s WHERE i.appointmentId=a.appointmentId and  a.patientID=p.patientID and i.instructionId = ind.instructionId and ind.serviceId = s.serviceId and i.instructionId='"+id+"'", new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs,int row) throws SQLException{
				Appointment a= new Appointment();
				a.setInstructionId(rs.getInt(1));
				a.setAppointmentId(rs.getInt(2));
				a.setPatientId(rs.getInt(3));
				a.setPatientName(rs.getString(4));
				a.setGender(rs.getString(5));
				a.setAge(rs.getString(6));
				a.setServiceId(rs.getInt(7));
				a.setServiceName(rs.getString(8));
				a.setServicePrice(rs.getString(9));
				return a;
			}
		});
		 return appointmentList;
	}
	
	public Appointment getPatientById(int id) {
		String sql = "select a.appointmentId,p.patientID,p.patientName,p.gender,p.age FROM appointment a,patient p WHERE  a.patientID=p.patientID  and a.appointmentId='"+id+"'";
		return template.queryForObject(sql, new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs, int row) throws SQLException {
				Appointment a= new Appointment();
				a.setAppointmentId(id);
				a.setPatientId(id);
				a.setPatientName(rs.getString(2));
				a.setGender(rs.getString(3));
				a.setAge(rs.getString(4));
				return a;
			}
		});
	}
	
	public List<Appointment> getPatientListByAppId(String id){
		 List<Appointment> patientList=template.query("select a.appointmentId,p.patientID,p.patientName,p.gender,p.age,c.consultantName,p.address FROM appointment a,patient p,consultant c WHERE  a.patientID=p.patientID and a.consultantId=c.consultantId  and a.appointmentId='"+id+"'", new RowMapper<Appointment>() {
			        public Appointment mapRow(ResultSet rs, int row) throws SQLException {
			            Appointment a = new Appointment();
			            a.setAppointmentId(rs.getInt(1));
			            a.setPatientId(rs.getInt(2));
			            a.setPatientName(rs.getString(3));
			            a.setGender(rs.getString(4));
			            a.setAge(rs.getString(5));
			            a.setConsultantName(rs.getString(6));
			            a.setAddress(rs.getString(7));
			            return a;
			        }
			    });
		 return patientList;
		 }
	
	public List<Appointment> getAppointment(){
		 List<Appointment> appointmentList=template.query("select appointment.appointmentId,patient.patientId,patient.patientName,patient.gender,patient.age,consultant.consultantId,consultant.consultantName,appointment.appointmentDate,token.tokenNumber FROM appointment,patient,consultant,token WHERE appointment.patientId=patient.patientId AND appointment.consultantId=consultant.consultantId AND token.tokenId=appointment.tokenId", new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs,int row) throws SQLException{
				Appointment ap=new Appointment();	
				ap.setAppointmentId(rs.getInt(1));
				ap.setPatientId(rs.getInt(2));
				ap.setPatientName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setConsultantId(rs.getInt(6));
				ap.setConsultantName(rs.getString(7));
				ap.setAppointmentDate(rs.getString(8));
				ap.setTokenNumber(rs.getString(9));
				return ap;
			}
		});
		 return appointmentList;
	}
	
	public List<Appointment> getPatientByAppointmentDate(String appointmentDate){
		List<Appointment> appointmentList=template.query("select appointment.appointmentId,patient.patientId,patient.patientName FROM appointment,patient WHERE appointment.patientId=patient.patientId AND appointment.appointmentDate='"+appointmentDate+"'", new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs,int row) throws SQLException{
				Appointment a=new Appointment();
				a.setAppointmentDate(appointmentDate);
				a.setAppointmentId(rs.getInt(1));
				a.setPatientId(rs.getInt(2));
				a.setPatientName(rs.getString(3));
		
				return a;
			}
		});
		return appointmentList;
	}
	
	public List<Appointment> getAppointByConsultantId(int consultantId){
		 List<Appointment> appointmentList=template.query("select appointment.appointmentId,patient.patientId,patient.patientName,patient.gender,patient.age,consultant.consultantId,consultant.consultantName,appointment.appointmentDate,token.tokenNumber FROM appointment,patient,consultant,token WHERE appointment.patientId=patient.patientId AND appointment.consultantId=consultant.consultantId AND token.tokenId=appointment.tokenId AND AND consultantName='"+consultantId+"'", new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs,int row) throws SQLException{
				Appointment ap=new Appointment();	
				ap.setAppointmentId(rs.getInt(1));
				ap.setPatientId(rs.getInt(2));
				ap.setPatientName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setConsultantId(rs.getInt(6));
				ap.setConsultantName(rs.getString(7));
				ap.setAppointmentDate(rs.getString(8));
				ap.setTokenNumber(rs.getString(9));
				return ap;
			}
		});
		 return appointmentList;
	}
	
	public List<Appointment> getAppointById(String id){
		 List<Appointment> appointmentList=template.query("select a.appointmentId,p.patientID,p.patientName,p.gender,p.age FROM appointment a,patient p,consultant c WHERE  a.patientID=p.patientID  and a.appointmentId='"+id+"'", new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs,int row) throws SQLException{
				Appointment ap=new Appointment();	
				ap.setAppointmentId(rs.getInt(1));
				ap.setPatientId(rs.getInt(2));
				ap.setPatientName(rs.getString(3));
				ap.setGender(rs.getString(4));
				ap.setAge(rs.getString(5));
				ap.setConsultantId(rs.getInt(6));
				ap.setConsultantName(rs.getString(7));
				ap.setAppointmentDate(rs.getString(8));
				return ap;
			}
		});
		 return appointmentList;
	}
	
	public int getAppointmentCount() {
		String sql="SELECT COUNT(*) FROM appointment";
		return template.queryForObject(sql,Integer.class);
	}
	
//	public List<Appointment> getAppointmentList(){
//		 List<Appointment> appointmentList=template.query("select * from appointment", new RowMapper<Appointment>() {
//			public Appointment mapRow(ResultSet rs,int row) throws SQLException{
//				Appointment ap=new Appointment();	
//				ap.setAppointmentId(rs.getString(1));
//				ap.setPatientId(rs.getString(2));
//				return ap;
//			}
//		});
//		 return appointmentList;
//	}
	public List<Appointment> AppointmentList(){
		 List<Appointment> appointmentList=template.query("select * from appointment", new RowMapper<Appointment>() {
			public Appointment mapRow(ResultSet rs,int row) throws SQLException{
				Appointment ap=new Appointment();	
				ap.setAppointmentId(rs.getInt(1));
				ap.setPatientId(rs.getInt(3));
				ap.setConsultantId(rs.getInt(4));
				return ap;
			}
		});
		 return appointmentList;
	}
	
	public int confirmAppointmentForDelete(int appointmentId) {
		String sql="SELECT COUNT(*) FROM instruction WHERE appointmentId='"+appointmentId+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public void updateAppointment(Appointment ap) {
		String sql="update appointment set  patientId='"+ap.getPatientId()+"',consultantId='"+ap.getConsultantId()+"',date='"+ap.getAppointmentDate()+"' where appointmentId="+ap.getAppointmentId()+""; 
	    System.out.println(sql); 
		template.update(sql);
	}
	
	public void deleteAppointment(int appointmentId){ 
		 String sql="delete from appointment where appointmentId="+appointmentId+""; 
		  template.update(sql); 
	}
}
