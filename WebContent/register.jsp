
<%@ page import="utility.MessageConstant" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Registration</title>
<link rel="stylesheet" type="text/css"  href="css/register.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
 <script src="css/register.js" type="text/javascript"></script>


</head>

<body>



<div id="container">
	
    <div class="header">
    	<div class="header_title">Project Review & Evaluation</div>
      	<div style="float:left; width:100px; margin-top:15px; margin-left:100px; color:#FFFFFF;"><a  href="aboutsite.jsp">>>About Site</a></div>
    </div><!--header end -->

	<div id="bottom">
    		<div  id="bottom1"></div>
      		
            <div  id="bottom2">
       	     
			        	
          		<form name="register" action="RegistrationServlet" method="post" onsubmit="return validateRegistration()" onreset="resetAll()">
             	 <div align="center" class="title_style" style="height:50px;" >Registration</div>
             	  <div id="error" style="color:red;height:20px;" align="center"> 
             	  <%
						if("ERROR".equals(MessageConstant.getStatus()))
						{
							out.print(MessageConstant.getMessage());
						}
					%>
             	  
             	  
             	   </div><!---error--->
            	
                <div style="height:90px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">   Enrollment No                 :</pre>
                    </div>
                    <div style="width:50%;height:75px;float:left;">
                    	<input class="textfield" type="text" name="enrollment" placeholder="Enrollment" style="width:90%; margin-top:10%;"   />
                        <div id="error1" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>
                 
                  <div style="height:90px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">   Password                          :</pre>
                    </div>
                    <div style="width:50%;height:75px;;float:left;">
                    	<input class="textfield" type="password" name="password" placeholder="Password" style="width:90%; margin-top:10%;" />
                        <div id="error2" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>
                 
                  <div style="height:90px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">   Re-type Password           :</pre>
                    </div>
                    <div style="width:50%;height:75px;;float:left;">
                    	<input class="textfield" type="password" name="repassword" placeholder="Re-type Password" style="width:90%; margin-top:10%;"  />
                        <div id="error3" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>
                  <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   Branch                             :  </pre>
                   						 </div> 
                   						 <div style="width:50%;float:left;">
                    					<select name="branch" style="margin-top: 20px;">
                    					<option value="CE" selected="selected">Computer Engineering</option>
                    					<option value="EC" >Electronics & Communication Engineering</option>
                    					<option value="EE">Electrical Engineering</option>
                    					<option value="ME">Mechanical Engineering</option>
                    					<option value="CV">Civil Engineering</option>
                    					<option value="IT">Information Technology</option>                   					
                    					</select>
                       					 <div id="error6" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                				 
                  <div style="height:90px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">   Passout Year                   :</pre>
                    </div>
                    <div style="width:50%;height:75px;;float:left;">
                    	<input class="textfield" type="text" name="passout" placeholder="Passout Year" style="width:90%; margin-top:10%;"/>
                        <div id="error7" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>		 
                 
                  <div style="height:90px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">   Email                               :</pre>
                    </div>
                    <div style="width:50%;height:75px;;float:left;">
                    	<input class="textfield" type="email" name="email" placeholder="E-mail" style="width:90%; margin-top:10%;"/>
                        <div align="center"></div><!--error -->
                    </div> 
                 
                 </div>
                 
                  <div style="height:60px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;margin-top:20px;" align="center";>
                    	<input type="submit" value="Submit" />
                    </div>
                    <div style="width:50%;height:75px;;float:left;margin-top:20px;" align="center">
                    	<input type="reset" value="Reset" />
                   
                       
                    </div> 
                 
              		</div>             			
        
        		   </form>
        	</div>
     
    
    </div><!--bottom end --> 
    
   <div class="footer">
   			<div id="bottom_menu">
				<a href="user.jsp" style="padding-right:10px;padding-left:10px;">My Account</a>
    			|
				
				<a  href="admin.jsp" style="padding-right:10px;padding-left:10px;">Administration</a>
                |  
                <a  href="aboutsite.jsp" style="padding-right:10px;padding-left:10px;">About Site</a>
                  |
                <a  href="home.jsp" style="padding-right:10px;padding-left:10px;">Home</a>
          </div>
  </div><!--footer end -->
</div><!--container end -->
</body>


</html>
<%
 	MessageConstant.setStatus(null);
 	MessageConstant.setMessage(null);
%>
