package com.akshay.medical;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CustomerLogin
 */
public class CustomerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String custemail = request.getParameter("custemail");
		String custpassword = request.getParameter("custpassword");
		
		try
		{
			Connection con = ConnectDB.connect();

			PreparedStatement ps1 = con.prepareStatement("select * from Customer_tbl where custemail=? and custpassword=?");
			ps1.setString(1, custemail);
			ps1.setString(2, custpassword);
			ResultSet rs1 = ps1.executeQuery();

			if(rs1.next())
			{
				User.setEmail(custemail);
				response.sendRedirect("CustomerDashboard.html");
			}
			else
			{
				response.sendRedirect("CustomerLogin.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
