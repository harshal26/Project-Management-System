
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="utility.MessageConstant" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student Dashboard</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/stdentdash.css" />
<link type="text/css" rel="stylesheet" href="css/thumbnail_script/thumbnail_horizontal_slider.css" />
<script src="css/jquery/jquery.min.js" type="text/javascript"></script>
</head>

<body>



 
<div id="container">
		<div class="header">
        	<div class="header_title" style="margin-left:350px;">Student DashBoard</div>
           <div style="float:left; width:100px; margin-top:15px; margin-left:150px; color:#FFFFFF;font-size:20px;">[<a  href="Logout" style="text-decoration:none;">Log out</a>]</div>
		
        </div><!--header end -->
        
          <div class="bottom" style="margin-top:20px;margin-bottom:20px;">
    			<div id="inner_bottom">
                <div class="label_style" style="width:inherit; height:auto; padding-left:20px; text-decoration:underline;font-variant:small-caps">
                Welcome, 
                
                <%
                try{
                out.print(session.getAttribute("USERNAME"));
                }catch(Exception e)
                {
                	response.sendRedirect("home.jsp");
                }
                
                
                %>
                
                
                
                </div>
                
                
<!--slider start --> 
                    
                    <div id="outer_container">
<div id="thumbScroller">
	<div class="container">
    	<div class="content">
        	<div><a href="aboutsite.jsp"><img src="images/thumbs/1.jpg"  alt="Project Reporting" class="thumb" /></a></div>
        </div>
        <div class="content">
        	<div><a href="UpdateStudentDetailServlet"><img src="images/thumbs/2.jpg"  alt="Student Profile" class="thumb" /></a></div>
        </div>
        <div class="content">
        	<div><a href="aboutsite.jsp"><img src="images/thumbs/3.jpg"  alt="Project Tacking" class="thumb" /></a></div>
        </div>
        <div class="content">
        	<div><a href="UpdateProjectDetailServlet"><img src="images/thumbs/4.jpg" description="Division4" alt="Project Detail" class="thumb" /></a></div>
        </div>
         <div class="content">
        	<div><a href="PDFServlet" target="blank"><img src="images/thumbs/5.jpg" description="Division5" alt="Request NOC" class="thumb" /></a></div>
        </div>   
       
	</div>
</div>
</div>
                    
        
 <!--slider end -->              
                    
       
                <div style="width:inherit;">
                	<div id="left">
                     	<div align="center" class="title_style">Useful Link</div>
                     	
                     	<div >
           
          				<ul type="disc"> 
          				<a href="UpdateStudentDetailServlet"><li>Update Profile</li></a>
          				<a href="UpdateProjectDetailServlet"><li>Update Project Detail</li></a>
           			    <a href="GetDetailServlet"><li>View Profile</li></a>
                        <a href="resetpassword.jsp"><li>Change Password</li></a>
                        <a href="registerteam.jsp"><li>Make Team Registration</li></a>
                        <a href="ViewPendingDefinitionServlet?flag=all"><li>View Project Definition</li></a>
                   		<a href="ForumServlet"><li>Question Forum</li></a>
                        </ul>
				       
			            </div>
                    
                    </div><!-- left end -->
                    
                    <div id="right">
                    	<div align="center" class="title_style">Notifications</div>
                    	
                        <div class ="text" style="height:350px;">
                        <marquee direction="up" height="350px">
                       <ul>
                        <li>notification 1</li>
                         <li>notification 2</li>
                          <li>notification 3</li>
                           <li>notification 4</li>
                            <li>notification 5</li>
                             <li>notification 6</li>
                              <li>notification 7</li>
                               <li>notification 8</li>
                                <li>notification 9</li>
                                 <li>notification 10</li>
                        </ul>
                        </marquee>
                        
                        </div>
                    </div><!-- right end -->
                
                
                
                </div>
                
             
                
                
       		</div><!--inner bottom -->
                
          </div><!--bottom end -->      
        
        <div class="footer">
        <div id="bottom_menu">
				VISHWAKARMA&nbsp&nbspGOVERNMENT&nbsp&nbspENGINEERING&nbsp&nbspCOLLEGE
    			
          </div>
        </div>


</div><!--container end -->


<script>
	$outer_container=$("#outer_container");
	$thumbScroller=$("#thumbScroller");
	$thumbScroller_container=$("#thumbScroller .container");
	$thumbScroller_content=$("#thumbScroller .content");
	$thumbScroller_thumb=$("#thumbScroller .thumb");

	var sliderWidth=$thumbScroller.width();
	var itemWidth=$thumbScroller_content.width();

	$thumbScroller_content.each(function (i) {
		totalContent=i*itemWidth;	
		$thumbScroller_container.css("width",totalContent+itemWidth);
	});

	$thumbScroller.mousemove(function(e){
		var mouseCoords=(e.pageX - this.offsetLeft);
	  	var mousePercentY=mouseCoords/sliderWidth;
	  	var destY=-(((totalContent-(sliderWidth-itemWidth))-sliderWidth)*(mousePercentY));
	  	var thePosA=mouseCoords-destY;
	  	var thePosB=destY-mouseCoords;
	  	if(mouseCoords==destY){
			$thumbScroller_container.stop();
	  	}
	  	if(mouseCoords>destY){
			$thumbScroller_container.css("left",-thePosA);
	  	}
	  	if(mouseCoords<destY){
			$thumbScroller_container.css("left",thePosB);
	  	}
	});

	var fadeSpeed=150;
	
	$thumbScroller_thumb.each(function () {
		var $this=$(this);
		$this.fadeTo(fadeSpeed, 1);
	});

	$thumbScroller_thumb.hover(
		function(){ //mouse over
			var $this=$(this);
			$this.stop().fadeTo(fadeSpeed, 0.6);
			//var theText=$this.attr('description');
			//$('.text p').html(theText);                        deleted text
		},
		function(){ //mouse out
			var $this=$(this);
			$this.stop().fadeTo(fadeSpeed, 1);
			//$('.text p').html('&nbsp;');
		}
	);
</script>

<% if("SUCCESS".equals(MessageConstant.getStatus())||"ERROR".equals(MessageConstant.getStatus())) { 
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
