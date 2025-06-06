package com.user.servlet;

import java.io.IOException;

import com.DAO.ContactDAOImpl;
import com.DB.DBConnect;
import com.entity.contact;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/contactserv")
public class ContactServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		  
		
		try {
			
			
			String name=req.getParameter("cname");
			String email=req.getParameter("cemail");
			String subj=req.getParameter("csubject");
			String massage=req.getParameter("cmessage");
			
// System.out.println(name+" "+email+" "+subj+" "+massage);

     contact c= new contact();
     c.setName(name);
     c.setEmail(email);
     c.setSubject(subj);
     c.setMessege(massage);
     
   
     ContactDAOImpl dao = new ContactDAOImpl(DBConnect.getConn());
	    boolean uc = dao.userContact(c);
     HttpSession session=req.getSession();
     if (uc) {
    	 session.setAttribute("succMsg", "Message sent successfully.");
    	 resp.sendRedirect("contact.jsp");
    	
	}
     else {
    	 session.setAttribute("failedMsg", "Something went wrong.");
			/* resp.sendRedirect("thankyou.jsp"); */
    	 resp.sendRedirect("contact.jsp");
	}
     
    


			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	

}
