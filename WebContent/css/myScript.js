// JavaScript Document
 function validateLogin()
{
var x=document.login.enrollment.value;
if (x==null || x=="")
  {
  alert("Enrollment must be filled out");
  return false;
  }
  x=document.login.password.value;
if (x==null || x=="")
  {
  alert("password must be filled out");
  return false;
  }
  return true;
}