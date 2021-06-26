<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <body bgcolor="pink"><center>
  
  <form name="Dbnames" action="SelectDB1" method="post" target="frame2">
  <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
  <table border="2"><tr><td>
  <input type="radio" name="db" value="oracle" checked="checked"><b>Oracle</b><br><br>

 
    
  <input type="submit" value="Select Db"><br><br></td></tr>
  
    </table>
    <a href="Signin.jsp"><u><font color="black"><b>Back</b></font></u></a>
     </form>

  </center>
  </body>
  </html>
  