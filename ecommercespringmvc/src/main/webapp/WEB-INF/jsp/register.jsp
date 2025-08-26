<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Register Page</title>
</head>
<body>
<p>This is the register page</p>
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
</body>
</html>