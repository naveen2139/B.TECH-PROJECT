<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>RegisterSucc.jsp</title>
	
    
  </head>
  
  <body bgcolor="pink">
  <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
  <font color="oo3333" size="5"> Successfully u have registered.U can login now.</font><br><br>
   <a href="Signin.jsp" target="frame4">Back</a>
  </body>
</html>


 
