<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    
  <body bgcolor="pink">
  <div align="right"><a href="Logout.jsp"><u><b><font color="black">LogOut</font></b></u></a></div><br><br><br>
  <center>
    <b>Select any option in OrderBy</b> <br><br>
    <a href="DisplayTable.jsp"><font color="black"><u><b>Back</b></u></font></a>
  </center>
  </body>
</html>
