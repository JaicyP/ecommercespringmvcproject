<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register Page</title>
  <style>
.container{
margin-top:100px;
margin-bottom:50px;
margin-left:190px;
margin-right:190px;
}
h1{
 margin: 20px auto; 
 text-align:center;
 }
  .form{
     display:flex;
     justify-content:center;
     flex-direction:column;
   
  }
  input[type=text],[type=email] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
}

select {
  width: 100%;
  padding: 12px 20px;
  border: 1px solid black;
  border-radius: 4px;
  margin: 8px 0;
  
}
 input[type=submit]{
  background-color: #04AA6D;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 20px auto;  
  cursor: pointer;
  width:50%;
  border-radius:50px;
  display:block;
} 
</style>
</head>
<body>
<jsp:include page="navbar1.jsp" />
<div class="container">
<h1>Sign Up</h1>
<p style="color:red">${mess1}</p>
<form action="<c:url value='/user/create'/>" method="post" class="form">

     <label>Name</label>
     <input type="text" name="name" required><br/>

     <label>Email</label>
     <input type="email" name="email" required><br/>

     <label>Mobile</label>
     <input type="text" name="mobile" required><br/>
     
     <label>Role</label>
     <select name="role" required>
         <option value="">-- Select Role --</option>
         <option value="CUSTOMER">Customer</option>
         <option value="ADMIN">Admin</option>
     </select><br/>
     
     <label>Address</label>
     <input type="text" name="city" placeholder="city" required><br/>
     <input type="text" name="state" placeholder="state" required><br/>
     <input type="text" name="pincode" placeholder="pincode" required><br/>
     <input type="text" name="country" placeholder="country" required><br/>
     <input type="submit">
</form>
</div>
</body>
</html>