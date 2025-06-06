<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 --%>
 


    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook Register</title>
<%@include file="all_components/allCSS.jsp" %>
</head>

<body style="background-color: #f0f1f2;">

<%@include file="all_components/navbar.jsp" %>




<div class="container mt-3 mb-3">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">

<h3 class="text-center text">Registration Page</h3>
         
   
    <%
    String successMsg = (String) session.getAttribute("sussMSG");
    String failMsg = (String) session.getAttribute("failMSG");

    if (successMsg != null && !successMsg.isEmpty()) {
%>
    <p class="text-center text-success"><%=successMsg %></p>
<%
        session.removeAttribute("sussMSG");
    }

    if (failMsg != null) {
%>
    <p class="text-center text-danger"><%=failMsg %></p>
<%
        session.removeAttribute("failMSG");
    }
%>


<form action="register" method="post">
   <div class="mb-3 ">
    <label for="exampleInputFullName" class="form-label">Enter Full Name</label>
    <input type="text" class="form-control" id="exampleInputFullName"
     aria-describedby="emailHelp"  required="required" name="fname" placeholder="Enter your full name">
  </div>
  
  
   <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="email"
         name="email" required pattern="^[a-zA-Z0-9._%+-]+@gmail\.com$" placeholder="Enter your valid email">
        <div class="invalid-feedback">
          Please enter a valid Gmail address (e.g., xyz@gmail.com).
        </div>
      </div>
  
  <!-- <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp"  required="required" name="email" >
  </div> -->
  
  
  
    <div class="mb-3">
      <label for="phone" class="form-label">Phone Number</label>
      <input type="text" class="form-control" id="phone" name="phno" required
        pattern="^[6-9][0-9]{9}$" maxlength="10"
         inputmode="numeric" placeholder="Enter 10-digit mobile number">
      <div class="invalid-feedback">
        Please enter a valid Indian phone number starting with +91 and 10 digits (e.g., +919876543210).
      </div>
    </div>

    <!-- Password -->
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password" name="password" 
      required minlength="6" placeholder="Enter Password">
      <div class="invalid-feedback" >
        Password is required (at least 6 characters).
      </div>
      <!-- <div class="password-suggestions mt-1">
        🔒 Suggested: Use at least 1 uppercase, 1 number, and a symbol (e.g., `Strong@123`)
      </div> -->
    </div>
  
  
  
  
  <!-- <div class="mb-3">
    <label for="exampleInputNumber" class="form-label">Phone Number</label>
    <input type="number" class="form-control" id="exampleInputNumber"
     aria-describedby="emailHelp"  required="required" name="phno">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1"
      required="required" name="password" >
  </div> -->
  
  
  <div class="mb-3 form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check">
    <label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label> <br>
  </div>
  
  <div class="text-center">
    <button type="submit" class="btn btn-primary">Submit</button>
  
  </div>
  
</form>



</div>
</div>
</div>
</div>
</div>

<%@include file="all_components/footer.jsp" %>

</body>


</html>