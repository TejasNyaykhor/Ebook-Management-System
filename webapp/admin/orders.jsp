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
<title>Admin: All Orders</title>
<%@include file="StyleAdmin.jsp"%>
</head>
<body>
<%@include file="navbar.jsp" %>


<%
    Object userobjs = session.getAttribute("userobj");
    if (userobjs == null) {
        response.sendRedirect("../login.jsp");
    }
%>

<h3 class="text-center text-success">Hello' Admin</h3>

<table class="table table-striped">

  <thead class="">
    <tr >
      <th scope="col">Order ID</th>
      <th scope="col"> Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Mobile No.</th>
      <th scope="col">Book Name</th>
      <th scope="col">Aurthor</th>
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  
  BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
  List<Book_Order> blist=dao.getAllOrder();
  for(Book_Order b:blist)
  {%>
	   <tr>
      <th scope="row"><%=b.getOrderId() %></th>
      <td><%=b.getUserName() %></td>
      <td><%=b.getEmail() %></td>
      <td><%=b.getFulladd() %></td>
       <td><%=b.getPhone() %></td>
      <td><%=b.getBookName() %></td>
       <td><%=b.getAuthor() %></td>
       <td><%=b.getPrice() %></td>
      <td><%=b.getPaymentType() %></td>
     </tr>
	  
  <%}
  
  %>
  
   
     
  
  </tbody>
</table>

  <div style="margin-top: 340px">
    <%@include file="footer.jsp" %>
    </div>

</body>
</html>