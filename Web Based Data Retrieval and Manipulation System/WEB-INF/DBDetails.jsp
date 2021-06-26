<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <body>
    <form name="DbDetails" action="MakeConnection1" method="get">
    <center>
    <table border="2">
    <tr><td><b>DB NAME :</b></td><td><input type="text" name="dbname"/></td></tr>
    <tr><td><b>COMPUTER NAME :</b></td><td><input type="text" name="compname"/></td></tr>
    <tr><td><b>SID :</b></td><td><input type="text" name="sid"/></td></tr>
    <tr><td><b>USER : </b></td><td><input type="text" name="user"/></td></tr>
    <tr><td><b>PASSWORD :</b></td><td><input type="password" name="password"/></td></tr>
    <tr><td><input type="submit" name="submit"/>
            <input type="reset" value="Clear"/></td></tr>
    </table>
    </center>
    </form>
  </body>
</html>
