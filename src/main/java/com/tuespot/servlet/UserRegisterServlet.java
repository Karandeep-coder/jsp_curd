package com.tuespot.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.protobuf.TextFormat.Printer;
import com.tuespot.dao.UserDao;
import com.tuespot.entity.User;
import com.tuespot.helper.JdbcConn;

@MultipartConfig
public class UserRegisterServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setContentType("text/html");
		PrintWriter out=resp.getWriter();
		
		String userName=req.getParameter("userName");
		String email=req.getParameter("email");
		String password=req.getParameter("password");
		
		User user=new User(userName, email, password);
		System.out.println(user.toString());
		UserDao userDao=new UserDao(JdbcConn.getConnection());
		boolean response=userDao.addUser(user);
		
		if(response) {
			System.out.println("User Submit Successfully");
			out.println("done");
		}else {
			System.out.println("User Not Submit Successfully");
			out.println("User Not Submit Successfully");
		}
		
	}
}
