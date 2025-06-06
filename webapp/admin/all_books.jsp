<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDetails"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
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

 
     <%
    String successMsg = (String) session.getAttribute("succMSG");
    String failMsg = (String) session.getAttribute("faildMSG");

    if (successMsg != null) {
%>
        <h5 class="text-center text-success"  ><%= successMsg %></h5>
<%
        session.removeAttribute("succMSG"); // Remove after displaying
    }

    if (failMsg != null) {
%>
        <h5 class="text-center text-danger"><%= failMsg %></h5>
<%
        session.removeAttribute("faildMSG"); // Remove after displaying
    }
%> 

<table class="table table-striped">

  <thead class="">
    <tr >
      <th scope="col">ID</th>
       <th scope="col">Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Categories</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
                
       <%
         BookDAOImpl dao =  new BookDAOImpl(DBConnect.getConn());
       List<BookDetails> list = dao.getAllBook();
       
       for(BookDetails b : list){
    	   
       %>        
          
    <tr>
       <td> <%=b.getBookID() %></td>
      <td><img src="../img/<%=b.getPhoto() %>" style="width: 50px; height: 50px;" ></td>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %> </td>
       <td><%=b.getPrice() %></td>
      <td><%=b.getBookCategory() %></td>
      <td><%=b.getStatus()%></td>
      
      
       <td>
     <a href="edit_books.jsp?id=<%=b.getBookID() %>" class="btn-btn-sm btn-primary"><i class="fa-solid fa-pen-to-square"></i>Edit</a> 
    
      <a href="../delete?id=<%=b.getBookID() %>" class="btn-btn-sm btn-danger"><i class="fa-solid fa-trash"></i>Delete</a>  
      </td>
      
     
    </tr>
    <%
       }   
   %>
     
   
  </tbody>
</table>

   <%-- <div style="margin-top: 340px">
    <%@include file="footer.jsp" %>
    </div> --%>

</body>
</html>