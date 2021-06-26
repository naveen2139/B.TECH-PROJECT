<%@ page language="java" import="java.util.*,makecon.GetConnection,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
  </head>
  
  
<% Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;%>

	<%GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			stmt=conn.createStatement();
			String table=request.getParameter("tables");
			HttpSession sc=request.getSession();
			sc.setAttribute("tabname",table);
			String que="select * from "+table;
			rs=stmt.executeQuery(que);
			
			 ResultSetMetaData rsmd=rs.getMetaData();
			 int count=rsmd.getColumnCount();
			
			%>
			<body bgcolor="pink">
  <center>
    <form action="SelectQuer1" target="frame2" method="post">
    <div align="right"><a href="Logout.jsp"><u><b><font color="black">LogOut</font></b></u></a></div><br><br><br>
     <b>TABLE NAME:</b><b><%=table%></b><br><br>  
			<table border='2'>
			<tr>
		     <%for(int i=1;i<=count;i++) 
		     {%>
				 <td><%=rsmd.getColumnName(i)%></td>
		     <% }%>   
		    </tr>		 
		    <%while(rs.next()){ %>
			 <tr>
			 <%for(int i=0; i<count; i++)
			 { %>
				 <td><%=rs.getObject(i+1) %></td>
			 <%} %>
			 </tr>			 	 
		 <%} %>
	       </table>	<br><br> 
	       <table> 
			 <b>AVAILABLE COLUMNS:</b><select name="columns" multiple>
			<%for(int i=1;i<=count;i++)
			 { %>
			
              <option value=<%=rsmd.getColumnName(i)%>><%=rsmd.getColumnName(i)%></option>
			<% }%>
			
			 </select>
			 </table>	
			 <table>  
			 <b>ORDER BY:</b><select name="choice">
			<%for(int i=1;i<=count;i++)
			 { %>
			
              <option value=<%=rsmd.getColumnName(i)%>><%=rsmd.getColumnName(i)%></option>
			<% }%>
			
			 </select></table>
			
			 <br><br>
			<input type="radio" name="choice1" value="asc" checked="checked"/>ASCENDING
			<input type="radio" name="choice1" value="desc"/>DESCENDING<br><br>
		
			  <input type="submit" value="Submit"/><br><br>
    
    <a href="DisplayTable.jsp"><u><b><font color="black">Back</font></b></u></a>
    </form>
    </center>
   
			</body>
			</html>
			
			
			
			
			
			
			
			
			
			