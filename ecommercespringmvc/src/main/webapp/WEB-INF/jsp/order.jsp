 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
 border:1px solid grey;
}
.right{
 display:flex;
 flex-direction:column;
 width:30%;
 padding:10px;
 margin:5px;
 border:1px solid grey;
 border-radius:5px;
 height: fit-content;
}
.address{
  display:flex;
  margin:15px 0;
  padding:15px;
  justify-content:space-between;
  align-items:center;
  border:1px solid grey;
  border-radius:5px;
}

.address-row{
  margin:0;
 padding:2px 0;
}
.change-button{
 margin-top:20px;
  padding:12px;
  background-color:#5610ef;
  color:white;
  border:none;
  border-radius:5px;
  cursor:pointer;
  font-size:16px;
}
.change-button:hover {
  background-color: #0056b3;  
  transform: scale(1.05);      
}

.change-button:focus {
  outline: none;              
  box-shadow: 0 0 0 3px rgba(0,123,255,0.4); 
}

.product-card{
  display:flex;
  flex-direction: column;
  margin:10px;
}
.card-row{
  position:relative;
  display: flex;
  padding: 10px;
  align-items:center;
  border:1px solid #ddd;
  margin-bottom:5px;
}
.card-row_text{
  display:flex;
  flex-direction: column;
  margin-left:20px;
}
.wishlist{
 display:flex;
  margin:10px;
  border:1px solid black;
}
.total-amount{
  display:flex;
  font-size:18px;
  font-weight:bold;
   justify-content:flex-end;
}
.card-row img {
  width: 100px;
  height: 100px;
  object-fit: contain;
  border:1px solid black;
}
.payment-options{
  display:flex;
  flex-direction:column;
  margin:15px;
}
.payment-options h3{
  margin-bottom:10px;
}
.payment-options label{
  margin:5px 0;
}
.place-order{
  margin-top:20px;
  padding:12px;
  background-color:#5610ef;
  color:white;
  border:none;
  border-radius:5px;
  cursor:pointer;
  font-size:16px;
}
.del_card {
  position: absolute;
  top: 5px; 
  right: 5px; 
  font-size: 18px;
  color: black; 
  cursor: pointer; 
  transition: color 0.2s ease-in-out;
}
</style>
</head>
<body>
<jsp:include page="navbar2.jsp" /> 
<c:if test="${not empty reitem}">
  <div id="removeIcon" 
       style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);
              background: #fff; box-shadow: 0 4px 10px rgba(0,0,0,0.3);border:1px solid #5610ef;
              padding: 15px; z-index: 9999; width: 300px; text-align: center;">
      
     <div style="display:flex;gap:20px; ">
       <img src="${pageContext.request.contextPath}/image/showproductimage?id=${reitem.product.productId}" 
        alt="${reitem.product.name}" style="width: 100px;height: 100px;object-fit: contain;border:1px solid black;" >
       <div style="justify-content:flex-start;">
           <p>${reitem.product.name}</p>
           <p>Price: ₹${reitem.product.price}</p>
           <p>Quantity: ${reitem.quantity}</p>
       </div>
     </div>
       <div style="display:flex;justify-content:space-between;margin-top:10px;" >
        <button onclick="closeRemove()" 
              style="background: #5610ef; color: #fff; border: none; 
                     border-radius: 20px; padding: 8px 20px; cursor: pointer;">
         Cancel
      </button>
    <form action="<c:url value='/order/removeproduct'/>" method="post">
       <input type="hidden" name="id" value="${reitem.orderItemId}" />
       <button style="background: #5610ef; color: #fff; border: none; 
                     border-radius: 20px; padding: 8px 20px; cursor: pointer;">
                     Remove</button>
    </form>
       </div>
      
     
  </div>
</c:if>

<div class="container">
<div class="left">
   <div class="address">
      <div class="address-row">
         <p>Deliver To:  ${user.name},${address.pincode}</p>
         <p>${address.city},${address.state},${address.pincode}</p>
     </div>
         <button class="change-button">Change Address</button>
   </div>
   <div class="product-card">
    <c:forEach items="${orderItems}" var="item">
      <div class="card-row" >
         <img src="${pageContext.request.contextPath}/image/showproductimage?id=${item.product.productId}"  alt="${item.product.name}" >
         <div class="card-row_text">
           <p>${item.product.name}</p>
           <p>Price:  ₹${item.product.price}</p>
           <p>Quantity: ${item.quantity}</p>
           <p><i class="fa-solid fa-rotate-left"></i> 7 days return available</p>
           <p>Delivery between ${dates}</p>
         </div>
        <a href="${pageContext.request.contextPath}/order/removeicon?id=${item.orderItemId}" class="del_card" ><i class="fa fa-remove"></i></a>
      </div>  
    </c:forEach>
   </div>
   

   <div class="total-amount" id="totalPrice">
       
  </div> 

   <div class="wishlist">
     <p>Add more from wishlist</p>
   </div>
</div>
 
<div class="right">
   
   <h3>Payment Options</h3>
  <form action="<c:url value='/order/placingorder'/>" method="post">
  <div class="payment-options">
  <label><input type="radio" name="payment" value="EMI"> EMI</label>
  <label><input type="radio" name="payment" value="NetBanking"> Net Banking</label>
  <label><input type="radio" name="payment" value="COD"> Cash on Delivery</label>
  <label><input type="radio" name="payment" value="DebitCard"> Debit Card</label>
  <label><input type="radio" name="payment" value="UPI"> UPI</label>
  </div>
  <input type="hidden" value="${order.orderId}" name="id"> 
  <button class="place-order">Place Order</button> 
   </form>

       
</div>

</div>

<script>
function closeRemove() {
    document.getElementById('removeIcon').style.display = 'none';
}
document.addEventListener("DOMContentLoaded", function() {
	    var apiUrl = "${pageContext.request.contextPath}/order/totalPrice?id=${order.orderId}";
	    console.log("API URL:", apiUrl);
	    fetch(apiUrl)
	        .then(response => response.json())
	        .then(data => {
	            var sumTotal = data.total;
	            var totalPrice = document.getElementById("totalPrice");
	            var string="Total Amount: ₹ "
	            if(sumTotal  > 0) {
	            	totalPrice.textContent =string+sumTotal;
	            	totalPrice.style.display = "inline-block";
	            }else{
	            	totalPrice.style.display = none;
           }
	            
	        })
	        .catch(error => {
	            console.error("Error fetching cart count:", error);
	        }); 
});
</script>
</body>
</html> 

