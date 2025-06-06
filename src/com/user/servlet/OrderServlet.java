package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.DAO.BookOrderImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.Book_Order;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			HttpSession session=req.getSession();
			
			
			int id=Integer.parseInt(req.getParameter("id"));
			
			String name=req.getParameter("username");
			String email=req.getParameter("email");
			String phone=req.getParameter("phone");
			String address=req.getParameter("address");
			String landmark=req.getParameter("landmark");
			String city=req.getParameter("city");
			String state=req.getParameter("state");
			String pincode=req.getParameter("pincode");
			String paymentType=req.getParameter("payment");
			
			
			String fullAdd=address+","+landmark+","+city+","+state+","+pincode;
			
		//	System.out.println(name+" "+email+" "+phone +" "+fullAdd+" "+paymentType);
			
			CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
			
			List<Cart> blist=dao.getBookByUser(id);
			
//	eror check code 		for(Cart c:blist) {
//				System.out.println(c.getBookName());
//			}
//			
			
			
			
			
				
		if(blist.isEmpty()) {      // Yaha Maine Ek Condition lagayi hai Agar User ne koi Book ADD to Cart nahi kiya hai toh voh Book Order nahi kar skta 

			 session.setAttribute("faildMsg", "You didn’t add the item");
			resp.sendRedirect("cart.jsp");
			
		}else {
	BookOrderImpl dao2= new BookOrderImpl(DBConnect.getConn());
			
			
			Book_Order o = null;
			
			
			//jitne bhi book add honge usko mai List ke andder add karte jaumga 
			ArrayList<Book_Order> orderList=new ArrayList<Book_Order>();
			
			// Random class se hum Random numbers generate kar skte hai isse har ek user ka Unique ID generate honga 
			Random r = new Random();
			
			for(Cart c:blist) 
			{
				
			     o=new Book_Order();
				o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
				o.setUserName(name);
				o.setEmail(email);
				o.setPhone(phone);
				o.setFulladd(fullAdd);
				o.setBookName(c.getBookName());
				o.setAuthor(c.getAuthor());
				o.setPrice(c.getPrice()+"");
				o.setPaymentType(paymentType);
				orderList.add(o);
				
			}
			
			if ("noselect".equals(paymentType)) {
			    session.setAttribute("faildMsg", "Please Choose Payment Type");
			    resp.sendRedirect("cart.jsp");
			    return; 
			} else {
			    boolean f = dao2.saveOrder(orderList);

			    if (f) {
			        resp.sendRedirect("order_success_msg.jsp");
			       
			    } else {
			        session.setAttribute("faildMsg", "Order Failed");
			        resp.sendRedirect("cart.jsp");
			       
			    }
			}

		}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
}
