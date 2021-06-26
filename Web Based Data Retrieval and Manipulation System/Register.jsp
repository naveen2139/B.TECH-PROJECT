<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

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


function Validate_Pwd() {
var invalid = " "; // Invalid character is a space
var minLength = 6; // Minimum length
var pw1 = document.Register.password.value;
var pw2 = document.Register.password1.value;
// check for a value in both fields.
if (pw1 == '' || pw2 == '') {
alert('Please enter your password twice.');
return false;
}
// check for minimum length
if (document.Register.password.value.length < minLength) {
alert('Your password must be at least ' + minLength + ' characters long. Try again.');
return false;
}
// check for spaces
  if (document.Register.password.value.indexOf(invalid) > -1) 
  {
     alert("Sorry, spaces are not allowed.");
     return false;
  }
 else 
 {  
    if (pw1 != pw2) 
    {
      alert ("You did not enter the same new password twice. Please re-enter your password.");
      return false;
    }
  
 }
 function stripCharsInBag(s, bag)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}
 
}
function Validate_email(field,alerttxt)
{
with (field)
  {
  apos=value.indexOf("@");
  dotpos=value.lastIndexOf(".");
  if (apos<1||dotpos-apos<2)
    {alert(alerttxt);return false;}
  else {return true;}
  }
}

// Declaring required variables
var digits = "0123456789";
// non-digit characters which are allowed in phone numbers
var phoneNumberDelimiters = "()- ";
// characters which are allowed in international phone numbers
// (a leading + is OK)
var validWorldPhoneChars = phoneNumberDelimiters + "+";
// Minimum no of digits in an international phone no.
var minDigitsInIPhoneNumber = 10;

function isInteger(s)
{   var i;
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}
function trim(s)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not a whitespace, append to returnString.
	
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (c != " ") returnString += c;
    }
    return returnString;
}
function stripCharsInBag(s, bag)
{   var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++)
    {   
        // Check that current character isn't whitespace.
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function checkInternationalPhone(strPhone){
var bracket=3
strPhone=trim(strPhone)
if(strPhone.indexOf("+")>1) return false
if(strPhone.indexOf("-")!=-1)bracket=bracket+1
if(strPhone.indexOf("(")!=-1 && strPhone.indexOf("(")>bracket)return false
var brchr=strPhone.indexOf("(")
if(strPhone.indexOf("(")!=-1 && strPhone.charAt(brchr+2)!=")")return false
if(strPhone.indexOf("(")==-1 && strPhone.indexOf(")")!=-1)return false
s=stripCharsInBag(strPhone,validWorldPhoneChars);
return (isInteger(s) && s.length >= minDigitsInIPhoneNumber);
}

function Validate_Phone(field,alerttxt){
	var Phone=document.Register.cell
	var invalid = " "; 
	
	if ((Phone.value==null)||(Phone.value=="")){
		alert("Please Enter your Phone Number")
		Phone.focus()
		return false
	}
	if (document.Register.cell.value.indexOf(invalid) > -1) 
  {
     alert("Sorry, spaces are not allowed.");
     return false;
  }
 
	if (checkInternationalPhone(Phone.value)==false){
		alert("Please Enter a Valid Phone Number")
		Phone.value=""
		Phone.focus()
		return false
	}
	 return true
 }

function Validate_form(thisform)
{
with (thisform)
  {
    if (Validate_required(userno,"userno must be filled out!")==false)
      {
        userno.focus();return false;
      }
    
    if (Validate_required(username,"username must be filled out!")==false)
      {
        username.focus();return false;
      }
      if (Validate_Pwd()==false)
      {
        password.focus();return false;
      }
      
    if (Validate_required(email,"email be filled out!")==false)
      {
        email.focus();return false;
      }
    if (Validate_email(email,"Not a valid e-mail address!")==false)
      {
        email.focus();return false;
      }
      if (Validate_required(address,"address must be filled out!")==false)
      {
        address.focus();return false;
      }
    
      if (Validate_Phone(cell,"cell field must be filled out!")==false)
      {
        cell.focus();return false;
      }
      if (Validate_required(city,"city must be filled out!")==false)
      {
        city.focus();return false;
      } 
  }
}

</script>
	
  </head>
  
  <body bgcolor="CCCC33"><center>
  <div align="right"><a href="Logout.jsp"><u><b>LogOut</b></u></a></div><br><br><br>
  <marquee><h3><b><font color="CC0066">Register For New User</font></b></h3></marquee>
	<br>
    
   <form name="Register" action="RegisterPerson1" method="post" onsubmit="return Validate_form(this)" target="fram2">
  <center><b>USER INFORMATION</b></center>
   <table border="2">
  
   <tr><td> USER NO:</td><td><input type="text" name="userno"></td></tr>
   <tr><td>  USERNAME:</td><td><input type="text" name="username"></td></tr>
   
   <tr><td>PASSWORD:</td><td><input type="password" name="password"></td></tr> 
   <tr><td>(RE ENTER PASSWORD):</td><td><input type="password" name="password1"></td></tr>
   
   <tr><td>EMAIL:</td><td><input type="text" name="email"></td></tr>
   
   <tr><td>ADDRESS:</td><td><textarea name="address" rows="2" cols="15" tabindex="4"></textarea></td></tr>
   
   <tr><td>GENDER:</td><td><input type="radio" checked="checked" name="Sex" value="male">Male<br>
   <input type="radio" name="Sex" value="female">Female</td>

   <tr><td>CELL NUMBER:</td><td><input type="text" name="cell"></td></tr>
   <tr><td>CITY:</td><td><input type="text" name="city"></td></tr>
   <tr><td></td><td><input type="submit" name="submit" value="Register">
   <input type="reset" name="reset" value="Clear"></td></tr></table>
   </form></center>
   </body>
  