<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us</title>
    <%@include file="all_components/allCSS.jsp" %>
    
</head>
</head>
<body style="background-color: #f7f7f7;">

<%@include file="all_components/navbar.jsp" %>


 <%
    Object userobjs = session.getAttribute("userobj");
    if (userobjs == null) {
        response.sendRedirect("login.jsp");
        return; 
    }
    User u = (User) userobjs;
%>






 <%
    String succMsg = (String) session.getAttribute("succMsg");
    String failedMsg = (String) session.getAttribute("failedMsg");
    if (succMsg != null) {
%>
    <div class="alert alert-success text-center"><%= succMsg %></div>
<%
        session.removeAttribute("succMsg");
    }
    if (failedMsg != null) {
%>
    <div class="alert alert-danger text-center"><%= failedMsg %></div>
<%
        session.removeAttribute("failedMsg");
    }
%>


<div class="container mt-3 mb-3">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">

 <h2 class="text-center">Contact Us</h2>

 
    <form action="contactserv" method="post">
        <div class="mb-3">
            <label for="name" class="form-label">Full Name</label>
            <input type="text" class="form-control" name="cname" required>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email address</label>
            <input type="email" class="form-control" name="cemail" required>
        </div>
        <div class="mb-3">
            <label for="subject" class="form-label">Subject</label>
            <input type="text" class="form-control" name="csubject" required>
        </div>
        <div class="mb-3">
            <label for="message" class="form-label">Your Message</label>
            <textarea class="form-control" name="cmessage" rows="4" required></textarea>
        </div>
        
       <button type="submit" class="btn btn-primary">Send Message</button>

    </form>

</div>
</div>
</div>
</div>
</div>


   

</body>
</html>
