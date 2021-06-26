package makecon;
import java.sql.*;

import makecon.GetConnection;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DTO.AddColoumnDetails;

public class CreateTable extends HttpServlet 
{
	Connection con = null;
    Statement stmt=null;
    Statement stmt1=null;
    Statement stmt2=null;
    PreparedStatement ps =null;
    ResultSet rs=null;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {
		
		RequestDispatcher rd=request.getRequestDispatcher("TableCreateExcep.jsp"); 
		PrintWriter out;
		
		try {
			
				//db connection
				GetConnection gc = new GetConnection();  
				con= gc.getConncetion(request,response);
				response.setContentType("text/html");
				out = response.getWriter();
				RequestDispatcher rd1=request.getRequestDispatcher("TableCreatedSucc.jsp");
				
			
				String tabname=(String)request.getSession().getAttribute("tabname");
				String create="create table "+tabname+"(";
				String que="select * from  savecolumndet";
				ps =con.prepareStatement(que);
				rs=ps.executeQuery();
				String appendcol="";
				while(rs.next())
				{
				
				String colname=rs.getString(1);
				String coltype=rs.getString(2);
				int s1=rs.getInt(3);
				String colcon=rs.getString(4);
				if(!coltype.equalsIgnoreCase("date"))
				appendcol +=colname+" "+coltype+"("+s1+") "+colcon+",";
				else
					appendcol +=colname+" "+coltype+" "+colcon+",";	
				
			}
			int length=appendcol.length();
			String totalcol=appendcol.substring(0,length-1);
			String createquery=create+totalcol+")";
			//creation of table
			stmt1=con.createStatement();
			stmt1.executeUpdate(createquery);
			String que3="delete from savecolumndet";
			stmt2=con.createStatement();
			int res=stmt2.executeUpdate(que3);
			if(res!=0)
			rd1.forward(request,response);
			else
			rd.forward(request,response);
			out.flush();
			out.close();
			
		}
		catch (SQLException e)
		{
			this.deleteRows(con);
			System.out.print(e.getMessage());
			rd.forward(request,response);
		}
		catch (Exception e)
		{
			//System.out.print(e.getMessage());
			//rd.forward(request,response);
		}
		
	}
	private void deleteRows(Connection con1) {
		Statement stmt2=null;	
		String que3="delete from savecolumndet";
		try {
			stmt2  = con1.createStatement();
			stmt2.executeUpdate(que3);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
