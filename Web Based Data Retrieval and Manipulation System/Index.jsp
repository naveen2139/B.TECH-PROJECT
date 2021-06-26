<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <frameset rows="25%,*">
  
  <frame src="Title.jsp" name="frame1"/>
  <frameset>
 
  <frame src="DBDetails.jsp" name="frame2"/>
 
  </frameset>
  
  </frameset>
  </html>

  
   