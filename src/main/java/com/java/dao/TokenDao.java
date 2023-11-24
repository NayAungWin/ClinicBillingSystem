package com.java.dao;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.java.bean.Patient;
import com.java.bean.Token;
import com.java.bean.User;

import util.PasswordEncoder;

public class TokenDao {
	
	JdbcTemplate template;
	public void setTemplate(JdbcTemplate template) {
		this.template=template;
	}
	
	public int addToken(Token t) {
		String sql = "insert into token (tokenNumber) values('"+ t.getTokenNumber()+"')";
		return template.update(sql);
	}
	
	public int getMaxTokenId() {
		String sql = "SELECT max(tokenId) FROM token";
		
		return template.queryForObject(sql,Integer.class);	
		
		
	}	
	
	public int checkTokenDuplicate(Token t) {
		String sql="SELECT COUNT(*) FROM token WHERE tokenNumber='"+t.getTokenNumber()+"'";
		int count=template.queryForObject(sql,Integer.class);
		return count;
	}
	
	
}
