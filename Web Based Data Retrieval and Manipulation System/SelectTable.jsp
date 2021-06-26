<%@ page language="java" import="java.util.*,makecon.GetConnection,java.sql.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
  
  <head>
    
	
	<script language = "JavaScript">
	
	function check(type)
	{
 
       if(type=='insert')  
         {
             document.Student.action="./InsertDetails.jsp";
             document.Student.submit();
         }
         if(type=='update')
         {
             document.Student.action="./Rowid.jsp";
             document.Student.submit();
         }
		  if(type=='delete') 
         {
             document.Student.action="./DeleteChoice.jsp";
             document.Student.submit();
         }
         if(type=='select') 
         {
             document.Student.action="./DisplayTable.jsp";
             document.Student.submit();
         }
         if(type=='drop') 
         {
             document.Student.action="./DropTableQuer1";
             document.Student.submit();
         }
     }
</script>
	</head>
   
    <%! Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;%>

	<%GetConnection con1=new GetConnection();
			conn=con1.getConncetion(request,response);
			stmt=conn.createStatement();
			
			String que="select * from tab";
			rs=stmt.executeQuery(que);
			
			%>
			<body bgcolor="pink">
			<div align="right"><a href="Logout.jsp"><u><b><font color="black">LogOut</font></b></u></a></div><br><br><br>
			<center>
			<form name="Student" action="" method="post" target="frame2">
    
			 <b>CHOOSE YOUR TABLE :</b><select name='tables'>
			<% while(rs.next())
			 { %>
			
              <option value=<%=rs.getString(1)%>><%=rs.getString(1)%></option>
			<% }%>
			
			</select>
			<br><br>
		
			<input type="submit" value="Insert" onClick="check('insert')"/>
			<input type="submit" value="Update" onClick="check('update')"/>
			<input type="submit" value="Delete" onClick="check('delete')"/>
			<input type="submit" value="Drop" onClick="check('drop')"/><br><br>
			<a href="SelectOperation.jsp"><u><b><font color="black">Back</font></b></u></a>
			</form>
			</center>
			
  </body>
</html>
