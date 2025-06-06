<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Success</title>
    <%@include file="all_components/allCSS.jsp" %>
    <style>
         .order-success-card {
            max-width: 600px;
            width: 100%;
            padding: 30px;
            border-radius: 8px;
        }

        @media (max-width: 576px) {
            .order-success-card h1 {
                font-size: 1.8rem;
            }

            .order-success-card p.lead {
                font-size: 1rem;
            }

            .order-success-card .btn {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>
<body style="background-color: #f0f1f2;">
    <%@include file="all_components/navbar.jsp" %>
    
    <%
    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd MMM yyyy");
    java.util.Calendar calendar = java.util.Calendar.getInstance();
    calendar.add(java.util.Calendar.DAY_OF_YEAR, 5); // 7 days from now
    String estimatedDeliveryDate = sdf.format(calendar.getTime());
    %>

    <div class="container d-flex justify-content-center align-items-center" style="min-height: 80vh;">
        <div class="card shadow-sm text-center order-success-card bg-white">
           <h1 class="text-success mb-3">🎉 Thank You for Your Order!</h1>
<p class="lead">Your order has been successfully placed and will be delivered by <strong><%=estimatedDeliveryDate %></strong>.</p>
<hr>
<p class="text-muted">We’ll send you an email confirmation shortly.</p>

            <div class="mt-4 d-flex flex-column flex-sm-row justify-content-center gap-2">
                <a href="index.jsp" class="btn btn-success px-4">Continue Shopping</a>
                <a href="orders.jsp" class="btn btn-primary px-4">View My Orders</a>
            </div>
        </div>
    </div>

</body>
</html>
