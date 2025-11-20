<%@ page import="com.akshay.medical.ConnectDB" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
  /* CSS Styles */
  body {
    font-family: Arial, sans-serif;
    background-image: url("http://cdn.wallpapersafari.com/87/15/V6z0Eb.jpg");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
  }
  .container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
  table {
    border-collapse: collapse;
    width: 80%;
    background-color: #ffffff;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
  }
  th, td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
  }
  th {
    background-color: #f5f5f5;
    font-weight: bold;
  }
  tr:nth-child(even) {
    background-color: #f2f2f2;
  }
  tr:hover {
    background-color: #e5e5e5;
  }
</style>
</head>
<body>
<div class="container">
	<%
			String search = request.getParameter("search");
			try{
			
					Connection con = ConnectDB.connect();
					PreparedStatement ps1 = con.prepareStatement("select * from medicine_tbl where medname like '%"+search+"%' OR medbrand like '%"+search+"%' ;");
					ResultSet rs = ps1.executeQuery();
	%>

						<table>
							<tr>
								<th>MEDICINE NAME</th>
								<th>MEDICINE BRAND</th>
								<th>MEDICINE QUANTITY</th>
								<th>MEDICINE EXPIRY DATE</th>
								<th>MEDICINE PRICE</th>
								
							</tr>
	
	<% 
					while(rs.next())
					{ 
	%>
						<tr>
							<td><%= rs.getString("medname") %></td>
							<td><%= rs.getString("medbrand") %></td>
							<td><%= rs.getString("medquantity") %></td>
							<td><%= rs.getString("medexpiry") %></td>
							<td><%= rs.getString("medprice") %></td>		
							
						</tr>	
	<% 
					} 
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
	%>
	
</table>
</div>
</body>
</html>