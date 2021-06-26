<%@ page language="java" import="java.sql.*,makecon.GetConnection" pageEncoding="ISO-8859-1"%>
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
			String que="select * from tab";
			rs=stmt.executeQuery(que);
			ResultSetMetaData rsmd=rs.getMetaData();
			 int count=rsmd.getColumnCount();
			
			%>
			<body bgcolor="pink">
  <center>
    <form action="DisplayTable1.jsp" target="frame2">
    <div align="right"><a href="Logout.jsp"><u><b><font color="black">LogOut</font></b></u></a></div><br><br><br>
    
  
			<center>
			 <b>CHOOSE YOUR TABLE :</b><select name='tables'>
			<% while(rs.next())
			 { %>
			
              <option value='<%=rs.getString(1)%>'><%=rs.getString(1)%></option>
			<% }%>
			 </select><br><br>
			 
			 		</center>
			  <input type="submit" value="Submit"/><br><br>
    
    <a href="SelectOperation.jsp"><u><b><font color="black">Back</font></b></u></a>
    </form>
    </center>
   
			</body>
			</html>
			
			
			
			
			
			
			
			
			
			