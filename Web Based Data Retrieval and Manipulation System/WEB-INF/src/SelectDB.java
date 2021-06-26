package makecon;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;

public class SelectDB extends HttpServlet 
{

	/*Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;*/
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			
   			/*GetConnection con1=new GetConnection();
			conn=con1.getConncetion();
			stmt=conn.createStatement();*/
			
			RequestDispatcher rd=request.getRequestDispatcher("SelectOperation.jsp");
			//RequestDispatcher rd1=request.getRequestDispatcher("/SqlDataBases1");
            String dbname="oracle";
			String name=request.getParameter("db");
			
			if(name.equals(dbname))
				rd.forward(request,response);
				//else
				//rd1.forward(request,response);			 
			out.flush();
			out.close();
		}
		catch (Exception e) 
		  {
			e.printStackTrace();
		  } 
	

}
}
