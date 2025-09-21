<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    
   input[type=text],input[type=number],input[type=number]{
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
.profile-upload {
  display: flex;
  align-items:center;
  margin-bottom: 20px;
}
.upload-circle {
  width: 120px;
  height: 120px;
  background-color: #f8fdfe;
  justify-content:center;
  align-items:center;
  display: flex;
  cursor: pointer;
/*   overflow: hidden; */
  object-fit: cover;
  border: 2px solid #aaa;
  transition: border-color 0.3s;
}
</style>
<meta charset="UTF-8">
<title>Update Product</title>
</head>
<body>

<jsp:include page="navbar2.jsp" />
<div class="container">
<h1 >Update the Product</h1>
<form action="<c:url value='/product/update'/>"  method="post" class="form" enctype="multipart/form-data" >

<input type="hidden" name="id" value="${product.productId}"/><br/>

<label>Name</label><br/>
<input type="text" name="name" value="${product.name}" /><br/>

<label>Description</label><br/>
<textarea name="description" rows="3" >${product.description}</textarea><br/>

<label>Choose the Category</label><br/>
<select name="categoryName">
<option value="${product.category.name}">${product.category.name}</option>
<option value="Electronics">Electronics</option>
<option value="Toys">Toys</option>
<option value="Beauty Products">Beauty Products</option>
<option value="Furniture">Furniture</option>
<option value="Kitchen Appliances">Kitchen Appliances</option>
<option value="TVs and Home Appliances">TVs and Home Appliances</option>
<option value="Books">Books</option>
<option value="Men & women Clothing">Men & women Clothing</option>
</select><br/>

<label>Price</label><br/>
<input type="number" name="price" value="${product.price}" /><br/>

<label >Stock</label><br/>
<input type="number"  name="stockQuantity" value="${product.stockQuantity}"><br/>

<label>Product Image</label><br/>
<%-- <input type="file" name="imageUrl" value="${product.imageUrl}" /><br/> --%>
 <div class="profile-upload">
   <input type="file" name="image" id="profilePic" accept="image/*" onchange="previewImage()"/>
   <label for="profilePic" class="upload-circle ">
        <img id="profilePreview" src="${pageContext.request.contextPath}/image/showproductimage?id=${product.productId}" alt="product image" />
    </label>
 </div>

<label>Rating</label><br/>
<input type="number"  name="ratingAverage" value="${product.ratingAverage}" step="0.1" min="0" max="5"><br/>

<input type="submit" value="submit"/>
   
</form>
</div>
<jsp:include page="footer.jsp" />
<script>
  function previewImage() {
    const input = document.getElementById('profilePic');
    const preview = document.getElementById('profilePreview');

    if (input.files && input.files[0]) {
      const reader = new FileReader();
      reader.onload = function (e) {
        preview.src = e.target.result;
      };
      reader.readAsDataURL(input.files[0]);
    }
  }
</script> 
</body>
</html>