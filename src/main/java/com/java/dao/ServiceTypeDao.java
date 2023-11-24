package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Consultant;
import com.java.bean.ServiceType;

public class ServiceTypeDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int addServiceType(ServiceType st) {
		String sql = "insert into service_type (serviceTypeName) values('"+ st.getServiceTypeName() +"')";
		return template.update(sql);
	}
	public List<ServiceType> getServiceType(){
		 List<ServiceType> serviceTypeList=template.query("select * from service_type", new RowMapper<ServiceType>() {
			public ServiceType mapRow(ResultSet rs,int row) throws SQLException{
				ServiceType st=new ServiceType();	
				st.setServiceTypeId(rs.getInt(1));
				st.setServiceTypeName(rs.getString(2));
				return st;
			}
		});
		 return serviceTypeList;
	}
	
	public int checkServiceTypeDuplicate(ServiceType serviceType) {
		String sql="SELECT COUNT(*) FROM service_type WHERE serviceTypeName='"+serviceType.getServiceTypeName()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public ServiceType getSerTypeById(int id) {
		String sql = "select * from service_type where serviceTypeId=" + id;
		ServiceType serviceType= template.queryForObject(sql, new RowMapper<ServiceType>() {
			public ServiceType mapRow(ResultSet rs, int row) throws SQLException {
				ServiceType st = new ServiceType();
				st.setServiceTypeId(id);
				st.setServiceTypeName(rs.getString(2));
				return st;
			}
		});
		return serviceType;
	}
	
	public int confirmServiceTypeForDelete(String serviceTypeId) {
		String sql="SELECT COUNT(*) FROM service WHERE serviceTypeId='"+serviceTypeId+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public void updateSerType(ServiceType st) {
		String sql="update service_type set  serviceTypeName='"+st.getServiceTypeName()+"' where serviceTypeID="+st.getServiceTypeId()+""; 
	      template.update(sql);
	}
	
	public void deleteSerType(String id){ 
		 String sql="delete from service_type where serviceTypeID="+id+""; 
		  template.update(sql); 
	}

}
