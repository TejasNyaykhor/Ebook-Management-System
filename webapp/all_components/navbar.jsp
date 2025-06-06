
<%@page import="com.entity.User"%>

<%-- <%
    User user = (User) session.getAttribute("userobj");
    int cartCount = 0;
    if (user != null) {
        CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
        cartCount = dao.getCartCount(user.getId());
    }
%> --%>

<div class="container-fluid" 
style="height: 6px; background-color:#A8D5E3 "></div>
<!-- #303f9f -->


<div class="container-fluid p-3 bg-light" >

<div class="row">

<div class="col-md-3 text-success">
<h3><i class="fa-solid fa-book"></i> Ebooks</h3>
</div>

<div class="col-md-6">
 <form class="d-flex" role="search" action="search.jsp" method="post">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" 
             name="ch"> <!-- Character ke helps se book search karunga  -->
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
</div>

        <!-- User Module ke liye loging and register code 
        Agar user Login hai toh user ka NAME And Logout Option show karenge 
         -->
       <%
    User us = (User) session.getAttribute("userobj"); // Get user from session
    if (us != null) {
%>
<div class="col-md-3">

<span class="me-3"> 
  <a href="cart.jsp"><i class="fa-solid fa-cart-plus fa-2x"></i></a>
</span>


     
    <a href="" style="text-decoration: none;">
        <button type="button" class="btn btn-success">
                        <i class="fa-solid fa-user"></i> <%= us.getName() %>
        </button>
    </a>
    <a href="logout" style="text-decoration: none;">
        <button type="button" class="btn btn-primary">
        <i class="fa-solid fa-right-to-bracket"></i> Logout
        </button>
    </a>
</div>
<%
    } else {
%>
<div class="col-md-3">
    <a href="login.jsp" style="text-decoration: none;">
        <button type="button" class="btn btn-success">
            <i class="fa-solid fa-right-to-bracket"></i> Login
        </button>
    </a>
    <a href="register.jsp" style="text-decoration: none;">
        <button type="button" class="btn btn-primary">
            <i class="fa-solid fa-user"></i> Register
        </button>
    </a>
</div>
<%
    }
%>


</div>
 </div>



<nav class="navbar navbar-expand-lg navbar-dark bg-custom ">
  <div class="container-fluid">

            <a class="navbar-brand" href="#"><i class="fa-solid fa-house"></i></a>

    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
        
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
        
        <li class="nav-item  ">
          <a class="nav-link active" href="all_recent_book.jsp"><i class="fa-solid fa-book-open"></i>Recent Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="all_new_book.jsp"><i class="fa-solid fa-book-open"></i>New Book</a>
        </li>
       
        <li class="nav-item">
          <a class="nav-link active"  href="all_old_book.jsp"><i class="fa-solid fa-book-open"></i>Old Book</a>
        </li>
        
        
      </ul>
      <form class="d-flex " role="search">
      <a href="setting.jsp" class="btn btn-light mx-2"><i class="fa-solid fa-sliders"></i> Setting </a>
<!--       <button class="btn btn-light " type="submit"><i class="fa-solid fa-headset"></i> Contact Us</button>
 -->      
   <a href="contact.jsp" class="btn btn-light mx-2"><i class="fa-solid fa-headset"></i>Contact Us </a>
       
      </form>
    </div>
  </div>
</nav>