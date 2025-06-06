<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook : Index</title>
<%@include file="all_components/allCSS.jsp" %>

<style type="text/css">

.back-img{
background-image: url("img/b.jpg");
height: 75vh;
width: 100%;
background-size: cover;
background-repeat: no-repeat;
}

.crd-hover:hover {
	background-color: #fcf7f7;
}

</style>

</head>
<body style="background-color: #f7f7f7;">

<%
 User u=(User)  session.getAttribute("userobj");
%>




<%@include file="all_components/navbar.jsp" %>

<div class="container-fluid back-img">
<!-- <h2 class="text-center text-danger">Ebook Management System</h2> -->
</div>

<%-- check connection querry
 <% Connection conn=DBConnect.getConn();
out.println(conn);
%> --%>


         <!--  Start Recent Book  -->
         
<div class="container">
<h3 class="text-center mt-4">Recent Book </h3>
<div class="row mt-2">

     <%
     BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
     List<BookDetails> list2=dao2.getRecentBook();
     
     for(BookDetails b:list2){
     %>	
     
     <div class="col-md-3">
<div class="card crd-hover">
<div class="card-body text-center">
       <img alt="" src="img/<%=b.getPhoto() %>" style="width:150px; height: 200px; " class="img-thumblin">
        <p><%=b.getBookname() %></p>
        <p><%=b.getAuthor() %></p>
        <p>
        
        <%
        if(b.getBookCategory().equals("Old"))
        {%>
        
        Categories: <%=b.getBookCategory() %></p>
        	<div class="">
        	 
    <a href="view_details.jsp?id=<%=b.getBookID() %>" class="btn btn-success btn-sm ml-1 ">View details</a>
    <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-rupee-sign"></i></a>
     </div>
        	
       <% }
        else{
        %>
        
       
       <p>Categories: <%=b.getBookCategory() %></p>
<div class="">

    <%
   if(u==null){%>
       <a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
   
   <%
   }else{ %>
	   
  
       <a href="cart?bid=<%=b.getBookID() %>&&uid=<%=u.getId() %>" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
	   
   <%}
   %>


    <a href="view_details.jsp?id=<%=b.getBookID() %>" class="btn btn-success btn-sm ml-1 ">View details</a>
    <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-rupee-sign"></i></a>
</div>
        
        	
        <%}
        %>
        
        
      
</div>
</div>
</div> 
     
    <%
     }
    %>
       
</div>
<div class="text-center mt-4">
<a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>

</div>
</div>
<!--  End Recent Book  -->

<hr>


<!--  Start New Book  -->
         
<div class="container">
<h3 class="text-center mt-4">New Book </h3>
<div class="row mt-2">




    <%  
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    List<BookDetails> list= dao.getNewBook();
    
    for (BookDetails b:list){
    %>
    <div class="col-md-3">
    
    <div class="card crd-hover">
   <div class="card-body text-center">
       <img alt="" src="img/<%=b.getPhoto() %>" style="width:150px; height: 200px; " class="img-thumblin">
        <p><%=b.getBookname() %></p>
        
        <p><%=b.getAuthor() %></p>
        
        <p>Categories: <%=b.getBookCategory() %></p>
        
   <div class="">
   
   <%
   if(u==null){%>
       <a href="login.jsp" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
   
   <%
   }else{ %>
	   
  
       <a href="cart?bid=<%=b.getBookID() %>&&uid=<%=u.getId() %>" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
	   
   <%}
   %>
   
   
    
    
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
<div class="text-center mt-4">
<a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>

</div>
</div>
<!--  End New Book  -->

<hr>



               <!--  Start old Book  -->
         
<div class="container">
<h3 class="text-center mt-4">Old Book </h3>
<div class="row mt-2">

     <%
     BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
     List<BookDetails> list3=dao3.getOldBook();
     
     for(BookDetails b:list3){
     %>	
     
     <div class="col-md-3">
<div class="card crd-hover">
<div class="card-body text-center">
       <img alt="" src="img/<%=b.getPhoto() %>" style="width:150px; height: 200px; " class="img-thumblin">
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
<div class="text-center mt-4">
<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View All</a>

</div>
</div>
<!--  End Old Book  -->

<%@include file="all_components/footer.jsp" %>

</body>
</html>