package com.tuespot.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tuespot.dao.EmployeeDao;
import com.tuespot.entity.Employee;
import com.tuespot.helper.JdbcConn;

@MultipartConfig
public class EmployeeServlet extends HttpServlet{


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		String eName=req.getParameter("eName");
		String emailId=req.getParameter("emailId");
		String phoneNo=req.getParameter("phoneNo");
		String salary=req.getParameter("salary");

		
		Employee emp=new Employee(eName, emailId, phoneNo, salary);
		EmployeeDao empDao=new EmployeeDao(JdbcConn.getConnection());
		boolean response=empDao.addEmployee(emp);
		
		if(response) {
			out.println("done");
			System.out.println("done");
			resp.sendRedirect("employeelist.jsp");
		}else {
			System.out.println("Error");
		}
	}
}
