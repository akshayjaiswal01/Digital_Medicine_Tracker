package com.akshay.medical;

import java.io.IOException;
import java.sql.*;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateCustomerAccount
 */
public class CreateCustomerAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateCustomerAccount() {
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
		
Connection con = ConnectDB.connect();
		
		int custid = parseInt(request.getParameter("custid"));	
		String custname = request.getParameter("custname");
		String custemail = request.getParameter("custemail");
		String custmob = request.getParameter("custmob");
		String custaddress = request.getParameter("custaddress");
		String custpassword = request.getParameter("custpassword");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		
		try
		{
			PreparedStatement ps1 = con.prepareStatement("insert into customer_tbl values(?,?,?,?,?,?,?,?)");
			ps1.setInt(1, 0);
			ps1.setString(2, custname);
			ps1.setString(3, custemail);
			ps1.setString(4, custmob);
			ps1.setString(5, custaddress);
			ps1.setString(6, custpassword);
			ps1.setString(7, lat);
			ps1.setString(8, lng);
			
			int i = ps1.executeUpdate();
			if(i>0)
			{
				response.sendRedirect("CustomerDashboard.html");
			}
			else
			{
				response.sendRedirect("CustomerRegiste.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		
		
	}

	private int parseInt(String parameter) {
		// TODO Auto-generated method stub
		return 0;
	}

	}
