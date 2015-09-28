<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Reset Password</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/stdentdash.css" />
</head>

<body>
<div id="container">
		<div class="header">
        	<div class="header_title">Project Review & Evaluation</div>
        </div><!--header end -->
		<div class="bottom" style="height:auto;width:inherit;">
			<div class="inner_bottom" style="width:80%;height:400px;margin-left:10%;margin-top:50px;margin-bottom:50px;background-color:white;border-radius:10px;">
			<div style="width:80%;margin-left: 10%;height:300px; ">
			<form action="">
			<fieldset>
			<legend>Reset Password</legend>
			
			 	 <div style="height:90px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">        Reset Password                   :</pre>
                    </div>
                    <div style="width:50%;height:75px;float:left;">
                    	<input class="textfield" type="text" name="enrollment" placeholder="" style="width:90%; margin-top:20px;" onfocus="resetPassword()" required  />
                        <div id="error1" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>
                 
                 <div style="height:90px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">        Confirm password               :</pre>
                    </div>
                    <div style="width:50%;height:75px;float:left;">
                    	<input class="textfield" type="email" name="enrollment" placeholder="" style="width:90%; margin-top:20px;" onfocus="resetPassword()" required />
                        <div id="error1" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>
                 <input type="submit" value="Submit" style="margin-left: 300px;"/>
                 
                 
			
			</fieldset>
			</form>
			</div>
			
			
			</div><!-- inner bottom end -->
		
		
		</div><!-- bottom end -->


        <div class="footer">
        <div id="bottom_menu">
				<a href="user.jsp" style="padding-right:10px;padding-left:10px;">My Account</a>
    			|
				<a href="register.jsp" style="padding-right:10px;padding-left:10px;">Registration</a>
				|
				<a  href="admin.jsp" style="padding-right:10px;padding-left:10px;">Administration</a>
                |  
                <a  href="aboutsite.jsp" style="padding-right:10px;padding-left:10px;">About Site</a>
          </div>
        </div><!-- footer end -->


	</div><!--container end -->
</body>
</html>
