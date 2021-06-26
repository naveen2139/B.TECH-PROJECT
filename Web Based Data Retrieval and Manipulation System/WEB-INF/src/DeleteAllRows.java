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
import javax.servlet.http.HttpSession;

public class DeleteAllRows extends HttpServlet 
{
	Connection conn=null;
	PreparedStatement stmt=null;
	Statement stm=null;
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		       RequestDispatcher rd1=request.getRequestDispatcher("DeleteFailure.jsp");
		
		
			try{
				RequestDispatcher rd=request.getRequestDispatcher("DeletedRowsSucc.jsp");
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				GetConnection con1=new GetConnection();
				conn=con1.getConncetion(request,response);
				
				HttpSession sc=request.getSession();
				String table=(String)sc.getAttribute("tablename");
				
				String que1="delete from "+table;
				stm=conn.createStatement();
				stm.executeUpdate(que1);
				rd.forward(request,response);
				out.flush();
		        out.close();
			}
		catch (Exception e) 
		{
			rd1.forward(request,response);
			//e.printStackTrace();
		}
	}

}
