<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<title>Shopping cart</title>
<style>
body {
 
}
.container{
  display: flex;
  justify-content:center;
  flex-direction:column;
  margin-top:100px;
  margin-left: 100px; 
}
.vary{
  display:flex;
  align-items:center;
  justify-content:center;
  gap:5px;
  height:40px;
  width:100px;
  border-radius:20px;
  border:2px solid #5610ef;
}
.vary a{
 color:black;
}
.buy{
 margin-top:20px;
 width:200px;
 height:50px;
 padding:5px 2px;
 border-radius:30px;
 background-color:#5610ef;
 margin-left: 500px;
 color:white;
 
}
.hline { 
  width:100%; 
  height:10px; 
  background: #fff 
  }
hr {
  border: none; 
  border-top: 2px solid #ccc; 
  width:90%;
  margin: 20px 0; 
}
.price{
  margin-left: 1100px;
}
.pricehead{
 margin-left: 1200px;
}
.stock{
margin:2px;
color:green;
}
.outOf{
 display:flex;
  align-items:center;
  justify-content:center;
  height:40px;
  width:100px;
  border:none;
}
.outOf a{
 color:black;
}
#cartTable img {
  width: 100px;
  height: 100px;
  object-fit: contain;
  padding: 4px;           /* optional padding */
  border-radius: 8px;
}

</style>
</head>
<body>
<c:if test="${not empty outOfStockMessage}">
  <div id="outOfStockPopup" 
       style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);
              background: #fff; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.3);
              padding: 20px; z-index: 9999; width: 300px; text-align: center;">
      
      <h3 style="margin-bottom: 15px; color: #5610ef;">Stock Alert</h3>
      <p style="margin-bottom: 20px;">${outOfStockMessage}</p>
      
      <button onclick="closePopup()" 
              style="background: #5610ef; color: #fff; border: none; 
                     border-radius: 20px; padding: 8px 20px; cursor: pointer;">
          OK
      </button>
  </div>
  
  <!-- Overlay background -->
  <div id="overlay" 
       style="position: fixed; top:0; left:0; width:100%; height:100%; 
              background: rgba(0,0,0,0.5); z-index: 9998;"></div>
</c:if>

<jsp:include page="navbar2.jsp" /> 
 <c:set var="noOfItems" value="${fn:length(cartItem)}"></c:set>
<div class="container">
    <h1>Shopping Cart</h1>
    <p class="pricehead">price</p>
    <hr>
       <table id="cartTable">
         <c:forEach items="${cartItem}" var="cartItem">
          <c:set var="quantity" value="${cartItem.quantity}"></c:set>
          <c:set var="stock" value="${cartItem.product.stockQuantity}"></c:set>
             <tr>
            <td> <img src="${pageContext.request.contextPath}/image/showproductimage?id=${cartItem.product.productId}"  alt="${cartItem.product.name}" ></td>
         
            <td> <h3>${cartItem.product.name}</h3>
            <div class="stock">
               <c:choose>
                  <c:when test="${stock<1}">
                     <p>Out Of stock</p>
                  </c:when>
                  <c:otherwise>
                    <p>In Stock</p>
                  </c:otherwise>
               </c:choose>
            </div>
            <c:choose>
            <c:when test="${stock!=0}">
             <div class="vary">
               <c:choose>
                 <c:when test="${quantity<2}">
                  <span><a href="${pageContext.request.contextPath}/cart/deletecartitem?id=${cartItem.cartItemId}"><i class="fa fa-trash" aria-hidden="true"></i></a></span>
                 </c:when>
                 <c:otherwise>
                   <span><a href="${pageContext.request.contextPath}/cart/decreasequantity?id=${cartItem.cartItemId}"><i class="fa-solid fa-minus"></i></a></span>
                 </c:otherwise>
               </c:choose>
                <span>${cartItem.quantity}</span>
                <span><a href="${pageContext.request.contextPath}/cart/increasequantity?id=${cartItem.cartItemId}"><i class="fa-solid fa-plus"></i></a></span>
             </div>
             </c:when>
             <c:otherwise>
                <div class="outOf">
                    <span><a href="${pageContext.request.contextPath}/cart/deletecartitem?id=${cartItem.cartItemId}"><i class="fa fa-trash" aria-hidden="true"></i></a></span>
                </div>
             </c:otherwise>
             </c:choose>
           <td>
              <div>
                 <h3>${cartItem.product.price}</h3>
              </div>
           </td>
           </tr> 
            <tr>
               <td colspan="3"><hr></td>
            </tr>
        </c:forEach>  
                    
      </table> 
      <div class="price">
         <h3 id="totalPrice" style="margin: auto;"></h3>
     </div>
 <c:if test="${noOfItems!=0}">  
       <form action="<c:url value='/order/proceedbuy'/>" >
           <button class="buy">Proceed To Buy</button>
       </form>
 </c:if>  


</div>


<script>

document.addEventListener("DOMContentLoaded", function() {
    var apiUrl = "${pageContext.request.contextPath}/cart/cartcount?id=${user.cart.cartId}";
    console.log("API URL:", apiUrl);
    fetch(apiUrl)
        .then(response => response.json())
        .then(data => {
             var count = data.count;
             var totalPrice = document.getElementById("totalPrice");
             totalPrice.textContent='SubTotal ('+count+' items): '
        })
        .catch(error => {
            console.error("Error fetching cart count:", error);
        });
});

    document.addEventListener("DOMContentLoaded", function() {
        var apiUrl = "${pageContext.request.contextPath}/cart/totalPrice?id=${user.cart.cartId}";
        console.log("API URL:", apiUrl);
        fetch(apiUrl)
            .then(response => response.json())
            .then(data => {
                var sumTotal = data.total;
                var totalPrice = document.getElementById("totalPrice");
               /*  var str='SubTotal ('+count+' items): ' */
                	totalPrice.textContent +=sumTotal;
                	totalPrice.style.display = "inline-block";
                
                
            })
            .catch(error => {
                console.error("Error fetching cart count:", error);
            });
    });
    
    function closePopup() {
        document.getElementById('outOfStockPopup').style.display = 'none';
        document.getElementById('overlay').style.display = 'none';
    }
</script> 

</body>
</html>