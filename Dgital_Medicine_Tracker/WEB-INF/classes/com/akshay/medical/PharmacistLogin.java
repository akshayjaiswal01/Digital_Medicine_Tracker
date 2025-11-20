package com.akshay.medical;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class PharmacistLogin
 */
public class PharmacistLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PharmacistLogin() {
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
		
		String phemail = request.getParameter("phemail");
		String phpassword = request.getParameter("phpassword");
		
		try
		{
			Connection con = ConnectDB.connect();

			PreparedStatement ps1 = con.prepareStatement("select * from pharmacist_tbl where phemail=? and phpassword=?");
			ps1.setString(1, phemail);
			ps1.setString(2, phpassword);
			ResultSet rs1 = ps1.executeQuery();

			if(rs1.next())
			{
				User.setEmail(phemail);
				response.sendRedirect("PharmacistDashboard.html");
			}
			else
			{
				response.sendRedirect("PharmacisLogin.html");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	
		
	}

}
