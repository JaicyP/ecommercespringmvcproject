<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Processing Payment</title>
<style>
.body {
 
}
.container{
  display: flex;
  justify-content:center;
  flex-direction:column;
  margin-top:100px;
  margin-left: 100px; 
}
.loader {
  border: 8px solid #e0e0e0;       
  border-top: 8px solid #007bff;   
  border-radius: 50%;
  width: 100px;
  height: 100px;
  animation: spin 1s linear infinite;
  margin: 200px auto;
  box-shadow: 0 0 10px rgba(0,0,0,0.1);
}

@keyframes spin {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

.message {
  font-size: 20px;
  font-weight: bold;
  color: #333;
  margin-top: 15px;
}

.note {
  font-size: 14px;
  color: #777;
  margin-top: 8px;
}
</style>
</head>
<body>
<jsp:include page="navbar2.jsp" /> 

<div class="container">
  <div class="message">Redirecting to the payment Gateway...</div>
  <div class="note">Please wait, do not close this window.</div>
  <div class="loader"></div>
</div>
<c:set var="orderId" value="${id}"></c:set>

<!-- Auto-redirect after 5 seconds -->
<script>
   setTimeout(function(){
      window.location.href = "${pageContext.request.contextPath}/order/paymentsucess?id=${id}"; 
   }, 5000); // redirect after 5 seconds
</script>

</body>
</html>

