<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");
%>
<%@ page import="utility.MessageConstant" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Team Registration</title>
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
			<form action="RegisterTeamServlet" method="post">
			<fieldset>
			<legend>Team Registration</legend>
			
			<div id="error1"></div>
			
			 	 <div style="height:75px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">       Member 1<sup style="color: red">*</sup>                  :</pre>
                    </div>
                    <div style="width:50%;height:75px;float:left;">
                    	<input class="textfield" type="text" name="member1" placeholder="" style="width:90%; margin-top:25px;" onfocus="resetPassword()" required  />
                        <div id="error1" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>
                 
                 <div style="height:75px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">       Member 2                    :</pre>
                    </div>
                    <div style="width:50%;height:75px;float:left;">
                    	<input class="textfield" type="text" name="member2" placeholder="" style="width:90%; margin-top:20px;" onfocus="resetPassword()"  />
                        <div id="error1" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>

				 <div style="height:75px;width:100%;">
                 
                 	<div style="width:50%;height:100%;float:left;" align="left";>
                    	<pre class="label_style">       Member 3                    :</pre>
                    </div>
                    <div style="width:50%;height:75px;float:left;">
                    	<input class="textfield" type="text" name="member3" placeholder="" style="width:90%; margin-top:20px;" onfocus="resetPassword()" />
                        <div id="error1" align="center" style="color:red;"></div><!--error -->
                    </div> 
                 
                 </div>
                 
                 
                 <input type="submit" value="Submit" style="margin-left: 300px;"/>
                 <a href="RegisterTeamServlet" style="margin-left: 30px;">click here if you are alone member</a>
                 
                 
			
			</fieldset>
			</form>
			</div>
			
			<div>
			<h4 style="font-size: 15px;" align="center"><font style="color:red">Note:</font>Team should be of at most four members. You have to enter enrollment of team member in the box.<br>You will be provided your Team ID after successful registration.</br></h4>
			</div>
			
			
			</div><!-- inner bottom end -->
		
		
		</div><!-- bottom end -->


        <div class="footer">
       <div id="bottom_menu">
				<a href="studentdash.jsp" style="padding-right:10px;padding-left:10px;">Go to Dashboard</a>
    			
          </div>
        </div><!-- footer end -->


	</div><!--container end -->
	
	<% if("ERROR".equals(MessageConstant.getStatus())) { 
		%>
		<script type="text/javascript">
			
			alert("<%= MessageConstant.getMessage() %>");
		</script>
<% 
	//session.invalidate();
	}
 	MessageConstant.setStatus(null);
 	MessageConstant.setMessage(null);
%>
	
	
</body>
</html>
