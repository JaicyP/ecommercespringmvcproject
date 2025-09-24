<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
body {
 
}
.container{
  display: flex;
  justify-content: center; /* centers horizontally */
  margin:150px 150px;
  box-sizing: border-box;
}
.left{
 display:flex;
 flex-direction:column;
 width:50%;
 align-items:center;
}

.right{
display: flex;
align-items:flex-start;
width:50%;
flex-direction:column;
}
.left img{
margin-top:50px;
  height:200px;
  width:200px;
  margin-bottom:50px;
    
}
.left p{
margin-bottom:2px;
}
.left button{
  margin-top:20px;
  padding:12px;
  background-color:#5610ef;
  color:white;
  border:none;
  border-radius:5px;
  cursor:pointer;
  font-size:16px;
   width: 150px; 
   margin-right:20px;
}
.product-card{
  display:flex;
  flex-direction: column;
  margin:10px;
  margin-bottom:0px;
}
.card-row_text{
  display:flex;
  flex-direction: column;
  margin-left:20px;
  color:black;
   font-size: 15px;
}
.card-row{
  display: flex;
  padding: 10px;
  align-items:center;
  border:1px solid #ddd;
  margin-bottom:5px;
   width:500px;
}
.card-row img {
  width: 80px;
  height: 80px;
  object-fit: contain;
  border:1px solid black;
}
.total{
margin-top:0px;
margin-left:320px;
color:black;
  margin-bottom:2px;
 font-size: 15px; 
 padding:10px;
}
.right button{
    margin-top:2px;
  padding:12px;
  background-color:#5610ef;
  color:white;
  border:none;
  border-radius:5px;
  cursor:pointer;
  font-size:16px;
   width: 200px; 
     margin-bottom:10px;
}
.download{
display: flex;
justify-content:center;
width:100%;
}

</style>
<meta charset="UTF-8">
<title>Check out page</title>
</head>
<body>
<c:if test="${not empty mailsent}">
  <div id="mailSent" 
       style="position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);
              background: #fff; border-radius: 10px; box-shadow: 0 4px 10px rgba(0,0,0,0.3);
              padding: 20px; z-index: 9999; width: 300px; text-align: center;">
      
      <h3 style="margin-bottom: 15px; color: #5610ef;">Mail Alert</h3>
      <p style="margin-bottom: 20px;">${mailsent}</p>
      
      <button onclick="closePopup()" 
              style="background: #5610ef; color: #fff; border: none; 
                     border-radius: 20px; padding: 8px 20px; cursor: pointer;">
          OK
      </button>
  </div>
 </c:if> 
<jsp:include page="navbar2.jsp" /> 
<div class="container">
  <div class="left">
      <h1>Payment Sucessful</h1>
       <img src="${pageContext.request.contextPath}/image/showimage?name=payment"  alt="payment sucess" >
       <p>Your order has been placed sucessfully.</p>
       <p>you can track the order through link sent to your email</p>
    <div style="display:flex;">
     <form  action="<c:url value='/mail/sendmail'/>" method="post">
        <input type="hidden" name="useremail" value="${user.email}" />
        <input type="hidden" name="id" value="${order.orderId}" />
       <button class="track-btn">
             Track Order
       </button>
     </form>
     <form  action="<c:url value='/mail/gotohome'/>" method="post">
        <input type="hidden" name="useremail" value="${user.email}" />
       <button>
            Go To Home
       </button>
     </form>
    </div>
   </div>
   <div class="right">
      <h2>Your Orders</h2>
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
      </div>  
    </c:forEach>
   </div> 
   <div class="total">
     <p>Amount Paid: ${order.totalAmount}</p>
     <p>Payment Type: ${order.paymentMode}</p>
   </div>
   <div class="download">
     <button>Download Invoice</button>
   </div>
</div>
</div>
<script> 
function closePopup() {
    document.getElementById('mailSent').style.display = 'none';
}
</script>
</body>
</html>