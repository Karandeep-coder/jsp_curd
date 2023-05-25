package com.tuespot.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.tuespot.entity.Employee;

public class EmployeeDao {
	
	private Connection conn;

	public EmployeeDao(Connection conn) {
		this.conn=conn;
	}
	
	public boolean addEmployee(Employee emp) {
		
		boolean response=false;
		String addEmp="Insert Into employee(eName,emailId,phoneNo,salary) values(?,?,?,?)";
		try {
			PreparedStatement psmt=conn.prepareStatement(addEmp);
			psmt.setString(1, emp.geteName());
			psmt.setString(2, emp.getEmailId());
			psmt.setString(3, emp.getPhoneNo());
			psmt.setString(4, emp.getSalary());
			psmt.executeUpdate();
			response=true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return response;
	}
	
	
	public List<Employee> getAllEmployee() {
		List<Employee> list=new ArrayList();
		String allData="select * from employee";
		
		try {
			PreparedStatement ps=conn.prepareStatement(allData);
			ResultSet set=ps.executeQuery();
			while(set.next()) {
				Employee emp=new Employee();
				emp.setId(set.getInt("id"));
				emp.seteName(set.getString("eName"));
				emp.setEmailId(set.getString("emailId"));
				emp.setPhoneNo(set.getString("phoneNo"));
				emp.setSalary(set.getString("salary"));
				list.add(emp);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List<Employee> getEmployeeById(int id) {
		List<Employee> list=new ArrayList();
		String allDataByid="select * from employee where id=?";
		
		try {
			PreparedStatement ps=conn.prepareStatement(allDataByid);
			ps.setInt(1, id);
			ResultSet set=ps.executeQuery();
			while(set.next()) {
				Employee emp=new Employee();
				emp.setId(set.getInt("id"));
				emp.seteName(set.getString("eName"));
				emp.setEmailId(set.getString("emailId"));
				emp.setPhoneNo(set.getString("phoneNo"));
				emp.setSalary(set.getString("salary"));
				list.add(emp);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void delete(int id) {
		String delete="DELETE FROM employee WHERE id=?";
		System.out.println("id"+id);
		try {
			PreparedStatement ps=conn.prepareStatement(delete);
			ps.setInt(1, id);
			ps.executeUpdate();
			System.out.println("ok delete");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	public boolean update(Employee emp) {
		String update="UPDATE employee SET eName=?,emailId=?,phoneNo=?,salary=? WHERE id=?";
		boolean response=false;

			try {
				PreparedStatement psmt=conn.prepareStatement(update);
				psmt.setString(1, emp.geteName());
				psmt.setString(2, emp.getEmailId());
				psmt.setString(3, emp.getPhoneNo());
				psmt.setString(4, emp.getSalary());
				psmt.setInt(5, emp.getId());
				System.out.println("line 155 "+emp.toString());
				psmt.executeUpdate();
				response=true;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			return response;

		
	}
	

}
