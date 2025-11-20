package com.akshay.medical;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreatePharmacistAccount
 */
public class CreatePharmacistAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**	
     * @see HttpServlet#HttpServlet()
     */
    public CreatePharmacistAccount() {
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
		
		int phid = parseInt(request.getParameter("phid"));	
		String phname = request.getParameter("phname");
		String phemail = request.getParameter("phemail");
		String ph_store_name = request.getParameter("ph_store_name");
		String phmob = request.getParameter("phmob");
		String phaddress = request.getParameter("phaddress");
		String phpassword = request.getParameter("phpassword");
		String status = "Pending";
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");

		
		try
		{
			PreparedStatement ps1 = con.prepareStatement("insert into pharmacist_tbl values(?,?,?,?,?,?,?,?,?,?)");
			ps1.setInt(1, phid);
			ps1.setString(2, phname);
			ps1.setString(3, phemail);
			ps1.setString(4, ph_store_name);
			ps1.setString(5, phmob);
			ps1.setString(6, phaddress);
			ps1.setString(7, phpassword);
			ps1.setString(8, status);
			ps1.setString(9, lat);
			ps1.setString(10, lng);
			
			
			int i = ps1.executeUpdate();
			
			if(i>0)
			{
				response.sendRedirect("PharmacistDashboard.html");
			}
			else
			{
				response.sendRedirect("PharmacistRegiste.jsp");
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
