<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
.container{
margin-top:100px;
}
 h1{
   margin:40px 190px;
 }
 .form{
      display:flex;
      justify-content:center;
      flex-direction:column;
       margin:40px 190px;
    }
    
   input[type=text],input[type=number]{
     width: 70%;
     padding: 12px 20px;
     border: 2px solid #ccc;
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

select {
  width: 70%;
  padding: 16px 20px;
  border: 2px solid #ccc;
  background-color: white;
}


</style>
<meta charset="UTF-8">
<title>Register Product</title>
</head>
<body>
<jsp:include page="navbar2.jsp" />
<h1 >Add the product</h1>
<form action="<c:url value='/product/create'/>"  method="post" class="form" enctype="multipart/form-data" >

<label>Name</label><br/>
<input type="text" name="name" placeholder="product name" required/><br/>

<label>Description</label><br/>
<textarea name="description"placeholder="product description.." rows="3" required></textarea><br/>

<label>Choose the Category</label><br/>

<select name="categoryName">
<option value="">-select category-</option>
 <c:forEach items="${sessionScope.names}" var="items">
     <option value="${items}">${items}</option>
</c:forEach>
</select><br/>

<label>Price</label><br/>
<input type="number" name="price" placeholder="price" required/><br/>

<label >Stock</label><br/>
<input type="number"  name="stockQuantity" placeholder="stock"required><br/>

<label>Product Image</label><br/>
<input type="file" name="image" accept="image/*" required/><br/>

<label>Rating</label><br/>
<input type="number"  name="ratingAverage" placeholder="average rating" step="0.1" min="0" max="5" required><br/>

<input type="submit" value="submit"/>
</form>
</body>
</html>