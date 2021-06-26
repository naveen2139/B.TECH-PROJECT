package makecon;

import java.io.IOException;
import java.sql.*;

import makecon.GetConnection; 
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DropTableQuer extends HttpServlet 
{
	Connection conn=null;
	PreparedStatement stmt=null;
	ResultSet rs=null;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
			try{
				RequestDispatcher rd=request.getRequestDispatcher("DropTableSucc.jsp");
				
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				GetConnection con1=new GetConnection();
				conn=con1.getConncetion(request,response);
				String table_name=request.getParameter("tables");
				String que="drop table "+table_name;
				stmt=conn.prepareStatement(que);
                int n=0;
				n=stmt.executeUpdate(que);
				rd.forward(request,response);
				out.flush();
		        out.close();
			}
	 	catch (Exception e) 
		{
		 e.printStackTrace();	
		}
	}

}
