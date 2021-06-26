<%@ page language="java" import="java.util.*,java.sql.*,makecon.GetConnection" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  <body bgcolor="skyblue">
  
  <%! Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;%>

	        <% GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			stmt=conn.createStatement();
			
			String table=request.getParameter("tables");
			String que="select * from "+table;
			
			rs=stmt.executeQuery(que);
			ResultSetMetaData rsmd=rs.getMetaData();
			int count=rsmd.getColumnCount();
			
			HttpSession sc=request.getSession();
			sc.setAttribute("tname",table);
			%>
			
			<form action="InsertQuer1" target="frame2" method="post">
			<div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
			<center><u><b>ENTER THE TABLE VALUES HERE</b></u><br>
			
			<table border="2">
			<% String dates=null; %>
			<% for(int i=1;i<=count;i++)
			{
              dates=rsmd.getColumnTypeName(i);			
 			%>
			<tr><td><%=rsmd.getColumnName(i)%></td><td><input type="text" name='<%=rsmd.getColumnName(i)%>'/>
			<% if(dates.equalsIgnoreCase("date")){%>
			   <b>(yyyy-MM-dd)</b>	</td></tr>	 
		
			<%}}%>
			</table><br>
            <input type="submit" value="Send"/>
            <input type="reset" value="Clear"/></center>
            </form>
		    <center>
		    <%=table%>
			<table border='2'>
			<tr><td>ColumnName</td><td>ColumnTypeName</td></tr>
			<% 
			for(int i=1;i<=count;i++)
			{%>
		    <tr><td> <%=rsmd.getColumnName(i)%></td><td><%=rsmd.getColumnTypeName(i)%></td></tr>
			<% }%>
			</table><br>
			<a href="SelectOperation.jsp"><u><b>Back</b></u></a><br>
			
			</center>
			
			</body>
			</html>
