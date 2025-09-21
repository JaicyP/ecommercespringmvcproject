<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
    body{
        
    }
    .container{
        margin:100px 190px;
    }
    .form{
      display:flex;
      justify-content:center;
      flex-direction:column;
    }
    h1{
    margin-bottom:20px;
    }
    
    input[type=text],input[type=input]{
     width: 70%;
     padding: 12px 20px;
     margin: 8px 0;
     box-sizing: border-box;
    }
    input[type=submit]{
     background-color: #04AA6D;
     align-items:center;
     border-radius: 50px;
     color: white;
     padding: 16px 32px;
     text-decoration: none;
     cursor: pointer;
     width: 40%;
    }
    textarea {
     width: 70%;
     height: 150px;
     padding: 12px 20px;
     box-sizing: border-box;
     border: 2px solid #ccc;
    border-radius: 4px;
   resize: none;
}
</style>
<meta charset="UTF-8">
<title>Update Category Page</title>
</head>
<body>
<jsp:include page="navbar2.jsp" />
<div class="container">
<h1>Update category</h1>

<form action="<c:url value='/category/update'/>" class="form" method="post">
   <input type="hidden" name="id" value="${category.categoryId}"/><br/>
   <label>Name</label>
   <input type="text" name="name" value="${category.name}" required/><br/>
   <label>Description</label><br/>
   <textarea name="description" rows="3" required>${category.description}</textarea><br/>
   <input type="submit"  value="submit"/>
</form>
</div>
</body>
</html>