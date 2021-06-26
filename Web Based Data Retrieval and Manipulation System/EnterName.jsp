<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <body bgcolor="pink">
  <div align="right"><a href="Sign.jsp"><u><b>LogOut</b></u></a></div><br><br>
  <center><br><br>
    <b>PLEASE ENTER THE TABLE NAME</b><br><br>
    <a href="CheckTableName.jsp"><u><b>Back</b></u></a>
  </center>
  </body>
</html>
