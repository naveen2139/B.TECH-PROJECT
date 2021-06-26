package makecon;

import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;

import makecon.GetConnection; 
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import constants.StringVerify;

import sun.text.CompactShortArray.Iterator;

public class UpdateQuer extends HttpServlet 
{
	Connection conn=null;
	Statement stmt1=null;
	PreparedStatement stmt2=null;
	ResultSet rs1=null;
	ResultSet rs2=null;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		       RequestDispatcher rd1=request.getRequestDispatcher("UpdateFailure.jsp");
			try{
				RequestDispatcher rd=request.getRequestDispatcher("InsertedSucc.jsp");
				response.setContentType("text/html");
				PrintWriter out = response.getWriter();
				GetConnection con1=new GetConnection();
				conn=con1.getConncetion(request,response);
				
				HttpSession sc=request.getSession();
				String table=(String)sc.getAttribute("tname");
				
				String que="select * from "+table;
				stmt1=conn.createStatement();
                rs1=stmt1.executeQuery(que);
                String[] values=null;
                
                ResultSetMetaData rsmd=rs1.getMetaData();
			    int count=rsmd.getColumnCount();
			    int[] x = {0,0,0,0,0};
			    java.sql.Date sqldate[] = new Date[5];
			    String query="update "+table+" set ";
			    String[] name=new String[100];
			    String colname=null;
			    String colname1=null;
			    String selradio=null;
			    String dates=null;
			    int t=1;
			    int m=0;
			    StringVerify sf  = new  StringVerify();
			    for(int i=1;i<=count;i++)
			    { 
			    	 dates=rsmd.getColumnTypeName(i);
 			    	 selradio=request.getParameter("check");
			    char c =selradio.charAt(selradio.length()-1);
			    
			   int j= sf.Rows(c);
			    
 			    	colname = rsmd.getColumnName(i);
			         colname1=colname;
 			         colname +=j;
			     	 if(dates.equalsIgnoreCase("Date"))
			    	 {
 			    		 x[m]=i;
 			    		name[i] = request.getParameter(colname); 
 			    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			    	     sqldate[i]= new java.sql.Date(sdf.parse(name[i]).getTime());
			    	     //stmt2.setDate(i,sqldate);
			    	     name[i]=sqldate.toString();
			    	 query +=colname1+"=?";
			    	 m++;
			    	 }
			    	 else
			    	 {
			    		name[i] = request.getParameter(colname);
				    	query +=colname1+"=?";
			    	 }
			    	 query=query+",";
			    	 t++;
			    }
			    name[t]=selradio;
			    int n=query.length();
			   
 			    query=query.substring(0,(n-1));
			   
   			    query +=" where rowid=?";
			    //out.println(query);
			    stmt2=conn.prepareStatement(query);
			    
			    //retreive the values from al object
			/*    int z=1;
 			    for(Iterator i =al.iterator();i.hasNext();){
			    Object name = (Object)i.next();	
			    stmt2.setObject(z,name);
			    z++;
			    }*/
			    for(int k=1,n1=0;k<=(count+1);k++)
			    {
 			    	if(k==x[n1])
 			    	{
 			    		stmt2.setDate(k, sqldate[k]);
 			    		n1++;
 			    	}
 			    	else
 			    	{
			      stmt2.setObject(k,name[k]);
 			    	}
			    }
			    stmt2.executeUpdate();
				rd.forward(request,response);
				out.flush();
		        out.close();
			}
			 catch (SQLException e) 
		{	
				 rd1.forward(request,response);
            //System.out.print(e.getMessage());
		}
		catch (Exception e) 
		{
			//e.printStackTrace();
			rd1.forward(request,response);
		}
	}

}
