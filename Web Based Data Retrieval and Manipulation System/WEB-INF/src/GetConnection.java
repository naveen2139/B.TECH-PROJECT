package makecon;
import java.sql.*;
import makecon.MakeConnection;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetConnection 
{
    Connection con;
    public Connection getConncetion(HttpServletRequest request,HttpServletResponse response)
                                                          throws Exception
    { 
     
    	  String cname=(String)request.getSession().getAttribute("comname1");
		  String sidnames=(String)request.getSession().getAttribute("sidname1");
		  String username=(String)request.getSession().getAttribute("users1");
		  String password=(String)request.getSession().getAttribute("pass1");
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  con=DriverManager.getConnection("jdbc:oracle:thin:"+cname+":1521:"+sidnames,username,password);	
		  return con;
    }
}
		
		
	
 
		

	
    
	