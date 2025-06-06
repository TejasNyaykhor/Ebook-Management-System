<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: Edit Books</title>
<%@include file="StyleAdmin.jsp"%>
</head>
<body style="background-color: #f0f2f2">
<%@include file="navbar.jsp" %>
    
    <div class="container">
    <div class="row">
    <div class="col-md-4 offset-md-4">
    <div class="card">
    <div class="card-body">
    
    <h4 class="text-center">Edit Books</h4>
    
   


         <%
             //by default string hoti hai id use Integer me convert karna padega
             int id = Integer.parseInt(request.getParameter("id"));
         BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
         BookDetails b = dao.getBookById(id);
         %>
    
    
      <form action="../editbooks" method="post">
      
      <input type="hidden" name="id" value="<%=b.getBookID()%>">
      
   <div class="mb-3 ">
    <label for="exampleInputName" class="form-label">Book Name*</label>
    <input type="text" class="form-control" id="exampleInputName"
     aria-describedby="emailHelp"  name="bname" 
       value="<%=b.getBookname()%>"   >
  </div>
  
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Auther Name*</label>
    <input type="text" class="form-control" id="exampleInputEmail1" 
    aria-describedby="emailHelp"  name="author" 
       value="<%=b.getAuthor()%>" >
  </div>
  
  <div class="mb-3">
    <label for="exampleInputNumber" class="form-label">Price*</label>
    <input type="number" class="form-control" id="exampleInputNumber"
     aria-describedby="emailHelp"  name="price"
          value="<%=b.getPrice()%>">
  </div>
  

  
   <div class="mb-3">
    <label for="inputState">Book Status</label>
   <select  class="form-control" name="bstatus" id="inputState" >
       
        <% if ("Active".equals(b.getStatus()))  { %>
        	
           <option value="Active">Active</option>
           <option value="Inactive">Inactive</option>
        <%}
           else{
           %>
               <option value="Inactive">Inactive</option>
        	   <option value="Active">Active</option>
           
            
          <% }
        %> 
</select>
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