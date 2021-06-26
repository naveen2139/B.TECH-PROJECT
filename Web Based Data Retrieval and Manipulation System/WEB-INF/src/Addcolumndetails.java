package makecon;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import makecon.GetConnection;
import DTO.AddColoumnDetails;

public class Addcolumndetails extends HttpServlet 
{
    int sz=0;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{

		
	   String colname=request.getParameter("col1");
	   String cols=request.getParameter("columns");
	   String size1=request.getParameter("size");	
	  if(size1.equalsIgnoreCase("nosize")){
		  sz=0;
	  } else{
	   sz = Integer.parseInt(size1);
	  }
 	   String constr=request.getParameter("constraint");
	   
	   //insert the new coloumn details in the database  savecolumndet
	   
	   
	   try {
		   
		   //db connection
		   GetConnection gc = new GetConnection();  
		   Connection con = gc.getConncetion(request,response);
		   PreparedStatement ps =null;
		   String insert   =  "insert into savecolumndet values(?,?,?,?)";
		   ps = con.prepareStatement(insert);
		   ps.setString(1,colname);
		   ps.setString(2,cols);
		  if(!(cols.equalsIgnoreCase("Date"))){
			  ps.setInt(3,sz);
		   } else {
			   ps.setInt(3,sz);
		   }
		   ps.setString(4,constr);
		   ps.executeUpdate();
		   
		   
	
		   
	//get the coloumn detyails from savecolumndet
		Collection coldet = new ArrayList();   
		PreparedStatement pss  = null;
		ResultSet rs   = null;
		String select   = "select * from savecolumndet";
		pss  = con.prepareStatement(select);
		rs  = pss.executeQuery();
		while(rs.next()){
			AddColoumnDetails adc  = new AddColoumnDetails();	
			adc.setColname(rs.getString("colname"));
			adc.setDatatype(rs.getString("coltype"));
			adc.setColsize(rs.getInt("colsize"));
			adc.setConstr(rs.getString("colcons"));
			coldet.add(adc);
			
		}
		
		//keep the coloumn details in session scope for future purpose
		request.getSession().setAttribute("coldet",coldet);
		RequestDispatcher rd=request.getRequestDispatcher("CheckTableName.jsp");
		rd.forward(request,response);
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
	   } catch (Exception e) {
			
			System.out.print(e.getMessage());
		}
	}

}
