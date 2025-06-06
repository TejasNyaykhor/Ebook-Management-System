<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
<%@include file="all_components/allCSS.jsp" %>

</head>
<body style="background-color: #f7f7f7;">
<%@include file="all_components/navbar.jsp" %>

         <!-- Security code  -->
        <%
    Object userobjs = session.getAttribute("userobj");
    if (userobjs == null) {
        response.sendRedirect("login.jsp");
        return; 
    }
    User u = (User) userobjs;
%>



           <%
    String succcartMsg = (String) session.getAttribute("succMsg");
    String failMsg = (String) session.getAttribute("faildMsg");
%>

<% if (succcartMsg != null) { %>
    <div class="alert alert-success text-center" role="alert">
        <%=succcartMsg %>
    </div>
    <% session.removeAttribute("succMsg"); %>
<% } %>

<% if (failMsg != null) { %>
    <div class="alert alert-danger text-center" role="alert">
        <%=failMsg %>
    </div>
    <% session.removeAttribute("faildMsg"); %>
<% } %>

           

<div class="container">
<div class="row p-3">
<div class="col-md-6">
<div class="card">
<div class="card-body">

<h3 class="text-center text-success">Your Selected Item</h3>

<table class="table table-striped">
  <thead>
    <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Author</th>
      <th scope="col">Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  
            
        <%
        
        
         CartDAOImpl dao= new CartDAOImpl(DBConnect.getConn());
        List<Cart> cart= dao.getBookByUser(u.getId());
       
        double totalprice = 0;

        for (Cart c : cart) {
            totalprice += c.getTotalPrice(); // ✅ accumulates total price

       %>
       
       
        <tr>
      <th scope="row"><%=c.getBookName() %></th>
      <td><%=c.getAuthor() %></td>
      <td><%=c.getPrice() %></td>
      <td>
      <a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger">Remove</a>
      </td>
    </tr>
    
    
    	   
      <% }
         %> 
    <tr>
   <td>Total Price</td>
   <td></td>
   <td></td>
   <td><%=totalprice%></td>
   
   </tr>
 
    
  </tbody>
</table>
</div>

</div>
</div>



      <div class="col-md-6">
      <div class="card">
      <div class="card-body">
      <h3 class="text-center text-success">Your Order details..!</h3>
           <form action="order" method="post">
           
           <input type="hidden" value="<%=u.getId() %>" name="id">
           
           <div class="row">
      <div class="col-md-6">
          <label for="inputEmail4" class="form-label">Name</label>
            <input type="text" class="form-control"
             id="inputEmail4" value="<%=u.getName()%>" name="username" required >
     </div>
                    
     <div class="col-md-6">
            <label for="inputPassword4" class="form-label">Email</label>
            <input type="email" class="form-control" 
            id="inputPassword4" value="<%=u.getEmail()%>" name="email" required > 
            
     </div>
    </div><br>
    
    
    
     <div class="row">
     <div class="col-md-6">
          <label for="inputEmail4" class="form-label">Phone No</label>
            <input type="number" class="form-control" 
            id="inputEmail4" value="<%=u.getPhno()%>" name="phone" required >
     </div>
                    
     <div class="col-md-6">
            <label for="inputPassword4" class="form-label">Address</label>
            <input type="text" class="form-control" id="inputPassword4" name="address" required >
    </div>
    </div><br>
    
    
    
     <div class="row">
     <div class="col-md-6">
          <label for="inputEmail4" class="form-label">Landmark</label>
            <input type="text" class="form-control" id="inputEmail4" name="landmark" required >
     </div>
                    
     <div class="col-md-6">
            <label for="inputPassword4" class="form-label">City</label>
            <input type="text" class="form-control" id="inputPassword4" name="city" required >
    </div>
      </div><br>
      
      
      
     <div class="row">
     <div class="col-md-6">
          <label for="inputEmail4" class="form-label">State</label>
            <input type="text" class="form-control"
             id="inputEmail4"  name="state" required >
     </div>
                    
     <div class="col-md-6">
            <label for="inputPassword4" class="form-label">Pin code</label>
            <input type="text" class="form-control"
             id="inputPassword4"  name="pincode" required >
    </div>
     </div><br>
     
     
     <div class="form-group mt-3">
     <label>Payment Gateway</label>
     <select class="form-control" name="payment">
     <option value="noselect">---Select---</option>
     <option value="cod">Cash On Delivery</option>
     </select>
     </div>
     
     
     
     <div class="text-center">
     <button class="btn btn-warning mt-3">Order Now</button>
    <a href="index.jsp" class="btn btn-success mt-3">Continue Shopping
    </a>     
     </div>
                      
           
           </form>
      </div>
      </div>
      </div>
</div>
</div>


</body>
</html>