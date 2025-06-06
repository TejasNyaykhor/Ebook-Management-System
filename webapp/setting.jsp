<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>setting Page</title>
<%@include file="all_components/allCSS.jsp" %>

<style type="text/css">
a{
text-decoration: none;
color:black;


}
</style>

</head>

<body style="background-color: #f7f7f7;">

<%
    Object userobjs = session.getAttribute("userobj");
    if (userobjs == null) {
        response.sendRedirect("login.jsp");
         }
  %>  
  
           
           

<%@include file="all_components/navbar.jsp" %>

<div class="container mt-2">
<%
if (userobjs != null) {
        String name = ((User) userobjs).getName(); // Replace 'YourUserClass' with your actual class
%>
        <h3 class="text-center text-primary">Hello, <%=name %></h3>
<%
    }
%>
   



<div class="row p-5">
<div class="col-md-4">
<a href="sell_book.jsp">
<div class="card ">
<div class="card-body text-center">
<div class=""><i class="fa-solid fa-book-atlas fa-4x" style="color: #77ff77;"></i>
</div>
<h3>Sell Old Book</h3>
</div>
</div>
</a>
</div>


<div class="col-md-4">
<a href="old_book.jsp">
<div class="card ">
<div class="card-body text-center">
<div class=""><i class="fa-solid fa-book-atlas fa-4x" style="color: #77ff77;"></i>
</div>
<h3>Old Book</h3>
</div>
</div>
</a>
</div>

<div class="col-md-4">
<a href="Edit_profile.jsp">
<div class="card ">
<div class="card-body text-center">
<div class=""><i  class="fa-solid fa-user-pen fa-4x" style="color: #74c0fc;"></i>
</div>
<h3>Edit Profile</h3>
</div>
</div>
</a>
</div>





<div class="col-md-6 mt-3">
<a href="orders.jsp">
<div class="card ">
<div class="card-body text-center">
<div class=""><i class="fa-solid fa-box-open fa-4x" style="color: #ff80ff;"></i>
</div>
<h3>My Orders</h3>
<p>Track  your  Order</p>
</div>
</div>
</a>
</div>


<div class="col-md-6 mt-3">
<a href="helpline.jsp">
<div class="card ">
<div class="card-body text-center">
<div class=""><i class="fa-solid fa-handshake-angle fa-4x" style="color: #ff8040;"></i>
</div>
<h3>Help Center</h3>
<p>24 x 7 Service</p>
</div>
</div>
</a>
</div>




</div>

</div>


<div class="container-fluid text-center text-white p-3 mt-5" 
style= background-color:#303f9f;">

<h5>Design and Develop by CodeWith @TejasNyaykhor </h5>
</div>

</body>
</html>