<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Old Book</title>
<%@include file="all_components/allCSS.jsp" %>

<style type="text/css">

.crd-hover:hover {
	background-color: #fcf7f7;
}

</style>

</head>
<body>
<%@include file="all_components/navbar.jsp" %>

<div  class="container-fluid mt-3">
<div class="row p-3">

 <%
     BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
     List<BookDetails> list3=dao3.getAllOldBook();
     
     for(BookDetails b:list3){
     %>	
     
     <div class="col-md-3">
<div class="card crd-hover mt-2">
<div class="card-body text-center">
       <img alt="" src="img/<%=b.getPhoto() %>" style="width:100px; height: 150px; " class="img-thumblin">
        <p><%=b.getBookname() %></p>
        <p><%=b.getAuthor() %></p>
        <p><%=b.getBookCategory() %></p>
        
  <div class="">
   
    <a href="view_details.jsp?id=<%=b.getBookID() %>" class="btn btn-success btn-sm ml-1 ">View details</a>
       <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-rupee-sign"></i></a>
</div>
        
      
</div>
</div>
</div> 
     
    <%
     }
    %>



</div>
</div>

</body>
</html>