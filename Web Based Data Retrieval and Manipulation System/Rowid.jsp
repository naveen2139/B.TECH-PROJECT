<%@ page language="java" import="java.util.*,java.sql.*,makecon.GetConnection" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    
  <body bgcolor="skyblue">
  
  <%! Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	Statement stmt1=null;
	ResultSet rs1=null;
	
	%>

	        <% GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			stmt=conn.createStatement();
			
			String table=request.getParameter("tables");
			String que="select * from "+table;
			String que1="select rowid from "+table;
			stmt1=conn.createStatement();
			
			rs=stmt.executeQuery(que);
			rs1=stmt1.executeQuery(que1);
			ResultSetMetaData rsmd=rs.getMetaData();
			int count=rsmd.getColumnCount();
			HttpSession sc=request.getSession();
			sc.setAttribute("tname",table);
			
			
			%>
			<form action="UpdateQuer1" method="post" target="frame2">
			<div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
			
    			
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
		
		   	
			 <table border='2'>
			 <tr>
			 <% for(int i=1;i<=count;i++)
		     {%>
				 <td><%=rsmd.getColumnName(i)%></td>
		     <%}%>
		     
		     <td><center></center></td>
		     <td><center>Button</center></td>
		     <td><center>STATUS</center></td>
		     </tr>
		     <%int i=1;   
		     %>   
		 <%
		  int j=0;
		  String s=null;
		 while(rs.next() && rs1.next())
		
		 {
		 j++;%>
		         
			 <tr>
			 <%for(i=1; i<=count; i++){
			 s=rsmd.getColumnName(i)+j;		 
			 
			 %>
			       
                 <td><input type="text" value='<%=rs.getObject(i)%>' name='<%=s%>'/></td>
                
				 
			 <%
			 
			 }%>
			 
			  <td><input type="hidden" value='<%=rs1.getString(1)%>'></td><td><input type="submit" value="Update"/></td>
			  <td><input type="radio" name="check" value='<%=rs1.getString(1)%>'/></td>
			 <%
			  } %>
			 </tr>			 	 
	
		 </table>
            	 
		 		 <a href='SelectOperation.jsp'><u><b>Back</b></u></a>
		
	</center>
	</form>	
			</body>
			</html>
