<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
.container{
 margin-top:100px;
}
h1{
 text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
}
table, th, td {
  border: 1px solid;
  border-collapse: collapse;
   margin:40px;
   padding:10px;
}
a:hover{
color:black;}
</style>

<meta charset="UTF-8">
<title>All Products</title>
</head>
<body>
<jsp:include page="navbar2.jsp" />
<div class="container">
<h1 >List of products</h1>
<div style="display:flex; text-align:center">
<table>
<tr>
<th>Id</th>
<th>Category</th>
<th>Name</th>
<th>Description</th>
<th>Price</th>
<th>Stock</th>
<th>Image</th>
<th>Rating</th>
<th>Action</th>
</tr>
<c:forEach items="${products}" var="item">
<tr>
<td>${item.productId}</td>
<td>${item.category.name}</td>
<td>${item.name}</td>
<td>${item.description}</td>
<td>${item.price}</td>
<td>${item.stockQuantity}</td>
<td> <img src="${pageContext.request.contextPath}/image/showproductimage?id=${item.productId}"  alt="${product.name}" ></td>
<td>${item.ratingAverage}</td>
<td>
      <span><a href="${pageContext.request.contextPath}/product/updateproductpage?id=${item.productId}"><i class="fas fa-edit"></i></a></span>
      <span><a href="${pageContext.request.contextPath}/product/singleproduct?id=${item.productId}"><i class="fa-solid fa-info"></i></a></span>
      <span><a href="${pageContext.request.contextPath}/product/removeproduct?id=${item.productId}"><i class="fa fa-trash" aria-hidden="true"></i></a></span>
</td>
</tr>
</c:forEach>
</table>
</div>
</div>
<p style="color:red">${error}</p>

<jsp:include page="footer.jsp" />
</body>
</html>