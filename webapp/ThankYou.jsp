<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Thank You</title>
     <%@include file="all_components/allCSS.jsp" %>
</head>
<body style="background-color: #f7f7f7;">

<%@include file="all_components/navbar.jsp" %>
<div class="container mt-5">
    <div class="card">
        <div class="card-body text-center">
            <h2 class="text-success">Thank You!</h2>
            <p>Your message has been submitted successfully.</p>
            <a href="index.jsp" class="btn btn-primary mt-3">Back to Home</a>
        </div>
    </div>
</div>
</body>
</html>
