<%        
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setDateHeader("Expires", -1);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>home</title>
<link rel="stylesheet" type="text/css" href="css/home.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
<link href="css/slider/js-image-slider.css" rel="stylesheet" type="text/css" />
    <script src="css/slider/mcVideoPlugin.js" type="text/javascript"></script>
    <script src="css/slider/js-image-slider.js" type="text/javascript"></script>
    
<style type="text/css">
<!--
.style1 {
	font-family:Arial;
	font-weight: bold;
	font-size: 28px;
	font-variant:small-caps;
	border-bottom:dotted;	
}

-->
</style>
</head>
<script>
function changeIconIn(id)
{
	document.getElementById(id).width="150";
	document.getElementById(id).height="150";

}
function changeIconOut(id)
{
	document.getElementById(id).width="128";
	document.getElementById(id).height="128";
}
</script>
<body>

<div id="container">
		<div class="header">
	  <div class="header_title">Project Review & Evaluation</div>
      <div style="float:left; width:100px; margin-top:15px; margin-left:100px; color:#FFFFFF;"><a  href="aboutsite.jsp">>>About Site</a></div>
  		</div>
<div class="top">
    	<div class="logo_top"><img src="images/logo.png" height="300" width="300" /></div>
		<div class="sliding_top">
			 
			 <div id="sliderFrame">
        		<div id="slider">
            <img src="images/slider/1.jpg" height="300" width="700" alt="Vishwakarma Government Engineering Collage" />
            <img src="images/slider/2.jpg" height="300" width="700" alt="Vishwakarma Government Engineering Collage" />
            <img src="images/slider/3.jpg" height="300" width="700" alt="Vishwakarma Government Engineering Collage"/>
            <img src="images/slider/4.jpg" height="300" width="700" alt="Vishwakarma Government Engineering Collage" />
        		</div>
    		</div>
    
    
    	</div>
    </div><!--top end -->
    <div class="bottom">
    	<div id="bottom_1">
         	 <div align="center" class="style1" >My Account</div>
        	
          <div style="margin-top:50px;margin-left:100px;" ><a href="user.jsp"><img  src="images/login.ico" id="1" onmouseover="changeIconIn('1')"                  onmouseout="changeIconOut('1')"/></a></div>   
        </div>
    	<div id="bottom_2">
           	  <div id="pattern2" align="center" class="style1" >Registration</div>
          <div style="margin-top:50px;margin-left:100px;"><a href="register.jsp"><img src="images/exam.ico" id="2" onmouseover="changeIconIn('2')" onmouseout="changeIconOut('2')" /></a></div>
        </div>
        <div id="bottom_3">
        	  <div align="center" class="style1" >Administration</div>
          <div style="margin-top:50px;margin-left:100px;"><a href="admin.jsp"><img src="images/admin.png" height="128" width="128" id="3" onmouseover="changeIconIn('3')" onmouseout="changeIconOut('3')"/></a></div>
        </div>
    
    </div><!--bottom end -->
    
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
				
  </div><!--footer end -->
	





</div><!--container end -->

</body>
</html>
