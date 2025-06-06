package com.admin.servlet;

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


@WebServlet("/add_books")
@MultipartConfig
public class BooksAdd extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String bookName=req.getParameter("bname");
			String author=req.getParameter("author");
			String price=req.getParameter("price");
			String categories=req.getParameter("btype");
			String status=req.getParameter("bstatus");
			Part paart = (Part) req.getPart("bimg");
			String filName = paart.getSubmittedFileName();
			
			BookDetails b = new BookDetails(bookName,author,price,categories,status,filName,"admin");
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
				resp.sendRedirect("admin/add_books.jsp");
			} 
			else {
				session.setAttribute("faildMSG", "Something wrong on server..!!");
				resp.sendRedirect("admin/add_books.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	

}
