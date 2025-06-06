package com.admin.servlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/delete")
public class BooksDeleteServlet  extends HttpServlet{

	private static final long serialVersionUID = 1L;

	// By default Get method use karenge kyuki Anker Tag Me Default get method use hoti hai...

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			
			int id =Integer.parseInt(req.getParameter("id"));
			
			//BookDAOImpl cha object ghyacha ahe karn ty madhe apan implement kele ahe delebook la
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteBook(id);
			
            HttpSession session= req.getSession();
			
			if (f) {
				
				session.setAttribute("succMSG", "Book Delete Successfully");
			resp.sendRedirect("admin/all_books.jsp");
				
			}
			else {
				
				session.setAttribute("faildMSG", "Something Wrong on server");
				resp.sendRedirect("admin/all_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

	
	
}
