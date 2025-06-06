<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Address</title>
<%@include file="all_components/allCSS.jsp" %>

</head>
<body style="background-color: #f7f7f7;">
<%@include file="all_components/navbar.jsp" %>

<div class="container mt-3">
<div class="row p-3">

<div class="col-md-6 offset-md-3">
<div class="card">
<div class="card-body">

<h3 class="text-center text-primary">Add Address</h3>

<form action="">

<div class="row ">
 <div class="form-group col-md-6">
            <label for="inputPassword4" class="form-label">Address</label>
            <input type="text" class="form-control" id="inputPassword4">
    </div>
    
    <div class="form-group col-md-6">
            <label for="inputPassword4" class="form-label">Landmark</label>
            <input type="text" class="form-control" id="inputPassword4">
    </div>
    
    
    </div>
    
    
    
     <div class="row mt-2">
     <div class="col-md-4">
          <label for="inputEmail4" class="form-label">City</label>
            <input type="text" class="form-control" id="inputEmail4">
     </div>
                    
     <div class="col-md-4">
            <label for="inputPassword4" class="form-label">State</label>
            <input type="text" class="form-control" id="inputPassword4">
    </div>
    
   <div class="col-md-4">
            <label for="inputPassword4" class="form-label">Pin code</label>
            <input type="text" class="form-control"
             id="inputPassword4" value="">
    </div>  
    
      </div>
      
     <div class="text-center mt-3">
         <button class="btn btn-warning text-white">
         Add Address
         </button>
     
     </div>
</form>
</div>

</div>
</div>

</div>
</div>


</body>
</html>