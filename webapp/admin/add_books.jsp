<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"%>  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Add Books</title>
<%@include file="StyleAdmin.jsp"%>
</head>
<body style="background-color: #f0f2f2">
<%@include file="navbar.jsp" %>

       <%
    Object userobjs = session.getAttribute("userobj");
    if (userobjs == null) {
        response.sendRedirect("../login.jsp");
    }
%>
    
    <div class="container">
    <div class="row">
    <div class="col-md-4 offset-md-4">
    <div class="card">
    <div class="card-body">
    
    <h4 class="text-center">Add Books</h4>
    
    
     <%
    String successMsg = (String) session.getAttribute("succMSG");
    String failMsg = (String) session.getAttribute("faildMSG");

    if (successMsg != null) {
%>
        <div class="text-center text-success"  ><%= successMsg %></div>
<%
        session.removeAttribute("succMSG"); // Remove after displaying
    }

    if (failMsg != null) {
%>
        <div class="text-center text-danger"><%= failMsg %></div>
<%
        session.removeAttribute("faildMSG"); // Remove after displaying
    }
%> 



    
    
      <form action="../add_books" method="post"
      enctype="multipart/form-data"
      >
   <div class="mb-3 ">
    <label for="exampleInputName" class="form-label">Book Name*</label>
    <input type="text" class="form-control" id="exampleInputName"
     aria-describedby="emailHelp"  required="required" name="bname" >
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Auther Name*</label>
    <input type="text" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp"  required="required" name="author"  >
  </div>
  
  <div class="mb-3">
    <label for="exampleInputNumber" class="form-label">Price*</label>
    <input type="number" class="form-control" id="exampleInputNumber"
     aria-describedby="emailHelp"  required="required" name="price">
  </div>
  
  <div class="mb-3">
    <label for="inputState">Book Categories</label>
    <select   class="form-control" name="btype" id="inputState" aria-label="Default select example">
  <option selected>--select--</option>
  <option value="New">New Book</option>
 
   </select>
  </div>
  
  
   <div class="mb-3">
    <label for="inputState">Book Status</label>
   <select  class="form-control" name="bstatus" id="inputState" aria-label="Default select example">
  <option selected>--select--</option>
  <option value="Active">Active</option>
   <option value="Inactive">Inactive</option>
</select>
  </div>
  
  
  <div class="mb-3">
<label for="exampleFormControlFile1" >Upload Photo</label>
<input type="file" name="bimg" class="form-control-file" id="exampleFormControlFile1" >
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

     
        
</body>
</html>