<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  
  <body>
    <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
    <center><h3><font color="green">Data Inserted Successfully</font></h3> <br>
    <a href="SelectOperation.jsp"><u>Back</u></a></center>
  </body>
</html>
