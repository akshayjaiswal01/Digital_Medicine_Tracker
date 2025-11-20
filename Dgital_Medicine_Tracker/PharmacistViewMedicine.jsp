<%@ page import="com.akshay.medical.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

/* Additional style for the dashboard button */
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
	try {
		Connection con = ConnectDB.connect();
		PreparedStatement ps1 = con.prepareStatement("select * from medicine_tbl");
		ResultSet rs = ps1.executeQuery();
%>

<!-- Add the dashboard button at the top-right corner -->
<a href="PharmacistDashboard.html" class="dashboard-button">Dashboard</a>

<table border="1">
  <tr>
  	<th>MEDICINE ID</th>
    <th>MEDICINE NAME</th>
    <th>MEDICINE BRAND</th>
    <th>GENDER</th>
    <th>MEDICINE QUANTITY</th>
    <th>MEDICINE EXPIRY</th>
    <th>MEDICINE PRICE</th>
  </tr>
  
  <% while(rs.next()){ %>
  <tr>
  	<td><%=rs.getInt("medid")%></td>
    <td><%=rs.getString("medname")%></td>
    <td><%=rs.getString("medbrand")%></td>
    <td><%=rs.getString("gender")%></td>
    <td><%=rs.getString("medquantity")%></td>
    <td><%=rs.getString("medexpiry")%></td>
    <td><%=rs.getString("medprice")%></td>
  </tr>				
  <% } %>
  <% } catch (Exception e) { %>
  <tr>
    <td colspan="7">Error: <%=e.getMessage()%></td>
  </tr>
<% } %>		
</table>

</body>
</html>
