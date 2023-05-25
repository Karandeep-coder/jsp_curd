<%@page import="com.tuespot.helper.JdbcConn"%>
<%@page import="com.tuespot.dao.EmployeeDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String id=request.getParameter("id");

	int ids=Integer.parseInt(id);
	
	EmployeeDao empDao=new EmployeeDao(JdbcConn.getConnection());
	empDao.delete(ids);
	response.sendRedirect("employeelist.jsp");

%>