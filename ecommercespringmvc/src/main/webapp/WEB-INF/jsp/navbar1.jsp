<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<style>
*{
   margin:0;
   padding:0;
   box-sizing: border-box;
 }
 body{
    font-family:'Segoe UI', sans-serif;
    background-color:white;
}
.navbar{
     height: 70px; /* Fixed navbar height */
      display: flex;
      align-items: center;
      padding: 0 20px;
      justify-content: space-between;
      background-color: white;
      box-shadow: 0 2px 8px rgba(0,0,0,0.1);
      position: fixed;
      width: 100%;
      top: 0;
     z-index: 999;
  }
      
 .logo img {
     height: 100%;    
     max-height: 100px;
     object-fit: contain;
  } 
 .search-bar {
      flex:1;
      margin: 0 30px;
      padding: 10px 15px;
      border: 1px solid #ccc;
      border-radius: 20px;
      max-width: 800px;
 }

 .nav-links {
     list-style: none;
      display: flex;
      align-items: center;
     gap: 20px;
   }
.nav-buttons {
  display: flex;
  align-items: center;
  gap: 15px;
  font-size: small;
}
.nav-buttons.active {
  background-color: #ffcc00;
  color: #000;
}

.btn cart-icon {
  font-size: 40px;
  color: #333;
}


.btn {
  padding: 8px 16px;
  border: none;
  border-radius: 20px;
  font-weight: 600;
  cursor: pointer;
}

.loginbtn {
  background-color: #e0e0e0;
  color: #333;
}
.hellobtn {
  background-color: white;
  color: #333;
}

.loginbtn:hover {
  background-color: #ccc;
}

.signupbtn {
  background-color: #5610ef;
  color: white;
}

.signupbtn:hover {
  background-color: #2369dc;
}
.dropdown-menu {
  display: none;
  position: absolute;
  right: 0;
  background-color: white;
  border: 1px solid #ccc;
  border-radius: 8px;
  min-width: 150px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  z-index: 1000;
  text-align:center;
}

.dropdown-menu a {
  color: black;
  padding: 10px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-menu a:hover {
  background-color: #f0f0f0;
}


/* Show dropdown on hover */
.profile-dropdown:hover .dropdown-menu {
  display: block;
}
.dropdown-menu .action-button {
   width: auto; 
  background-color: #ffb703;
  color: white;
  border: none;
  border-radius: 6px;
  font-size: 14px;
  cursor: pointer;
  transition: background-color 0.3s;
  display: inline-block;
  margin: 10px auto;
}

.dropdown-menu .action-button:hover {
  background-color: #fb8500;
}
</style>
<meta charset="UTF-8">
<title>Navbar</title>
</head>
<body>
<nav class="navbar">
        <div class="logo">
           <a href="${pageContext.request.contextPath}/">
               <img src="${pageContext.request.contextPath}/image/showimage?name=logo" alt="logo"/>
            </a>
        </div>
        <input type="text" class="search-bar" placeholder="search for products">
        <div class="nav-buttons" >
         
            <button class="btn hellobtn">
                        <p>Hello user,</p>
                        <p>sign in</p></button>
               <a href="#" class="btn cart-icon">
                    <i class="fa-solid fa-cart-shopping" style="font-size:24px;"></i>
                </a>
     
            <form action="<c:url value='/user/loginpage'/>">
            <button class="btn loginbtn">Login</button>
            </form>
            <form action="${pageContext.request.contextPath}/user/registerpage">
              <button class="btn signupbtn">Signup</button>
            </form>
        </div>
    </nav>
    
   <%--  ${pageContext.request.contextPath}/image?name=logo.png --%>

</body>
</html>