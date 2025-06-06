package com.user.servlet;

import java.io.IOException;


import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet  extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String name=req.getParameter("fname");
			String email=req.getParameter("email");
			String phno=req.getParameter("phno");
			String password=req.getParameter("password");
			String check=req.getParameter("check");
			
//			System.out.println(name+" "+email+" "+phno+" "+password+" "+check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
			us.setPhno(phno);
			us.setPassword(password);
			
			
			//is command se hum hamare seesion me query show kar skte jo user
			//login ya register karga voh 
			 HttpSession session=req.getSession();
			
			if (check!=null) {
				UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
				
				//Duplicate Email checking logic 
				boolean f2=dao.checkUser(email);
				if(f2)
				{
					boolean f = dao.userRegister(us);
					
					if (f) {
//						System.out.println("You have successfully Registerd..!!");
						
						session.setAttribute("sussMSG", "You have Successfully Registerd..!!");
						resp.sendRedirect("register.jsp");
					}
					else {
//						System.out.println("Something wrong on server..!!");
						
						session.setAttribute("failMSG", "Something wrong on server..!!");
						resp.sendRedirect("register.jsp");
					}
				
				}
				else
				{
					
					session.setAttribute("failMSG", "User already exist, Try another Email ID..!");
					resp.sendRedirect("register.jsp");
					
				}
				
				
				
			}
			else {
//				System.out.println("Please check Agree Terms & Condition..!!");
				
				session.setAttribute("failMSG", "Please check Agree Terms & Condition..!!");
				resp.sendRedirect("register.jsp");
			}
			
			
		}
			
catch (Exception e) {
	e.printStackTrace();
}

	
	
}}
