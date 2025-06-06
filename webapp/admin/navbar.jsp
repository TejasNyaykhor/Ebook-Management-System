

<%@page import="com.entity.User"%>
<div class="container-fluid" 
style="height: 6px; background-color:#303f9f "></div>



<div class="container-fluid p-3 bg-light" >

<div class="row">

<div class="col-md-3 text-success">
<h3><i class="fa-solid fa-book"></i> Ebooks</h3>
</div>



<div class="col-md-3 " >

   
   <%
    Object userobj = session.getAttribute("userobj"); // or request.getAttribute() depending on scope
    if (userobj != null) {
%>
    <a  style="text-decoration: none;">
        <button type="button" class="btn btn-success ">
            <i class="fa-solid fa-user"></i> 
            <%=((User)userobj).getName()%>
        </button>
    </a>
    
     <a data-bs-toggle="modal" data-bs-target="#exampleModal" style="text-decoration: none;">
        <button type="button" class="btn btn-primary">
            <i class="fa-solid fa-right-to-bracket"></i> Logout
        </button>
    </a>
<%
    } else {
%>
    <a href="../login.jsp" style="text-decoration: none;">
        <button type="button" class="btn btn-success">
            <i class="fa-solid fa-right-to-bracket"></i>Login
        </button>
    </a>

    <a href="../register.jsp" style="text-decoration: none;">
        <button type="button" class="btn btn-primary">
            <i class="fa-solid fa-user"></i> Register
        </button>
    </a>
<%
    }
%>
   
 
  
</div>


</div>
 </div>

                <!-- Logout model Popup using bootstrap -->

   

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
       <div class="text-center">
        <h4>Do you want Logout</h4>
         <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <a href="../logout"><button type="button" class="btn btn-primary">Logout</button></a>
       </div>
        
      </div>
      <div class="modal-footer">
       
      </div>
    </div>
  </div>
</div>
                  

                <!-- End Logout -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom ">
  <div class="container-fluid">

            <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
        
          <a class="nav-link active" aria-current="page" href="homeAdmin.jsp">Home</a>
        </li>
         
      </ul>
     
        
     
    </div>
  </div>
</nav>