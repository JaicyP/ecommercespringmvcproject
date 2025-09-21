<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style>
body,html{

  height: 100%;
}
body {
  display: flex;
  flex-direction: column;
}
.container{
  flex:1;
}
.hero-image {
  width: 100%;
  background-image:url('${pageContext.request.contextPath}/image/showimage?name=heroimage'); /* Replace with your image path */
  height: 300px;
  background-size: cover;
  background-position: center;
  margin-top: 80px; /* Adjust if your navbar is fixed */
  margin-bottom: 20px;
}
 /* Card Section */
 .card-section {
  background-color: #f9f9f9;
  padding: 8px 8px;
  margin-bottom:20px;
}

/* Common container for alignment */
.card-container {
  max-width: 1200px;
  margin-left: 40px; /* aligns all items from same left point */
  margin-top:3px;
 
}

/* Left-aligned text */
.text-content {
  text-align: left;
  margin-bottom: 20px;
  max-width: 800px;
}

.text-content p{
  margin-top: 20px;
}

/* Cards horizontal */
.card-row {
  display: flex;
  gap: 20px;
  flex-wrap: wrap;
  margin-bottom: 30px;
}

/* Individual Card */
.card {
  padding-top:4px;
  background-color: white;
  width: 170px;
  box-shadow: 0 4px 8px rgba(0,0,0,0.1);
  border-radius: 10px;
  overflow: hidden;
  transition: transform 0.2s;
   margin-bottom:0px;
}

.card:hover {
  transform: scale(1.03);
}

.card img {
  display:block;
  margin:0 auto;
  width: 150px;
  height: 150px;
  object-fit: cover;
}

.card-content {
  padding: 8px;
} 

.card-content h3 {
  margin: 0;
  font-size: 0.8em;
}

.card-content p {
  margin-top: 8px;
  color: #555;
}
a:link,a:visited{
  text-decoration: none;
  color:black;
}

</style>
<body>
<jsp:include page="navbar1.jsp" />
  <div class="container">
  <div class="hero-image"></div>
  
  
 <c:forEach items="${categories}" var="category">
<div class="card-section">

      <div class="card-container">
      <!-- Text Content -->
           <div class="text-content">
              <h2>${category.name}</h2>
           </div>
       
       <div class="card-row">
          <c:forEach items="${products}" var="product">
           <c:set var="star" value="${product.ratingAverage}"></c:set>
          <!-- Repeat for all cards -->
          <c:if test="${product.category.name==category.name}">
          <a href="${pageContext.request.contextPath}/product/productDescription?id=${product.productId}" class="card">
            <img src="${pageContext.request.contextPath}/image/showproductimage?id=${product.productId}"  alt="${product.name}" >
            <div class="card-content">
              <h3>${product.name}</h3>
              <p>₹ ${product.price}</p>
               <c:forEach begin="1" end="5" var="item">
                 <c:choose>
                    <c:when test="${item<=star}">
                       <span>&#9733</span>
                    </c:when>
                   <c:otherwise>
                       <span>&#9734</span>
                   </c:otherwise>
                 </c:choose>
              </c:forEach>
            </div>
          </a>
          </c:if>
           </c:forEach> 
          </div>
        
        </div>

 </div>
 </c:forEach>
</div>
 <jsp:include page="footer.jsp" />

</body>
</html>
