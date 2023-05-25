package com.tuespot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.mysql.cj.xdevapi.Result;
import com.tuespot.entity.User;

public class UserDao {
	
	private Connection conn;

	public UserDao(Connection conn) {
		this.conn=conn;
	}
	
	public boolean addUser(User user) {
		boolean response=false;
		
		String add="Insert Into user(userName,email,password) values(?,?,?)";
		
		try {
			PreparedStatement ps=this.conn.prepareStatement(add);
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.executeUpdate();
			response=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return response;
	}
	
	public User login(String email,String password) {
		User user=null;
				
		try {
			
			String login="select * from user where email=? and password=?";
			PreparedStatement ps=this.conn.prepareStatement(login);
			ps.setString(1, email);
			ps.setString(2, password);
			
			ResultSet set=ps.executeQuery();
			
			if(set.next()) {
				
				user=new User();
				
				user.setId(set.getInt("id"));
				user.setUserName(set.getString("userName"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return user;
	}

}
