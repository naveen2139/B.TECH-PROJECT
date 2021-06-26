<%@page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:directive.page import="makecon.GetConnection,DTO.AddColoumnDetails"/>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  
  <head>
  <script type="text/javascript">
  function Validate_required(field,alerttxt)
  {
   with (field)
    {
     if (value==null||value=="")
     {
      alert(alerttxt);return false;
     }
     else
     {
      return true;
     }
   }
  }
  function Validate_form(thisform)
  {
    with (thisform)
    {
    if (Validate_required(tablename,"Table Name must be filled out!")==false)
      {
        tablename.focus();return false;
      }
    }
 }
  
  function addclmdetails()
  {
  
 
    document.createform.action="./Addcolumndetails1";
    document.createform.submit();
  }
  </script>
  </head>    
<body bgColor="blanchedalmond" topMargin="0">
<center>
    <form name="create">
      
      </form> 
    <form name="my form" action="AvailableTable.jsp" onsubmit="return Validate_form(this)">
    
    <div align="right"><a href="Logout.jsp"><u><b><font color="black">LogOut</font></b></u></a></div><br><br><br>
    <%String result=(String)request.getAttribute("ok");
    if(result==null)
    result="";%>
    <b>EnterTableName:</b><input type="text" name="tablename"><%=result %>
    
    <br><br>
   <input type="submit" value="CHECK AVAILABLITY"/>
    </form>
    <% 
    //get the previous coloumn details from session scope
    Collection coldet =(Collection)request.getSession().getAttribute("coldet");
   if(coldet!=null){ %>
   
   <table border="2">
   <tr><td><b>ColName</b></td><td><b>ColType</b></td><td><b>ColSize</b></td><td><b>Constr</b></td></tr>
   
   <%
  for(Iterator it =coldet.iterator();it.hasNext(); ){
   AddColoumnDetails acd = (AddColoumnDetails)it.next();
   String name  = acd.getColname();
   String coltype   = acd.getDatatype();
   int colsize    = acd.getColsize();
   String constr  = acd.getConstr();
   
   %>
   <tr><td><%=name %></td><td><%=coltype %></td><td><%=colsize %></td><td><%=constr %></td></tr>
    <%}//close for loop
    }//close if stmt%>
    </table>
    <form name="createform" action="CreateTable1" method="post">
   <br><br><b>COLUMN NAME :</b><input type="text" name="col1"/><br><br>
    <b>TYPE :</b><select name="columns" >
    <option value="varchar2" >VARCHAR2</option>
    <option value="number" >NUMBER</option>
    <option value="date" >DATE</option>
    </select>
    <b>SIZE :</b><select name="size">
    <option value="nosize" >0</option>
    <option value="5" >5</option>
    <option value="10" >10</option>
    <option value="15" >15</option>
    <option value="20" >20</option>
    <option value="25" >25</option>
    <option value="30" >30</option>
    <option value="35" >35</option>
    <option value="40" >40</option>
    <option value="45" >45</option>
    <option value="50" >50</option>
    </select>
    <b>CONSTRAINT :</b><select name="constraint" >
    <option value="primary key" >PRIMARY KEY</option>
    <option value="not null" >NOT NULL</option>
    
    </select><BR><BR>
    <input type="submit" value="AddColumn" onclick="addclmdetails()"/><br><br>
 
  <input type="submit" value="Create"><br><br>
   <a href="SelectOperation.jsp"><b><u><font color="black">Back</font></u></b></a>
    </form>
    </center>
  </body>
</html>
