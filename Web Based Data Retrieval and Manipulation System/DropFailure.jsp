<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

  <body>
  <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
    <b>unknown command beginning "delet from..." - rest of line ignored.</b> <br>
    <b>                              (or)</b>
    <b>Table does not exist</b>
    <a href="SelectOperation.jsp"><u><b>Back</b></u></a><br>
  </body>
</html>
