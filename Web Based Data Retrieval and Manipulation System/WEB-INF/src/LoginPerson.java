package makecon;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import makecon.GetConnection;
import java.sql.*;

public class LoginPerson extends HttpServlet 
{
        Connection conn=null;
        Statement stmt=null;
        ResultSet rs=null;
		public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{

		
		try 
		{
			GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			PrintWriter out;
			response.setContentType("text/html");
			out = response.getWriter();
			
			 RequestDispatcher rd=request.getRequestDispatcher("Dbnames.jsp");
			 RequestDispatcher rd1=request.getRequestDispatcher("Signin.jsp");
			
			String name=request.getParameter("uname");
			String pass=request.getParameter("pass");
			String que="select count(*) from RegisterDetails where username='"+name+"' and password='"+pass+"'";
			stmt=conn.createStatement();	
			System.out.println(que);
						
			 rs=stmt.executeQuery(que);
			 int result=0;
			while(rs.next())
			{
				 result=rs.getInt(1);
			}
                if(result!=0)			
			    rd.forward(request,response);
			else
				rd1.forward(request,response);
			out.close();
		}
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		}

}
