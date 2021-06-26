<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
             document.Student.action="./SelectTable.jsp";
             document.Student.submit();
         }
         if(type=='update')
         {
             document.Student.action="./SelectTable.jsp";
             document.Student.submit();
         }
		  if(type=='delete') 
         {
             document.Student.action="./SelectTable.jsp";
             document.Student.submit();
         }
         if(type=='select') 
         {
             document.Student.action="./DisplayTable.jsp";
             document.Student.submit();
         }
         if(type=='drop') 
         {
             document.Student.action="./SelectTable.jsp";
             document.Student.submit();
         }
         if(type=='create') 
         {
             document.Student.action="./CheckTableName.jsp";
             document.Student.submit();
         }
     }
</script>
	
  </head>
  
  <body bgcolor="pink">
  <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
    
	<center>
	<form  name="Student" action="" method="post">
	
	<U><font color="black"><b>CONNECTED TO ORACLE</b></font></U><br><br>
	<table border="2"><th><b><font color="black">Select Operation</font></b></th><tr><td><br>
    <center><input type=button value="InsertTable" onClick="check('insert')"/>
    <input type=button value="UpdateTable" onClick="check('update')"/><br><br>
    <input type=button value="DeleteTable" onClick="check('delete')"/>
    <input type=button value="SelectTable" onClick="check('select')"/><br><br>
	<input type=button value="DropTable" onClick="check('drop')"/>
	<input type=button value="CreateTable" onClick="check('create')"/><br><br>
		</center></td></tr></table>
		<a href="Dbnames.jsp"><u><b><font color="black"><b>Back</b></font> </b></u></a>
		</form></center>
    
	</body>
</html>
