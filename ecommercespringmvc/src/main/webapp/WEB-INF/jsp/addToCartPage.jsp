<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container{
margin-top:100px;
display:flex;
flex-direction:column;
align-items:center;
justify-content:center;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <jsp:include page="navbar2.jsp" />
 <div class="container">
<img src="${pageContext.request.contextPath}/image/showproductimage?id=${product.productId}"  alt="${product.name}" >
<h1>the item added to the cart</h1>
</div>

</body>
</html>