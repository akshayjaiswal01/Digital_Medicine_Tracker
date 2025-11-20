package com.akshay.medical;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB 
{
	static Connection con = null;
	public static Connection connect()
	{
		if(con==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/life_care", "root", "");
				System.out.println("Connection Successful....");
			}
			catch(Exception e)
			{
				System.err.println("Someting went wrong....");
				e.printStackTrace();
			}
		}
		return con;
		
	}
	
	
}
