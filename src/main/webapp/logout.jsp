<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	HttpSession sessions=request.getSession();
	sessions.removeAttribute("currentUser");
	sessions.invalidate();
	response.sendRedirect("login.jsp");
%>