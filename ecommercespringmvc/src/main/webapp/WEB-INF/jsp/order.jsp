<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Place Order</title>
<style>
.container{
display:flex;
margin:100px 200px;
}
.left{
 display:flex;
 flex-direction:column;
 width:70%;
 padding:10px;
 margin:5px;
}
.right{
 display:flex;
 flex-direction:column;
 width:30%;
 padding:10px;
 margin:5px;
}
.address{
  display:flex;
  margin:15px;
  padding:15px;
  border:1px solid grey;
  flex-direction:column;
}

.address p{
 padding:5px;
}
.address div{
  display:flex;
  
}

.product-card{
  display:flex;
  flex-direction: column;
   justify-content:center;
  align-items: center;
  margin:15px;

}
.card-row{
  display: flex;
  
  
  padding: 16px;
  text-align: center;
}
.card-row_text{
  display:flex;
   flex-direction: column;
}
.wishlist{
 display:flex;
  margin:15px;
  border:1px solid black;
}
.card-row img {
  width: 100px;
  height: 100px;
  object-fit: contain;
  padding: 4px;           /* optional padding */
  border:1px solid black;
}
</style>
</head>
<body>
<jsp:include page="navbar2.jsp" /> 
<div class="container">
<div class="left">
   <div class="address">
      <p>Deliver To:  ${user.name},${address.pincode}</p>
      <p>${address.city},${address.state},${address.pincode}</p>
      <div>  
         <button>Change Address</button>
      </div>
   </div>
   <div class="product-card">
    <c:forEach items="${cartItem}" var="item">
      <div class="card-row" >
         <img src="${pageContext.request.contextPath}/image/showproductimage?id=${item.product.productId}"  alt="${item.product.name}" >
         <div class="card-row_text">
           <p>${item.product.name}</p>
           <p>${item.product.price}</p>
           <p>7 days return available</p>
           <p>Delivery between </p>
         </div>
      </div>  
    </c:forEach>
   </div>
   <div class="wishlist">
     <p>Add more from wishlist</p>
   </div>
</div>
<div class="right">
   
</div>
</div>

</body>
</html>