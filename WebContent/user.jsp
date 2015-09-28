
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="utility.MessageConstant" language="java" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>user</title>
<link rel="stylesheet" type="text/css" href="css/user.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link href="css/slider/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="css/slider/mcVideoPlugin.js" type="text/javascript"></script>
    <script src="css/slider/js-image-slider.js" type="text/javascript"></script>
     <script src="css/login.js" type="text/javascript"></script>
   
</head>

<body>



<div id="container">
		<div class="header">
	  <div class="header_title">Project Review & Evaluation</div>
      <div style="float:left; width:100px; margin-top:15px; margin-left:100px; color:#1F1160;"><a  href="aboutsite.jsp">>>About Site</a></div>
		</div>
<div class="top">
    	<div class="logo_top"><img src="images/logo.png" height="300" width="300" /></div>
		<div class="sliding_top">
        
        
        	 <div id="sliderFrame">
        		<div id="slider">
            <img src="images/slider/1.jpg" height="300" width="700" alt="Vishwakarma Government Engineering Collage"/>
            <img src="images/slider/2.jpg" height="300" width="700" alt="Vishwakarma Government Engineering Collage" />
            <img src="images/slider/3.jpg" height="300" width="700" alt="Vishwakarma Government Engineering Collage" />
            <img src="images/slider/4.jpg" height="300" width="700" alt="Vishwakarma Government Engineering Collage" />
        		</div>
    		</div>
    
    
    	</div>
    </div><!--top end -->
   
    <div class="bottom">
    	<div id="bottom1"> </div>
     <div id="bottom2">
        		 <div align="center" class="title_style" style="height:15%;width:100%;">My Account</div>
                 <div id="error" style="height:10%;width:100%;color:red;" align="center" >
                 <%
	           		if(MessageConstant.getMessage() != null)
	           		{
	           			out.print(MessageConstant.getMessage());
	           		}
           		%> 
                 
                 </div><!--Error display -->
                 <form name="login" action="LoginServlet?flag=student" method="post" onsubmit="return checkEnrollment()" >
                 
                 <div style="height:75px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;">
                    	<pre class="label_style">   Enrollment No   :</pre>
                    </div>
                    <div style="width:50%;height:75px;;float:left;">
                    	<input class="textfield" type="text" name="enrollment" placeholder="Enrollment" style="width:90%; margin-top:10%;"  />
                    	 <div id="error1" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>
                 
                 
                 
                 <div style="height:75px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;">
                    	<pre class="label_style">      Password         :</pre>
                    </div>
                    <div style="width:50%;height:75px;float:left;">
                    	<input class="textfield" type="password" name="password" style="width:90%; margin-top:10%;" placeholder="Password" />
                   		 <div id="error2" align="center" style="color:red;"></div><!--error -->
                    </div>
                 
                 </div>
                 
                 <div style="height:75px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;">
                    <input  type="submit" value="Submit" style=" margin-top:10%;margin-left:25%;" />	
                    </div>
                    <div style="width:50%;height:75px;float:left;">
                    <div style="margin-top:10%;margin-left:5%"><a class="lnk" href="forgotpassword.jsp">Forgot Password?</a></div>	
                    </div>
                 
                 </div>
                 
                 </form>
               
        				
               
        
        
        
      </div><!--bottom2 end -->


    
    </div><!--bottom end -->
    <div class="footer">
   		  	<div id="bottom_menu">
				
				<a href="register.jsp" style="padding-right:10px;padding-left:10px;">Registration</a>
				|
				<a  href="admin.jsp" style="padding-right:10px;padding-left:10px;">Administration</a>
                |  
                <a  href="aboutsite.jsp" style="padding-right:10px;padding-left:10px;">About Site</a>
                  |
                <a  href="home.jsp" style="padding-right:10px;padding-left:10px;">Home</a>
          </div>
  
  </div><!--footer end -->






</div><!--container end -->



 <% if("SUCCESS".equals(MessageConstant.getStatus())) { %>
		<script type="text/javascript">
			alert("<%= MessageConstant.getMessage() %> ");
		</script>
<% 
	//session.invalidate();
	}
 	MessageConstant.setStatus(null);
 	MessageConstant.setMessage(null);
%>

</body>


</html>
