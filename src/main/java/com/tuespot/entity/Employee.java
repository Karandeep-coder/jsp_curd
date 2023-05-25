package com.tuespot.entity;

public class Employee {
	
	private int id;
	private String eName;
	private String emailId;
	private String phoneNo;
	private String salary;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String geteName() {
		return eName;
	}
	public void seteName(String eName) {
		this.eName = eName;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	
	public Employee(int id, String eName, String emailId, String phoneNo, String salary) {
		super();
		this.id = id;
		this.eName = eName;
		this.emailId = emailId;
		this.phoneNo = phoneNo;
		this.salary = salary;
	}
	
	public Employee(String eName, String emailId, String phoneNo, String salary) {
		super();
		this.eName = eName;
		this.emailId = emailId;
		this.phoneNo = phoneNo;
		this.salary = salary;
	}
	
	public Employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "Employee [id=" + id + ", eName=" + eName + ", emailId=" + emailId + ", phoneNo=" + phoneNo + ", salary="
				+ salary + "]";
	}
}
