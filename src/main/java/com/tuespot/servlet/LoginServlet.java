package com.tuespot.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tuespot.dao.UserDao;
import com.tuespot.entity.User;
import com.tuespot.helper.JdbcConn;

@MultipartConfig
public class LoginServlet extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		String userName=req.getParameter("userName");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		System.out.println(password);
		
		User user=new User(userName, email, password);
		System.out.println(user.toString());
		UserDao userDao=new UserDao(JdbcConn.getConnection());
		User u=userDao.login(email, password);
		
		if(u == null) {
			
//			resp.sendRedirect("login.jsp");
			System.out.println("Invaild User name and Password");
			
		}else {
			HttpSession s=req.getSession();
			s.setAttribute("currentUser", u);
			resp.sendRedirect("index.jsp");
			out.println("done");
		}
		
	}
	
}
