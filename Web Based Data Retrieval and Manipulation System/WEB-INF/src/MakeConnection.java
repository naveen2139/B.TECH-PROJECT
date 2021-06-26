package makecon;
import java.sql.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MakeConnection extends HttpServlet
{
	Connection con=null;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
{
		
		try {
			response.setContentType("text/html");
			PrintWriter out = response.getWriter();
			RequestDispatcher rd1=request.getRequestDispatcher("ConnFailure.jsp");
			RequestDispatcher rd=request.getRequestDispatcher("Link.jsp");
			String name=request.getParameter("dbname");
			String comname=request.getParameter("compname");
			String sidname=request.getParameter("sid");
			String users=request.getParameter("user");
			String pass=request.getParameter("password");
			//String url="jdbc:oracle:thin:@newmm9:1521:orcl";
 			if(name.equals("oracle"))
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
			    con=DriverManager.getConnection("jdbc:oracle:thin:"+comname+":1521:"+sidname,users,pass);
			    if(con!=null)
			    {
			    	request.getSession().setAttribute("comname1",comname);
			    	request.getSession().setAttribute("sidname1",sidname);
			    	request.getSession().setAttribute("users1",users);
			    	request.getSession().setAttribute("pass1",pass);
			    }
			    rd.forward(request,response);
			}
			rd1.forward(request,response);
			out.flush();
			out.close();
		}/* catch (ClassNotFoundException e) {
			
			e.printStackTrace();
		}*/ catch (Exception e) {
			
			//e.printStackTrace();
		}
	}
}
