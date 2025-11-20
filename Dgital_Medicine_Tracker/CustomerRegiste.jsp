<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<%
  String lat=request.getParameter("lat");
  String lng=request.getParameter("lng");
  
  System.out.println("lat "+lat);
  System.out.println("lng "+lng);
  %>
  <div class="container">
 
    <h2>Customer Registration Form</h2>
    <form  action="CreateCustomerAccount" method="post">
      <div class="form-group">
        <input type="text" id="id" name="custid" required>
        <label for="custid">ID</label>
      </div>
      <div class="form-group">
        <input type="text" id="name" name="custname" required>
        <label for="custname">Name</label>
      </div>
      <div class="form-group">
        <input type="email" id="email" name="custemail" required>
        <label for="custemail">Email</label>
      </div>
      <div class="form-group">
        <input type="tel" id="mobile" name="custmob" required>
        <label for="custmob">Mobile Number</label>
      </div>
      <div class="form-group">
        <input type="text" id="address" name="custaddress" required>
        <label for="custaddress">Address</label>
      </div>
      <div class="form-group">
        <input type="password" id="password" name="custpassword" required>
        <label for="custpassword">Password</label>
      </div>
       <div class="form-group">
        <input value="<%=lat %> type="text" id="address" name="lat" required value="">
        <label for="custaddress">Longitude</label>
      </div>
       <div class="form-group">
        <input value="<%=lng %> type="text" id="address" name="lng" required value="">
        <label for="custaddress">Latitude</label>
      </div>
      
      <button type="submit">Register</button>
    </form>
    <div class="login-links">
      <a class="small-button" href="http://localhost:8080/FreeShop/index.html">Back</a>
      <a class="small-button" href="http://localhost:8080/FreeShop/PharmacisLogin.html">Customer Login</a>
    </div>
  </div>
</body>
</html>





<style>


body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
}

.container {
  max-width: 400px;
  margin: 0 auto;
  padding: 40px;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
  text-align: center;
  margin-bottom: 30px;
}

.form-group {
  position: relative;
  margin-bottom: 25px;
}

input {
  width: 100%;
  padding: 10px 0;
  font-size: 16px;
  color: #333;
  border: none;
  border-bottom: 1px solid #ccc;
  outline: none;
}

input:focus {
  border-bottom: 1px solid #777;
}

label {
  position: absolute;
  top: 0;
  left: 0;
  font-size: 16px;
  color: #999;
  pointer-events: none;
  transition: 0.5s ease all;
}

input:valid ~ label,
input:focus ~ label {
  top: -20px;
  left: 0;
  font-size: 12px;
  color: #777;
}

button[type="submit"] {
  display: block;
  width: 100%;
  padding: 10px;
  margin-top: 30px;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
  transition: background-color 0.3s;
}

button[type="submit"]:hover {
  background-color: #45a049;
}

.login-links {
  text-align: center;
  margin-top: 20px;
}

.small-button {
  display: inline-block;
  padding: 6px 12px;
  background-color: #4caf50;
  color: #fff;
  text-decoration: none;
  border-radius: 4px;
  transition: background-color 0.3s;
}

.small-button:hover {
  background-color: #45a049;
}
body {
  font-family: Arial, sans-serif;
  background-color: #f4f4f4;
  background-image: url('https://img.freepik.com/free-photo/medicines-medical-supplies-placed-blue_1150-19151.jpg?size=626&ext=jpg&ga=GA1.1.1530667080.1689670741&semt=sph'); /* Replace 'path/to/your/background-image.jpg' with the actual path to your background image */
  background-size: cover; /* Adjust this property based on how you want the background image to cover the container */
  background-repeat: no-repeat;
}



</style>