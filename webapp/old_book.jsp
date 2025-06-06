<%@page import="java.util.List"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Old Book</title>
<%@include file="all_components/allCSS.jsp" %>
</head>
<body style="background-color: #f7f7f7;">
<%@include file="all_components/navbar.jsp" %>


<%
    String successMsg = (String) session.getAttribute("succMsg");
    String failedMsg = (String) session.getAttribute("faildMsg");

    if (successMsg != null) {
%>
<div class="alert alert-success text-center">
    <p class="text-center text-success "><%=successMsg %></p>

</div>
<%
        session.removeAttribute("succMsg");
    }

    if (failedMsg != null) {
%>
    <p class="text-center text-danger"><%=failedMsg %></p>
<%
        session.removeAttribute("faildMsg");
    }
%>




    

<div class="container p-5">
<table class="table">
  <thead class="table-primary">
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">price</th>
      <th scope="col">Category</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
  <%
  User u =(User) session.getAttribute("userobj");
  String email=u.getEmail();
  BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
  List<BookDetails> list=dao.getBookByOld(email, "Old");
  
  for(BookDetails b:list)
  {
  %>
  
   <tr>
      <td><%=b.getBookname() %></td>
      <td><%=b.getAuthor() %></td>
       <td><%=b.getPrice() %></td>
       <td><%=b.getBookCategory()%></td>
      <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookID()%>" 
      class="btn btn-sm btn-danger">Delete</a></td>
    </tr>  <!-- servlet mapping creating user servlet -->  
  <%} %>  

    
   
  </tbody>
</table>
</div>

</body>
</html>