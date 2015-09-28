<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>About Site</title>
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link rel="stylesheet" type="text/css" href="css/about.css" />
</head>

<body>
<% //have to erase this one...
/*out.print("USER: " + session.getAttribute("USERNAME"));
if(session.getAttribute("USERNAME") == null)
{
	response.sendRedirect("user.jsp");
	
}*/

%>
<div id="container">
	
   	<div class="header">
	<div class="header_title">Project Review & Evaluation</div>
       <div style="float:left; width:100px; margin-top:15px; margin-left:100px; color:#FFFFFF;"><a  href="home.jsp">>>Home</a></div>
  	</div>
    
    
    <div class="bottom">
    	<div id="inner_bottom" align="justify">
        
        <pre>
        
  This is web based system to track progress and genuine work of 
  each IDP/UDP project of  the last year student.This system is 
  useful to both administrator and students to manage their work 
  efficiently.  
         
  Main modules of the project are:

  <b><u>Create Student profile</u></b>
  Student profile contains information regarding to students which 
  includes basic details firstname,Lastname,Semester,Birthdate,
  Passout Year and other contact details.

  <b><u>Submit project detail </u></b>
  Project details contain project regarding information like 
  Definition,Members,Abstract,Type, Technology,Guide.If type 
  is IDP,it will also contain company Information of students.

  <b><u>Approval of project</u></b>
  After submission of project definition,it will be examined by 
  administrator. If  admin will be satisfied by the content and 
  description of definition ,he or she will approve definition 
  otherwise approval of project will be denied. In this case, 
  students have to modify their definition to make admin
  satisfied.
  
  <b><u>Create Project report  </u></b>
  It includes student enrollment no and his/her company details 
  which he has specified in project details.Only Admin can Access
  this Page for Report and NOC Purpose.

  <b><u>Request for NOC </u></b>
  Students can request for NOC letter online.

  <b><u>Project Tracking</u></b> 
  Project Tracking can be done by reporting project status details 
  like Current work, future Work, Task Allocation,Description etc.  
  within  particular time period.

        </pre>  
        
        </div><!--inner bottom end -->
    	
    
    
    </div><!--bottom end -->

	  <div class="footer">
   		<div id="bottom_menu">
				<a href="user.jsp" style="padding-right:10px;padding-left:10px;">My Account</a>
    			|
				<a href="register.jsp" style="padding-right:10px;padding-left:10px;">Registration</a>
				|
				<a  href="admin.jsp" style="padding-right:10px;padding-left:10px;">Administration</a>
                |  
                <a  href="home.jsp" style="padding-right:10px;padding-left:10px;">Home</a>
          </div>
				
  </div><!--footer end -->
	








</div><!--container end -->

</body>
</html>
