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
  position:relative;
  display:inline-block;
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
.heart-btn {
  background: white;
  border: none;
  font-size: 24px;
  text-decoration: none;
  color: inherit; /* or set a specific color like black */
  cursor: pointer;
  padding: 4px;
  transition: transform 0.2s ease;
}

.heart-btn:hover {
  transform: scale(1.1);
  color: red; 
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
.profile-dropdown {
  position: relative;
  display: inline-block;
}

.profile-pic {
  height: 40px;
  width: 40px;
  border-radius: 50%;
  object-fit: cover;
  cursor: pointer;
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
 .badge {
  position: absolute;
  top: 8px;
  right: 90px;
  padding: 2px 5px;
  border-radius: 50%;
  background: red;
  color: white;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<nav class="navbar">
         <c:if test="${user.role == 'ADMIN'}">
           <jsp:include page="sidebar.jsp" />
        </c:if>
        <div class="logo">
           <c:choose>
              <c:when test="${user.role == 'ADMIN'}">
                  <a href="${pageContext.request.contextPath}/user/admindashboard">
                        <img src="${pageContext.request.contextPath}/image/showimage?name=logo" alt="logo"/>
                  </a>
              </c:when>

             <c:when test="${user.role == 'CUSTOMER'}">
                 <a href="${pageContext.request.contextPath}/user/userdashboard">
                        <img src="${pageContext.request.contextPath}/image/showimage?name=logo" alt="logo"/>
                 </a>
            </c:when>

           <c:otherwise>
              <a href="${pageContext.request.contextPath}/">
                   <img src="${pageContext.request.contextPath}/image/showimage?name=logo" alt="logo"/>
              </a>
          </c:otherwise>
       </c:choose> 
        </div>
        <input type="text" class="search-bar" placeholder="search for products">
        <div class="nav-buttons" >
         
                <button class="btn hellobtn">
                        <p>Hello ${user.name},</p>
                        <p>Logged in</p></button>
               <a href="#" class="heart-btn">
                      <i class="fas fa-heart" ></i>
                </a>
           <%--   <a href="${pageContext.request.contextPath}/cart/cartpage" class="btn cart-icon">
                   <span><i class="fa-solid fa-cart-shopping" style="font-size:24px;"></i></span> 
                   <c:if test="${sessionScope.count!=0}">
                       <span class="badge">${sessionScope.count}</span>
                    </c:if>
                </a>  --%>
                 <a href="${pageContext.request.contextPath}/cart/cartpage" class="btn cart-icon" id="cartIcon">
                         <span><i class="fa-solid fa-cart-shopping" style="font-size:24px;"></i></span> 
                         <span class="badge" id="cartCount" style="display: none;"></span>
                 </a> 
                
                <div class="profile-dropdown">  
                   <img src="${pageContext.request.contextPath}/image/showimage?name=profilepic" alt="personalprofile" class="profile-pic" />
               <div class="dropdown-menu">
                <a href="#" onclick="showUpdatePopup(); return false;">Edit Profile</a>
          
                 <p>-------------------------------</p>
                <a href="${pageContext.request.contextPath}/user/logout">Log Out</a>
              </div>
              </div>
     
        </div>
    </nav>
 <script>
    document.addEventListener("DOMContentLoaded", function() {
        var apiUrl = "${pageContext.request.contextPath}/cart/cartcount?id=${user.cart.cartId}";
        console.log("API URL:", apiUrl);
        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                var count = data.count;
                var cartCount = document.getElementById("cartCount");

                if(count > 0) {
                    cartCount.textContent = count;
                    cartCount.style.display = "inline-block";
                } else {
                    cartCount.style.display = "none";
                }
            })
            .catch(error => {
                console.error("Error fetching cart count:", error);
            });
    });
</script> 
</body>
</html>