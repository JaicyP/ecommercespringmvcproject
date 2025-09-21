<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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
    
   input[type=text]{
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
    

</style>
<head>
<meta charset="UTF-8">
<title>Register Images</title>
</head>
<body>
<jsp:include page="navbar2.jsp" />
<div class="container">
<h1 style="text-align:center">Enter the product</h1>


<form action="<c:url value='image/landingImages'/>"  method="post" class="form" enctype="multipart/form-data">

<label>Name</label><br/>
<input type="text" name="name" placeholder="name" required/><br/>


<label>Image</label><br/>
<input type="file" name="image" required/><br/>


<input type="submit" value="submit"/>


   
</form>

</div>

</body>
</html>