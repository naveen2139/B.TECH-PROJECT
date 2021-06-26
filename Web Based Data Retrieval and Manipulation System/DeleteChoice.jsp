<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <% String name=(String)request.getParameter("tables");
     request.getSession().setAttribute("tablename",name);
     
   %>
  <body bgcolor="pink">
  <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
  <center><br><br><br>
    <form name="DeleteChoice" action="DeleteDetails.jsp" target="frame2">
       <input type="submit" value="DeleteSingleRow"/>   
    </form>
    <form name="DeleteChoice1" action="DeleteAllRows1" method="post" target="frame2">
       <input type="submit" value="DeleteAllRows"/><br><br>
       <a href="SelectOperation.jsp"><u>Back</u></a>
    </form>
    </center>
  </body>
</html>
