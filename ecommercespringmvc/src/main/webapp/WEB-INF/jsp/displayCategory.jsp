<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
   margin-top:100px;
   padding-left: 220px; 
 
}
.category-details-container {
  padding: 30px;
  margin-top:35px
}

.section-title {
  text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
}

.details-box {
  border: 2px solid #5610ef;
  padding: 20px 30px;
  width: 60%;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 8px;
   box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.details-box p {
  font-size: 18px;
  margin: 20px 0;
}
</style>
<meta charset="UTF-8">
<title>show single category</title>
</head>
<body>
<jsp:include page="navbar2.jsp" />
 <h2 class="section-title">Product Details</h2>
<div class="container">
<div class="category-details-container">
  <div class="details-box">
    <p><strong>Category Name:</strong>${category.name}</p>
    <p><strong>Category Details:</strong> ${category.description}</p>
    
  </div>
  </div>
  </div>

</body>
</html>