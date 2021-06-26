package makecon;
import makecon.GetConnection;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.ejb.SessionContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SelectQuer extends HttpServlet 
{

	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		    RequestDispatcher rd=request.getRequestDispatcher("MyJsp.jsp");
		try {
			GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			stmt=conn.createStatement();
			
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			 HttpSession sc=request.getSession();
			 String que=(String)sc.getAttribute("tabname");
			 
		    String col[]=request.getParameterValues("columns");
		    String choi=request.getParameter("choice");
		    String order=request.getParameter("choice1");
			
			//String query="select "+col+" from "+que+" order by "+col+" "+choi;
		    String que1="select ";
		    for(int i=0;i<col.length;i++)
		    {
		    	que1 +=col[i]+",";
		    }
		    int n=que1.length();
		    String que2=que1.substring(0,n-1);
		    que2 +=" from "+que+" order by "+choi+" "+order;
			rs=stmt.executeQuery(que2);
			ResultSetMetaData rsmd=rs.getMetaData();
			 int count=rsmd.getColumnCount();
			
			
			out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out.println("  <BODY bgcolor='pink'>");
			out.println("<div align='right'><a href='Link.jsp'><u><b>LogOut</b></u></a></div><br>");
			 out.println("<center>");
			 out.println("<table border='2'>");
			 out.println("<tr>");
		     for(int i=1;i<=count;i++)
		     {
				 out.println("<td>"+rsmd.getColumnName(i)+"</td>");
		     }   
		     out.println("</tr>");
		 while(rs.next()){
			 out.println("<tr>");
			 for(int i=0; i<count; i++){
				 out.println("<td>" + rs.getObject(i+1) + "</td>");
			 }
			 out.println("</tr>");			 	 
		 }
		 out.println("</table>");
		 out.println("<a href='DisplayTable.jsp'><u>Back</u></a>");
		 out.println("</center>");
		 out.println("</BODY>");
		 out.println("</HTML>");
		 out.flush();
			out.close();
		}
			
		 catch (Exception e) 
		{
			rd.forward(request,response);
		}
	}

}
