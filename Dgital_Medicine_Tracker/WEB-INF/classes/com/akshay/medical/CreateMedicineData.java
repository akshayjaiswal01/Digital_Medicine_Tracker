package com.akshay.medical;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreateMedicineData
 */
public class CreateMedicineData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateMedicineData() {
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
		int medid = parseInt(request.getParameter("medid"));
		String medname = request.getParameter("medname");
		String medbrand = request.getParameter("medbrand");
		String gender = request.getParameter("gender");
		String medquantity = request.getParameter("medquantity");
		String medexpiry = request.getParameter("medexpiry");
		String medprice = request.getParameter("medprice");
		
		try
		{
			PreparedStatement ps1 = con.prepareStatement("insert into medicine_tbl values(?,?,?,?,?,?,?)");
			ps1.setInt(1, medid);
			ps1.setString(2, medname);
			ps1.setString(3, medbrand);
			ps1.setString(4, gender);
			ps1.setString(5, medquantity);
			ps1.setString(6, medexpiry);
			ps1.setString(7, medprice);
			
			int i = ps1.executeUpdate();
			
			if(i>0)
			{
		
				response.sendRedirect("PharmacistDashboard.html");
			}
			else
			{
				response.sendRedirect("MedicineData.html");
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