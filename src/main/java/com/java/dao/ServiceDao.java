package com.java.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Patient;
import com.java.bean.Service;
import com.java.bean.ServiceType;

public class ServiceDao {
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public void addService(Service s) {
		String sql="insert into service (serviceName,serviceTypeId,servicePrice) values('"+s.getServiceName()+"','"+s.getServiceTypeId()+"','"+s.getServicePrice()+"') ";
	     template.update(sql);
	}
	public Service getServiceById(int i) {
		String sql = "select service.serviceId,service.serviceName,service_type.serviceTypeId,service_type.serviceTypeName,service.servicePrice from service inner join service_type on service.serviceTypeId=service_type.serviceTypeId  where serviceId=" + i;
		return template.queryForObject(sql, new RowMapper<Service>() {
			public Service mapRow(ResultSet rs, int row) throws SQLException {
				Service s= new Service();
				s.setServiceId(i);
				s.setServiceName(rs.getString(2));
				s.setServiceTypeId(rs.getInt(3));
				s.setServiceTypeName(rs.getString(4));
				s.setServicePrice(rs.getString(5));
				return s;
			}
		});
	}
	
	public int checkServiceDuplicate(Service service) {
		String sql="SELECT COUNT(*) FROM service WHERE serviceName='"+service.getServiceName()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	public List<Service> getService(){
		 List<Service> serviceList=template.query("select service.serviceId,service.serviceName,service_type.serviceTypeName,service.servicePrice from service inner join service_type on service.serviceTypeId=service_type.serviceTypeId", new RowMapper<Service>() {
			public Service mapRow(ResultSet rs,int row) throws SQLException{
				Service s=new Service();	
				s.setServiceId(rs.getInt(1));
				s.setServiceName(rs.getString(2));
				s.setServiceTypeName(rs.getString(3));
				s.setServicePrice(rs.getString(4));
				return s;
			}
		});
		 return serviceList;
	}
	
	
	
	public void updateService(Service s) {
		String sql="update service set  serviceName='"+s.getServiceName()+"',serviceTypeId='"+s.getServiceTypeId()+"',servicePrice='"+s.getServicePrice()+"' where serviceID="+s.getServiceId()+""; 
	      template.update(sql);
	}
	
	public void deleteService(String id){ 
		 String sql="delete from service where serviceID="+id+""; 
		  template.update(sql); 
	}
}
