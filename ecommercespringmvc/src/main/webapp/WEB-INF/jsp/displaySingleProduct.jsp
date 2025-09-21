<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<style>

.container{
margin-top:100px;
margin-bottom:50px;

}
h2{
 text-align: center;
  margin-bottom: 20px;
  font-size: 24px;
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
<head>
<meta charset="UTF-8">
<title>Display Single Product</title>
</head>
<body>
<jsp:include page="navbar2.jsp" />
<div class="container">
  <h2>Product Details</h2>
  <div class="details-box">
    <p><strong>Product Name:</strong>${products.name}</p>
    <p><strong>Category Details:</strong> ${products.category}</p>
    <p><strong>Description:</strong>${products.description}</p>
    <p><strong>Price:</strong>${products.price}</p>
    <p><strong>Stock Quantity:</strong>${products.stockQuantity}</p>
    <p><strong>Rating:</strong>${products.ratingAverage}</p>
    <p><strong>Image:</strong><img src="${pageContext.request.contextPath}/image/showproductimage?id=${products.productId}"  alt="${products.name}" ></p>
    
  </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>