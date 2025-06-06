<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Page</title>
<%@include file="all_components/allCSS.jsp" %>
</head>
<body style="background-color: #f7f7f7;">
<%@include file="all_components/navbar.jsp" %>


  <%
    Object userobjs = session.getAttribute("userobj");
    if (userobjs == null) {
        response.sendRedirect("login.jsp");
        return; 
    }  
%>


<div class="container mt-3">
<h2 class="text-center text-info" >Your Orders</h2>
<table class="table">
  <thead >
    <tr class="bg-warning">
      <th scope="col">Order ID</th>
      <th scope="col">Name </th>
      <th scope="col">Book Name</th>
      <th scope="col">Author </th>
       <th scope="col">Price </th>
        <th scope="col">Payment Type </th>
    </tr>
  </thead>
  <tbody >
  
  <%
        User u=(User)session.getAttribute("userobj");
        BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
        List<Book_Order> blist=dao.getBook(u.getEmail());
        
        for(Book_Order b:blist)
        { %>
        	
        <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUserName() %></td>
      <td><%=b.getBookName() %></td>
      <td><%=b.getAuthor() %></td>
      <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
    </tr>	
        	
        <%
        }
         %>
  
    
   

  </tbody>
</table>

</div>

</body>
</html>