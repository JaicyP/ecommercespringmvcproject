<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="/exceptionHandler"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
body{

}
.product-container{
margin:100px 190px;
}
.container{
display:flex;
justify-content:center;
align-items:center;
}
.left{
padding:30px 30px;
border:1px solid black;
position:relative;
}
.left img{
width:500px;
height:500px;
}
.right{
padding:30px 30px;
}
.right h{
font-size:2em;
}
.right p{
font-size:1.2em;
}
.button {
  border: none;
  width:70%;
  padding: 15px 32px;
  border-radius:60px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 6px 2px;
  cursor: pointer;
}

.button1 {color:white;background-color:#5610ef;} /* Green */
.button2 {color:black;background-color:white;border:1px solid black;} 

.img-magnifier-glass {
  position: absolute;
  border: 3px solid #000;
  border-radius: 50%;
  cursor: none;
  /*Set the size of the magnifier glass:*/
  width: 100px;
  height: 100px;
}

</style>
<meta charset="UTF-8">
<title>Product Description</title>
<script>
function magnify(imgID, zoom) {
  var img, glass, w, h, bw;
  img = document.getElementById(imgID);
  /*create magnifier glass:*/
  glass = document.createElement("DIV");
  glass.setAttribute("class", "img-magnifier-glass");
  /*insert magnifier glass:*/
  img.parentElement.insertBefore(glass, img);
  /*set background properties for the magnifier glass:*/
  glass.style.backgroundImage = "url('" + img.src + "')";
  glass.style.backgroundRepeat = "no-repeat";
  glass.style.backgroundSize = (img.width * zoom) + "px " + (img.height * zoom) + "px";
  bw = 3;
  w = glass.offsetWidth / 2;
  h = glass.offsetHeight / 2;
  /*execute a function when someone moves the magnifier glass over the image:*/
  glass.addEventListener("mousemove", moveMagnifier);
  img.addEventListener("mousemove", moveMagnifier);
  /*and also for touch screens:*/
  glass.addEventListener("touchmove", moveMagnifier);
  img.addEventListener("touchmove", moveMagnifier);
  function moveMagnifier(e) {
    var pos, x, y;
    /*prevent any other actions that may occur when moving over the image*/
    e.preventDefault();
    /*get the cursor's x and y positions:*/
    pos = getCursorPos(e);
    x = pos.x;
    y = pos.y;
    /*prevent the magnifier glass from being positioned outside the image:*/
    if (x > img.width - (w / zoom)) {x = img.width - (w / zoom);}
    if (x < w / zoom) {x = w / zoom;}
    if (y > img.height - (h / zoom)) {y = img.height - (h / zoom);}
    if (y < h / zoom) {y = h / zoom;}
    /*set the position of the magnifier glass:*/
    glass.style.left = (x - w) + "px";
    glass.style.top = (y - h) + "px";
    /*display what the magnifier glass "sees":*/
    glass.style.backgroundPosition = "-" + ((x * zoom) - w + bw) + "px -" + ((y * zoom) - h + bw) + "px";
  }
  function getCursorPos(e) {
    var a, x = 0, y = 0;
    e = e || window.event;
    /*get the x and y positions of the image:*/
    a = img.getBoundingClientRect();
    /*calculate the cursor's x and y coordinates, relative to the image:*/
    x = e.pageX - a.left;
    y = e.pageY - a.top;
    /*consider any page scrolling:*/
    x = x - window.pageXOffset;
    y = y - window.pageYOffset;
    return {x : x, y : y};
  }
}
</script>
</head>
<body>


<div class="product-container">
<c:set var="star" value="${product.ratingAverage}"></c:set>
<h1>Product Description</h1>
<div class="container">
<div class="left">
  <img src="${pageContext.request.contextPath}/image/showproductimage?id=${product.productId}" alt="${product.productId }" id="myimage">
</div>
<div class="right">
 <div id="myresult" class="img-zoom-result"></div>
  <h1>${product.name}</h1>
  <p>Price: ₹ ${product.price}</p>
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
  <span><p>Average rating:${product.ratingAverage}</p></span>
  <p>${product.description}</p>
  <c:choose>
    <c:when test="${not empty sessionScope.user}">
          <form action="<c:url value='/cart/addtocart'/>" method="post">
            <input type="hidden" name="productId" value="${product.productId}" />
             <input type="hidden" name="cartId" value="${sessionScope.user.cart.cartId}" />
            <button type="submit" class="button button1">Add To Cart</button>
        </form>
    </c:when>
    <c:otherwise>
      <button type="button" class="button button1"  onclick="window.location.href='<c:url value='/user/loginpage'/>'">Add To Cart</button></br>
    </c:otherwise>
  </c:choose>
  <button type="button" class="button button2">Add To Wishlist</button>
</div>
</div>
</div>
<jsp:include page="footer.jsp" />
<script>
    magnify("myimage", 3);
</script>
</body>
</html>