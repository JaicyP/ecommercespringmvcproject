<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
footer{
background-color: #222; 
color: #fff; 
padding: 40px 0; 
font-family: Arial, sans-serif;
}
.aboveContainer{
max-width: 1200px; 
margin: auto; 
display: flex;
flex-wrap: wrap; 
justify-content: space-between;
} 
.about{
flex: 1 1 250px;
margin: 10px;
}
.quickLinks{
flex: 1 1 150px; 
margin: 10px;
}
.quickLinks a,.customerService a{
 color: #bbb;  
text-decoration: none;
}
ul{
list-style: none; 
padding: 0; 
margin: 0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<footer >
    <div class="aboveContainer">
  
      
      <div class="about">
        <h3 style="color: #5610ef;">Ecommerce Website</h3>
        <p>Your one-stop shop for quality products at unbeatable prices.</p>
      </div>
  
     
      <div class="quickLinks">
        <h4>Quick Links</h4>
        <ul>
          <li><a href="#">Home</a></li>
          <li><a href="#">Shop</a></li>
          <li><a href="#">About Us</a></li>
          <li><a href="#">Contact</a></li>
        </ul>
      </div>
  
      <!-- Customer Service -->
      <div style="flex: 1 1 150px; margin: 10px;" class="customerService">
        <h4>Customer Service</h4>
        <ul>
          <li><a href="#">FAQs</a></li>
          <li><a href="#">Returns</a></li>
          <li><a href="#">Shipping</a></li>
          <li><a href="#">Privacy Policy</a></li>
        </ul>
      </div>
  
      <!-- Newsletter -->
      <div style="flex: 1 1 250px; margin: 10px;">
        <h4>Subscribe to our Newsletter</h4>
        <form style="display: flex; flex-wrap: wrap;">
          <input type="email" placeholder="Enter your email" 
                 style="padding: 10px; flex: 1; border: none; outline: none;">
          <button type="submit" 
                  style="background-color: #5610ef; border: none; color: #fff; padding: 10px 15px; cursor: pointer;">
            Subscribe
          </button>
        </form>
      </div>
  
    </div>
  
    <!-- Bottom Bar -->
    <div style="text-align: center; padding-top: 20px; border-top: 1px solid #444; margin-top: 20px; font-size: 14px; color: #bbb;">
      &copy; 2025 ECommerce website. All rights reserved.
    </div>
  </footer>
  

</body>
</html>