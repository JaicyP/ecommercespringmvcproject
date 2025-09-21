<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
  html, body {
    height: 100%;
    margin: 0;
  }

  body {
    display: flex;
    flex-direction: column;
    font-family: system-ui, sans-serif;
  }
  h1{
  margin-bottom:0;
  }

  .container {
    flex: 1;                         
    display: flex;
    justify-content: center;         
    align-items: center;             
    flex-direction: column;          
  }

  .form {
    display: flex;
    flex-direction: column;
    gap: 5px;
    width: 70%;        /* optional */
    max-width: 400px;  /* optional */
  }

  input[type=email],
  input[type=password] {
    padding: 12px 20px;
    border: 2px solid #ccc;
    box-sizing: border-box;
  }

  input[type=submit] {
    background-color: #04AA6D;
    border: none;
    border-radius: 50px;
    color: white;
    padding: 16px 32px;
    cursor: pointer;
    width: 60%;
    margin: 0 auto; /* center inside form */
    text-align: center;
  }
</style>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<div class="container">
<h1 style="text-align:center">Login Form</h1>

<p style="color:green">${sucess}</p>
<p style="color:red">${mess3}</p>
<form action="<c:url value='/user/login'/>" class="form" method="post">

<label>Enter your Email</label><br/>
<input type="email" name="user" placeholder="Email.." required/><br/>

<label>Enter your Password</label><br/>
<input type="password" name="pass" placeholder="password..." required/><br/>
<input type="submit" value="submit"/>
</form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>