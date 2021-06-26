package makecon;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;

import makecon.GetConnection; 
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DeleteQuer extends HttpServlet 
{
	Connection conn=null;
	PreparedStatement stmt=null;
	Statement stm=null;
	ResultSet rs=null;

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
				String table=(String)sc.getAttribute("table1");
				
				String que1="select * from "+table;
				stm=conn.createStatement();
				rs=stm.executeQuery(que1);
				ResultSetMetaData rsmd=rs.getMetaData();
				
				String col=rsmd.getColumnName(1);
				String sqldate=rsmd.getColumnTypeName(1);
				java.sql.Date sqldate1=null;
				int k=0;
				String que=null;
				
				if(sqldate.equalsIgnoreCase("date"))
				{
					 que=request.getParameter("colu");
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		    	    sqldate1= new java.sql.Date(sdf.parse(que).getTime());
		    	    k=1;	
				}
				else
				{
					 que=request.getParameter("colu");	
				}
				
				
				String query="delete from "+table+" where "+col+"=";
				query +="?";
				stmt=conn.prepareStatement(query);
				if(k==1)
				{
                stmt.setDate(1,sqldate1);
				}
				else
				{
				  	stmt.setObject(1,que);
				}
			    int n=stmt.executeUpdate();
				if(n!=0)
				rd.forward(request,response);
				else
					rd1.forward(request,response);
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
