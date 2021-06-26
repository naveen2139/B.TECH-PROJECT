package makecon;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import makecon.GetConnection;
public class RegisterPerson extends HttpServlet 
{
    Connection conn;
    Statement stmt;
    ResultSet rs;
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
	   throws ServletException, IOException 
	 {

		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			
			GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			RequestDispatcher rd=request.getRequestDispatcher("Signin.jsp");
			//RequestDispatcher rd1=request.getRequestDispatcher("RegisterPerson.jsp");
			
			int no=Integer.parseInt(request.getParameter("userno"));
			String name=request.getParameter("username");
			String pword=request.getParameter("password");
			String email=request.getParameter("email");
			String address=request.getParameter("address");
			String gender=request.getParameter("sex");
			String cellno=request.getParameter("cell");
		
			String cityname=request.getParameter("city");
			
			stmt=conn.createStatement();
			String que="insert into RegisterDetails values("+no+",'"+name+"','"+pword+"','"+email+"','"+address+"','"+gender+"','"+cellno+"','"+cityname+"')";           
			rs=stmt.executeQuery(que);
			
			rd.forward(request,response);
			out.flush();
			out.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }

}

