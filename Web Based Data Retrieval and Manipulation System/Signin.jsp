 <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HEAD>

<SCRIPT LANGUAGE="JavaScript">
<!-- Original:  Russ Swift (rswift220@yahoo.com) -->

<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->


function validate_required(field,alerttxt)
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

function validatePwd() {
var invalid = " "; // Invalid character is a space
var minLength = 6; // Minimum length
var pw1 = document.Signin.pass.value;

// check for a value in both fields.
// check for minimum length
if (document.Signin.pass.value.length < minLength) {
alert('Your password must be at least ' + minLength + ' characters long. Try again.');
return false;
}
// check for spaces
  if (document.Signin.pass.value.indexOf(invalid) > -1) 
  {
     alert("Sorry, spaces are not allowed.");
     return false;
  }
}
function validate_form(thisform)
{
with (thisform)
  {
    if (validate_required(uname,"username must be filled out!")==false)
      {
        uname.focus();return false;
      }
      if (validatePwd()==false)
      {
        pass.focus();return false;
      }
   }
}



</script>

</HEAD>



<BODY bgcolor="CCCC33">
<div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
<marquee><h3><b><font color="CC0066">Sign In</font></b></h3></marquee><br>

<center>
<form name="Signin" action="LoginPerson1" method="post" onSubmit="return validate_form(this)" target="frame2">

<table border="2">
<tr><td>User Name :</td><td><input type="text" name="uname" maxlength="12"></td></tr>

<tr><td>Password:</td><td><input type="password" name="pass" maxlength="20"></td></tr>

<tr><td></td><td ><center><input type="submit" value="Submit">
<input type="reset" value="Clear"></center></td></tr></table>

</form>
</center>
</BODY>
