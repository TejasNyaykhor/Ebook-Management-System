<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 --%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook Login</title>
<%@include file="all_components/allCSS.jsp" %>
</head>

<body style="background-color: #f0f1f2;">
<%@include file="all_components/navbar.jsp" %>

<div class="container mt-3 mb-3">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">

<h3 class="text-center text">Login</h3>


 <%
    String faildMsg = (String) session.getAttribute("faildMsg");
    if (faildMsg != null && !faildMsg.isEmpty()) {
%>
    <h5 class="text-center text-success"><%=faildMsg %></h5>
<%
        session.removeAttribute("faildMsg");
    }
%>

     
     


   <form action="login" method="post">
   
   <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="email"
         name="email" required pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$">
        <div class="invalid-feedback">
          Please enter a valid Gmail address (e.g., xyz@gmail.com).
        </div>
      </div>
   
 <!--  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp" required="required" name="email" >
  </div> -->
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control"
     id="exampleInputPassword1" required="required" name="password">
  </div>
  
 
  
  <div class="text-center">
    <button type="submit" class="btn btn-primary">Login</button><br>
    <a href="register.jsp">Create Account</a>
  </div>
  
</form>

</div>
</div>
</div>
</div>
</div>




</body>
</html>