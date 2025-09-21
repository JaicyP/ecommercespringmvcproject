<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.container{
 margin-top:100px;
 margin-left:50px;
 margin-right:50px;
 margin-bottom:40px;
}
h1{
 text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
}
table, th, td {
  margin-top:10px;
  border: 1px solid;
  border-collapse: collapse;
}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
<meta charset="UTF-8">
<title>show all categories</title>
</head>
<body>
<jsp:include page="navbar2.jsp" />
<div class="container">
<table>
<tr>
<th>Id</th>
<th>Name</th>
<th>Description</th>
<th>Action</th>
</tr>
<c:forEach items="${list}" var="item">
<tr>
<td>${item.categoryId}</td>
<td>${item.name}</td>
<td>${item.description}</td>
<td>
   <a href="${pageContext.request.contextPath}/category/updatepage?id=${item.categoryId}"><i class="fas fa-edit"></i></a>
   <a href="${pageContext.request.contextPath}/category/single?id=${item.categoryId}"><i class="fa-solid fa-info"></i></a>
   <a href="${pageContext.request.contextPath}/category/delete?id=${item.categoryId}"><i class="fa fa-trash" aria-hidden="true"></i></a>

</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>