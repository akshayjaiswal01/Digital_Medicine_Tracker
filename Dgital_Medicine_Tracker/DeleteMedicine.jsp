<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.akshay.medical.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<% 

int medid=Integer.parseInt(request.getParameter("medid"));
try {
	Connection con=ConnectDB.connect();
	PreparedStatement ps1=con.prepareStatement("delete from medicine_tbl where medid=?");
	ps1.setInt(1,medid);
	int rs=ps1.executeUpdate();
	if(rs>0) {
		response.sendRedirect("ViewDeleteMedicine.jsp");
	}
	else {
		response.sendRedirect("ViewDeleteMedicine.jsp");
	}
	
	
}
catch(Exception e) {
	e.printStackTrace();
}

%>

</body>
</html>