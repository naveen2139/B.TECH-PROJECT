<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body bgcolor="blanchedalmond">
  <center>
  <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
  <b>
  <h4>
  <font color="#FF00FF">	
  
    DELETED THE SELECTED TABLE SUCCESSFULLY</font>
    </h4>
    </b>
   <a href='SelectOperation.jsp'><u><b>Back</b></u></a>
   </center>
    </body>
  </html>
