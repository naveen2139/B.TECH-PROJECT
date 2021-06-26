<%@ page language="java" import="java.util.*,java.sql.*,makecon.GetConnection" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
      </head>
  
  <body>
  <%! Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	%>
	 <% GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			HttpSession sc=request.getSession();
			String table=(String)sc.getAttribute("tname");
			
			
			stmt=conn.createStatement();
			String key=request.getParameter("id");
			String que= "select * from "+table+" where rowid="+key;
			rs=stmt.executeQuery(que);
			ResultSetMetaData rsmd=rs.getMetaData();
			int count=rsmd.getColumnCount();
			int i=0;%>
			<form action="UpdateQuer1" target="frame2">
			<center>
			<table border="2">
			<tr><td>ROWID : </td><td><input type="text" name="rowid" value='<%=key%>'/></td></tr>
			<br>
			<%while(rs.next())
			{%>
			
			<%for(i=1;i<=count;i++)
			{%>
			  <tr><td><%=rsmd.getColumnName(i)%></td>
			  <td><input type="text" name='<%=rsmd.getColumnName(i)%>' value='<%=rs.getObject(i)%>'/></td>
			  <td></tr>
			<%}
			} %>
         </table>
         </center>
         </form>
  </body>
</html>


------------------------------

