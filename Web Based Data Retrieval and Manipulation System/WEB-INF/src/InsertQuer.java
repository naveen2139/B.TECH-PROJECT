package makecon;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;

import makecon.GetConnection; 
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class InsertQuer extends HttpServlet 
{
	Connection conn=null;
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		    RequestDispatcher rd1=request.getRequestDispatcher("TableCreateExcep.jsp");   
			try{
				RequestDispatcher rd=request.getRequestDispatcher("InsertedSucc.jsp");
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				GetConnection con1=new GetConnection();
				conn=con1.getConncetion(request,response);
			    //getting the table name by using session object
				HttpSession sc=request.getSession();
				String table=(String)sc.getAttribute("tname");
				
				String abc="?,";
				String abc1="?";
				
				
				String que="select * from "+table;
				String query="insert into "+table+" values(";
				stmt=conn.createStatement();
                rs=stmt.executeQuery(que);
			    ResultSetMetaData rsmd=rs.getMetaData();
			    int count=rsmd.getColumnCount();
			    
			     for(int i=1;i<=count;i++)
			    {
			    	if(i<count)
			    	query +=abc;
			    	else
			    	query +=abc1;	
	            }
			    query +=")";
			   
			    pstmt=conn.prepareStatement(query);
			    String dates=null;
   			    for(int i=1;i<=count;i++)
			    {
			    	 dates=rsmd.getColumnTypeName(i);
			         String colname = rsmd.getColumnName(i);
			    	 String name   = request.getParameter(colname);
			    	 if(dates.equalsIgnoreCase("Date"))
			    	 {
			    		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    	     java.sql.Date sqldate= new java.sql.Date(sdf.parse(name).getTime());
                         pstmt.setDate(i,sqldate);	    	 
			    	 }
			    	 else
			    	 {
 			    	 pstmt.setObject(i,name);
			    	 }
			    }
			    int n=pstmt.executeUpdate();
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
		}
	}

}










/*package makecon;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import makecon.GetConnection; 
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

public class InsertQuer extends HttpServlet 
{
	Connection conn=null;
	Statement stmt=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
			try{
				RequestDispatcher rd=request.getRequestDispatcher("InsertedSucc.jsp");
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				GetConnection con1=new GetConnection();
				conn=con1.getConncetion();
			    //getting the table name by using session object
				HttpSession sc=request.getSession();
				String table=(String)sc.getAttribute("tname");
				
				String abc="?,";
				String abc1="?";
				
				
				String que="select * from "+table;
				String query="insert into "+table+" values(";
				stmt=conn.createStatement();
                rs=stmt.executeQuery(que);
			    ResultSetMetaData rsmd=rs.getMetaData();
			    int count=rsmd.getColumnCount();
			    
			     for(int i=1;i<=count;i++)
			    {
			    	if(i<count)
			    	query +=abc;
			    	else
			    	query +=abc1;	
	            }
			    query +=")";
			   
			    pstmt=conn.prepareStatement(query);
			    for(int i=1;i<=count;i++)
			    {
			         String colname = rsmd.getColumnName(i);
			         
			    	 String name   = request.getParameter(colname);
			    	 pstmt.setObject(i,name);
			    }
			    int n=pstmt.executeUpdate();
				if(n!=0)
				rd.forward(request,response);
				out.flush();
		        out.close();
			}
	 catch (SQLException e) 
		{	
			System.out.print(e.getMessage());
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}

}*/
