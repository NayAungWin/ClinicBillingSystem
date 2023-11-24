package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Appointment;
import com.java.bean.Consultant;
import com.java.bean.Instruction;
import com.java.bean.Service;
import com.java.bean.ServiceType;

public class InstructionDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int addInstruction(Instruction i) {
		String sql = "insert into instruction (appointmentId,instructionStatus,instructionDate) values('"+i.getAppointmentId()+"','"+i.getStatus()+"','"+i.getInstructionDate()+"')";
		return template.update(sql);
	}
	
	public int addInstructionDetail(Instruction i) {
		String sql = "insert into instruction_detail (instructionId,serviceId) values('"+i.getInstructionId()+"','"+i.getServiceId()+"')";
		return template.update(sql);
	}
	
	public int checkInstructionDetailDuplicate(Instruction instruction) {
		String sql="SELECT COUNT(*) FROM instruction_detail WHERE instructionId='"+instruction.getInstructionId()+"' and serviceId='"+instruction.getServiceId()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public List<Instruction> getInstruction(){
		 List<Instruction> instructionList=template.query("select * From instruction", new RowMapper<Instruction>() {
			public Instruction mapRow(ResultSet rs,int row) throws SQLException{
				Instruction i=new Instruction();	
				i.setInstructionId(rs.getInt(1));
				i.setAppointmentId(rs.getInt(2));
				i.setStatus(rs.getString(3));
				
				return i;
			}
		});
		 return instructionList;
	}
	
	public List<Instruction> getInstructionPRN(){
		 List<Instruction> instructionList=template.query("select i.instructionId,i.appointmentId,p.patientId,p.patientName,i.instructionStatus,i.instructionDate From instruction i,appointment a,patient p where i.appointmentId = a.appointmentId and a.patientId = p.patientID and a.appointmentId", new RowMapper<Instruction>() {
			public Instruction mapRow(ResultSet rs,int row) throws SQLException{
				Instruction i=new Instruction();	
				i.setInstructionId(rs.getInt(1));
				i.setAppointmentId(rs.getInt(2));
				i.setPatientId(rs.getInt(3));
				i.setPatientName(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setInstructionDate(rs.getString(6));
				return i;
			}
		});
		 return instructionList;
	}
	
	public List<Instruction> getInstructionPRNByCurrentDate(String instructionDate){
		 List<Instruction> instructionList=template.query("select i.instructionId,i.appointmentId,p.patientId,p.patientName,i.instructionStatus,i.instructionDate From instruction i,appointment a,patient p where i.appointmentId = a.appointmentId and a.patientId = p.patientID and a.appointmentId AND i.instructionDate='"+instructionDate+"'", new RowMapper<Instruction>() {
			public Instruction mapRow(ResultSet rs,int row) throws SQLException{
				Instruction i=new Instruction();
				i.setInstructionDate(instructionDate);
				i.setInstructionId(rs.getInt(1));
				i.setAppointmentId(rs.getInt(2));
				i.setPatientId(rs.getInt(3));
				i.setPatientName(rs.getString(4));
				i.setStatus(rs.getString(5));
				i.setInstructionDate(rs.getString(6));
				return i;
			}
		});
		 return instructionList;
	}
	
	public List<Instruction> getInstructionDetail(int instructionId){
		 List<Instruction> instructionDetailList=template.query("select instruction_detail.instructionDetailId,service.serviceName,instruction_detail.instructionId from instruction_detail inner join service on instruction_detail.serviceId=service.serviceId where instruction_detail.instructionId="+instructionId+";", new RowMapper<Instruction>() {
			public Instruction mapRow(ResultSet rs,int row) throws SQLException{
				Instruction i=new Instruction();	
				i.setInstructionDetailId(rs.getInt(1));
				i.setServiceName(rs.getString(2));
				i.setInstructionId(rs.getInt(3));
				
				return i;
			}
		});
		 return instructionDetailList;
	}
	
	public int checkInstructionDuplicate(Instruction instruction) {
		String sql="SELECT COUNT(*) FROM instruction WHERE appointmentId='"+instruction.getAppointmentId()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public Instruction getInstructionByAppointmentId(int appointmentId){
		String sql ="select i.instructionId,i.appointmentId,p.patientID,p.patientName,p.gender,p.age FROM instruction i,appointment a,patient p WHERE i.appointmentId=a.appointmentId and  a.patientID=p.patientID  and i.appointmentId="+appointmentId+"";
			return template.queryForObject(sql, new RowMapper<Instruction>() {
			public Instruction mapRow(ResultSet rs,int row) throws SQLException{
				Instruction i=new Instruction();
				i.setAppointmentId(appointmentId);
				i.setPatientId(rs.getInt(3));
				i.setPatientName(rs.getString(4));
				i.setInstructionId(rs.getInt(1));
				i.setGender(rs.getString(5));
				i.setAge(rs.getString(6));
				return i;
			}
		});
	}
	
	public Instruction getInstructionId(int id) {
		String sql = "select instruction.instructionId,appointment.appointmentId,appointment.patientId,instruction.instructionStatus from instruction inner join appointment on instruction.appointmentId=appointment.appointmentId  where instructionId=" + id;
		return template.queryForObject(sql, new RowMapper<Instruction>() {
			public Instruction mapRow(ResultSet rs, int row) throws SQLException {
				Instruction i= new Instruction();
				i.setInstructionId(id);
				i.setAppointmentId(rs.getInt(2));
				i.setPatientId(rs.getInt(3));
				i.setStatus(rs.getString(4));
				return i;
			}
		});
	}
	
	public void updateInstruction(Instruction i) {
		String sql="update instruction set  appointmentId='"+i.getAppointmentId()+"',instructionStatus='"+i.getStatus()+"' where instructionId="+i.getInstructionId()+""; 
	      template.update(sql);
	}
	
	public int confirmInstructionForDelete(int appointmentId) {
		String sql="SELECT COUNT(*) FROM appointment WHERE appointmentId='"+appointmentId+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public void deleteInstruction(String id){ 
		 String sql="delete from instruction where instructionId="+id+""; 
		  template.update(sql); 
	}
	
	public void deleteInstructionDetail(String instructionDetailId){ 
		 String sql="delete from instruction_detail where instructionDetailId="+instructionDetailId+""; 
		  template.update(sql); 
	}
	
	public void delete(String id){ 
		 String sql="delete from appointment where appointmentID="+id+""; 
		  template.update(sql); 
		}

	public List<Instruction> getInstructionById(int instructionId) {
		List<Instruction> instructionList=template.query("SELECT patient.patientId,patient.patientName,patient.gender,patient.age From patient inner join appointment on appointment.patientID=patient.patientID inner join instruction on instruction.appointmentId=appointment.appointmentId where instruction.instructionId="+instructionId+";", new RowMapper<Instruction>() {
			public Instruction mapRow(ResultSet rs,int row) throws SQLException{
				Instruction i=new Instruction();	
				i.setPatientId(rs.getInt(1));
				i.setPatientName(rs.getString(2));
				i.setGender(rs.getString(3));
				i.setAge(rs.getString(4));
				
				return i;
			}
		});
		 return instructionList;
	}

	public List<Instruction> getInstructionDetailByInstructionId(int id) {
		List<Instruction> instructionList=template.query("SELECT ind.instructionId,s.serviceId,s.serviceName,p.patientId,p.patientName,p.gender,p.age,i.instructionDate From instruction i inner join instruction_detail ind on ind.instructionId = i.instructionId inner join service s on ind.serviceId = s.serviceId inner join appointment a on i.appointmentId = a.appointmentId inner join patient p on a.patientID = p.patientID where ind.instructionId=" + id, new RowMapper<Instruction>() {
			public Instruction mapRow(ResultSet rs,int row) throws SQLException{
				Instruction i=new Instruction();	
				i.setInstructionId(rs.getInt(1));
				i.setServiceId(rs.getString(2));
				i.setServiceName(rs.getString(3));
				i.setPatientId(rs.getInt(4));
				i.setPatientName(rs.getString(5));
				i.setGender(rs.getString(6));
				i.setAge(rs.getString(7));
				i.setInstructionDate(rs.getString(8));
				
				return i;
			}
		});
		 return instructionList;
	}}
