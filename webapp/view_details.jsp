<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Details Book</title>
<%@include file="all_components/allCSS.jsp" %>

</head>
<body style="background-color: #f0f1f2;">
<%@include file="all_components/navbar.jsp" %>

   <%
     User u=(User)  session.getAttribute("userobj");
     %>
 
<%
    String addcartMsg = (String) session.getAttribute("addcart");
    String failMsg = (String) session.getAttribute("failed");

    if (addcartMsg != null) {
%>
        <div class="text-center text-success h3"  ><%=addcartMsg %></div>
       
<%
        session.removeAttribute("addcart"); // Remove after displaying
    }

    if (failMsg != null) {
%>
        <div class="text-center text-danger h3"><%= failMsg %></div>
<%
        session.removeAttribute("failed"); // Remove after displaying
    }
%> 
 
 
       <%
     int bid = Integer.parseInt(request.getParameter("id"));
       BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
      BookDetails b = dao.getBookById(bid);
       
       %>
       


<div class="container p-3 ">
    <div class="row">
        <div class="col-md-6 text-center p-5 border bg-white">
        <img  src="img/<%=b.getPhoto() %>" style="height: 150px; width: 100px;"><br>
        
        <h4 class="mt-3">
        Book Name: <span class="text-success"><%=b.getBookname() %></span> 
        </h4>
        
        <h4>Author name: <span class="text-success"><%=b.getAuthor() %></span>
         </h4>
         
        <h4>category: <span class="text-success"><%=b.getBookCategory() %></span> 
        </h4>
        </div>
        
        
        <div class="col-md-6 text-center p-5 border bg-white">
        <h2><%=b.getBookname() %></h2>
        
        <%
        if ("Old".equals(b.getBookCategory()))
        { %>
        
        <h5 class="text-primary">Contact to seller</h5>
        <h5 class="text-primary"><i class="fa-regular fa-envelope"></i> Email: <%=b.getUser_email() %></h5>
        	
       <% }
        %>
        
        
        <div class="row">
              <div class="col-md-4 text-danger text-center p-2">
                 <i class="fa-solid fa-sack-dollar fa-2x"></i>
                 <p>Cash On Delivery</p>
             </div>
        
              <div class="col-md-4 text-danger text-center p-2">
                 <i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
                   <p>Return Available</p> 
             </div>
        
              <div class="col-md-4 text-danger text-center p-2">
                 <i class="fa-solid fa-truck-fast fa-2x"></i>
                   <p>Free Delivery</p>
              </div>
              
              <%
              if("Old".equals(b.getBookCategory())){
              %> 
              <div class="text-center p-3" >
              <a href="index.jsp" style="text-decoration: none;"> 
              <button  type="button" class="btn btn-success">Continue shopping </button>
              </a>
              
            <a href="" style="text-decoration: none;">
               <button  type="button" class="btn btn-danger "><%=b.getPrice() %></button>
              </a> 
              
              
              
              </div>
              
            <%
              }else{
            %>	
               <div class="text-center p-3" >
              <!-- <a href="" style="text-decoration: none;"> 
              <button  type="button" class="btn btn-primary">Add cart</button>
              </a>
               -->
               
         <a href="cart?bid=<%=b.getBookID() %>&&uid=<%=u.getId()%>" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i>Add cart</a>
                
        <a href="" class="btn btn-danger btn-sm ml-1"><%=b.getPrice() %> <i class="fa-solid fa-rupee-sign"></i></a>
              
              
              
              </div>
            	
           <% }
            %>
              
              
              
             
              
              
           
       
        </div>
        
        
        </div>
    
    </div>

</div>

</body>
</html>