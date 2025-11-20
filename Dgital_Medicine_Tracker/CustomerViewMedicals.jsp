<%@ page import="com.akshay.medical.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pharmacist List</title>
<style>
body {
  font-family: Arial, sans-serif;
  background-image: url("http://cdn.wallpapersafari.com/87/15/V6z0Eb.jpg");
  display: flex;
  align-items: center;
  justify-content: center;
  min-height: 100vh;
}

table {
  border-collapse: collapse;
  opacity: 0;
  animation: fade-in 1s forwards;
}

@keyframes fade-in {
  0% {
    opacity: 0;
  }
  100% {
    opacity: 1;
  }
}

th, td {
  padding: 8px;
  text-align: left;
}

th {
  background-color: #4CAF50;
  color: #fff;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}

tr:hover {
  background-color: #ddd;
}

.dashboard-button {
  position: absolute;
  top: 10px;
  right: 10px;
  text-decoration: none;
  background-color: #4CAF50;
  color: #fff;
  padding: 8px 16px;
  border-radius: 4px;
}

</style>
</head>
<body>  
<%
	Connection con = ConnectDB.connect();
	PreparedStatement ps1 = con.prepareStatement("select * from pharmacist_tbl");
	ResultSet rs = ps1.executeQuery();
%>

<a href="CustomerDashboard.html" class="dashboard-button">Dashboard</a>

<table border="1">
  <tr>
    <th>ID</th>
    <th>NAME</th>
    <th>SHOP NAME</th>
    <th>CONTACT NUMBER</th>
    <th>ADDRESS</th>
    <TH>STATUS</TH>
  </tr>
  
  <% while(rs.next()){ %>
  <tr>
    <td> <%=rs.getInt("phid")%></td>
    <td> <%=rs.getString("phname")%></td>
    <td> <%=rs.getString("ph_store_name")%></td>
    <td> <%=rs.getString("phmob")%></td>
    <td> <%=rs.getString("phaddress")%></td>
    <td> <%=rs.getString("status")%></td>
    
  </tr>				
  <% } %>		
</table>

</body>
</html>
