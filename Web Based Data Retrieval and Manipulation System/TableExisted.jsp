<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  
  <body bgcolor="cream">
  <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
  <center>
    <b>SORRY TABLE ALREADY EXISTED</b>
    </center><br><br>
    <a href="CheckTableName.jsp"><b><u>Back</u></b></a>
  </body>
</html>
