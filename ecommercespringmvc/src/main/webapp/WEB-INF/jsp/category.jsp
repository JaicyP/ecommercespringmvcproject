<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
    
    input[type=text]{
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
<title>Register Category</title>
</head>
<body>
<jsp:include page="navbar2.jsp" />
 <div class="container">
<h1>Add category</h1>

<form action="<c:url value='/category/add'/>" class="form" method="post">
   <label>Name</label>
   <input type="text" name="name" placeholder="category" required/><br/>
   <label>Description</label><br/>
   <textarea name="description" placeholder="category description..." rows="3" required></textarea><br/>
   <input type="submit"  value="submit"/>
</form>
 </div>
</body>
</html>