<%@page import="com.entity.User"%>
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
<title>All New Book</title>
<%@include file="all_components/allCSS.jsp" %>

<style type="text/css">

.crd-hover:hover {
	background-color: #fcf7f7;
}

</style>

</head>
<body>

     <%
     User u=(User)  session.getAttribute("userobj");
     %>

    
     


<%@include file="all_components/navbar.jsp" %>

<div  class="container-fluid mt-3">
<div class="row p-3">


<%
    String addcartMsg = (String) session.getAttribute("addcart");
    String failMsg = (String) session.getAttribute("failed");

    if (addcartMsg != null) {
%>
        <div class="text-center text-success h3"  ><%=addcartMsg %></div>
<%
        session.removeAttribute("addcart"); // Remove after displaying
    }

    if (failMsg != null) {
%>
        <div class="text-center text-danger h3"><%= failMsg %></div>
<%
        session.removeAttribute("failed"); // Remove after displaying
    }
%> 



  <%  
    BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
    List<BookDetails> list= dao.getAllNewBook();
    
    for (BookDetails b:list){
    %>
    <div class="col-md-3">
    
    <div class="card crd-hover mt-2">
   <div class="card-body text-center">
       <img alt="" src="img/<%=b.getPhoto() %>" style="width:100px; height: 150px; " class="img-thumblin">
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
</div>

</body>
</html>