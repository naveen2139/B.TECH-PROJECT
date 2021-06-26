<%@ page language="java" import="java.util.*,java.sql.*,makecon.GetConnection" pageEncoding="ISO-8859-1"%>
<html>

  <body bgcolor="skyblue">&nbsp; 
   
  <%! Connection conn=null; 
	Statement stmt=null; 
	ResultSet rs=null;%>

	        <% 
	        
	        GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			stmt=conn.createStatement();
			
			
			
			String table=(String)request.getSession().getAttribute("tablename");
			
		   request.getSession().setAttribute("table1",table);
			String que="select * from "+table;
			
			rs=stmt.executeQuery(que);
			ResultSetMetaData rsmd=rs.getMetaData();
			int count=rsmd.getColumnCount();
			%>
			<form  name="delete" action="DeleteQuer1" target="frame2" method="post">
			<center>
			<div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
			<u><b>ENTER THE COLUMN VALUE HERE</b></u><br>
			
			<table border="2">
				<% String dates=null; %>
			<% for(int i=1;i<=1;i++)
			{
			  dates=rsmd.getColumnTypeName(i);
			%>
			<tr><td><%=rsmd.getColumnName(i)%></td><td><input type="text" name="colu" />
			<% if(dates.equalsIgnoreCase("date")){%>
			   <b>(yyyy-MM-dd)</b></td></tr>
			<%} }%>
			</table><br>
           
            <input type="submit" value="Delete"/><br><br>
			 <%=table%>
			<table border='2'>
			<tr><td>ColumnName</td><td>ColumnTypeName</td></tr>
			<% 
			for(int i=1;i<=count;i++)
			{%>
		    <tr><td> <%=rsmd.getColumnName(i)%></td><td><%=rsmd.getColumnTypeName(i)%></td></tr>
			<% }%>
			</table><br>
			
			 <table border='2'>
			 <tr>
		     <% for(int i=1;i<=count;i++)
		     {%>
				 <td><%=rsmd.getColumnName(i)%></td>
			 <%}
		    
		     int i;%>
		    </tr>
		 <%while(rs.next()){%>
			 <tr>
			 <%for(i=0; i<count; i++){%>
				 <td><%=rs.getObject(i+1)%></td>
			 <%}%>
			</tr>
		 <%}%>
		 </table><BR>
         <input type="reset" value="Clear"/><br><br>
         <a href="DeleteChoice.jsp"><u>Back</u></a>
		 </center>
			</form>
		
			</body>
			</html>
