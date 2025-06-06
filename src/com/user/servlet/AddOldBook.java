package com.user.servlet;



import java.io.File;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.mysql.cj.Session;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;


@WebServlet("/add_old-book")
@MultipartConfig
public class AddOldBook extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String categories="Old";
			String status="Active";
			Part paart = (Part) req.getPart("bimg");
			String filName = paart.getSubmittedFileName();
			
			String useremail=req.getParameter("user"); // get data by email sell_book.jsp 
			
			BookDetails b = new BookDetails(bookName,author,price,categories,status,filName,useremail);
//			System.out.println(b);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
//			
			
			
			
			
			boolean f= dao.addBooks(b);
			
			HttpSession session=req.getSession();
			
			if (f) {
				
				String path=getServletContext().getRealPath("")+"img";
//				System.out.println(path);
				File fi= new File(path);
				paart.write(path + File.separator + filName);
			
				session.setAttribute("succMSG", "Book Add Successfully..!!");
				resp.sendRedirect("sell_book.jsp");
			} 
			else {
				session.setAttribute("faildMSG", "Something wrong on server..!!");
				resp.sendRedirect("sell_book.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}

