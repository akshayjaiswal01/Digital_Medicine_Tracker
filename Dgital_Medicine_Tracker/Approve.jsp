<%@ page import="com.akshay.medical.ConnectDB" %>
<%@ page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 

int phid=Integer.parseInt(request.getParameter("phid"));
try {
	Connection con=ConnectDB.connect();
	PreparedStatement ps=con.prepareStatement("update pharmacist_tbl set status=? where phid=?");
	ps.setString(1,"Approved");
	ps.setInt(2, phid);
	int res=ps.executeUpdate();
	if(res>0) {
		response.sendRedirect("ViewMedicalRequest.jsp");
			
	}
	else {
		response.sendRedirect("ViewMedicalRequest.jsp");
	}
	
	
}
catch(Exception e) {
	e.printStackTrace();
}

%>
</body>
</html>