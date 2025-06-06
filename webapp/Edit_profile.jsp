<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Page</title>
<%@include file="all_components/allCSS.jsp" %>

</head>
<body style="background-color: #f7f7f7;">
<%@include file="all_components/navbar.jsp" %>

<div class="container mt-3">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center text-primary">Edit Profile</h4>


<%
    String successMsg = (String) session.getAttribute("succMsg");
    String failedMsg = (String) session.getAttribute("faildMsg");

    if (successMsg != null) {
%>
<div class="alert alert-success text-center">
    <h4 class="text-center text-success "><%=successMsg %></h4>

</div>
<%
        session.removeAttribute("succMsg");
    }

    if (failedMsg != null) {
%>
    <h4 class="text-center text-danger"><%=failedMsg %></h4>
<%
        session.removeAttribute("faildMsg");
    }
%>




<%
User u =(User) session.getAttribute("userobj");

%>

<form action="update_profile" method="post">

<input type="hidden" value="<%=u.getId()%>" name="id">

   <div class="mb-3 ">
    <label for="exampleInputFullName" class="form-label">Enter Full Name</label>
    <input type="text" class="form-control" id="exampleInputFullName"
     aria-describedby="emailHelp"  required="required" name="fname"
     value="<%=u.getName()%>">
  </div>
  
  
   <div class="mb-3">
        <label for="email" class="form-label">Email address</label>
        <input type="email" class="form-control" id="email"
         name="email" required  value="<%=u.getEmail()%>">
   </div>
  
 
  
    <div class="mb-3">
      <label for="phone" class="form-label">Phone Number</label>
      <input type="tel" class="form-control" id="phone" name="phno" 
              placeholder="+91XXXXXXXXXX" value="<%=u.getPhno()%>">
       </div>

    <!-- Password -->
    <div class="mb-3">
      <label for="password" class="form-label">Password</label>
      <input type="password" class="form-control" id="password"
       name="password"  value="">
     
    </div>
  
  
  <div class="text-center">
    <button type="submit" class="btn btn-primary">Update</button>
  
  </div>
  
</form>

</div>
</div>
</div>
</div>

</div>

</body>
</html>