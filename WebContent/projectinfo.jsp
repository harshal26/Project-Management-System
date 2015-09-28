
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");
%>
<%@ page import="utility.MessageConstant" language="java" %>
<%@page import="pojo.ProjectDetail"%>
<%@page import="pojo.TeamDetail"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Project Info</title>
<link rel="stylesheet" type="text/css"  href="css/viewprofile.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
 <script src="css/register.js" type="text/javascript"></script>


</head>

<body>
<%
ProjectDetail projectDetail=(ProjectDetail)request.getAttribute("PROJECTDETAIL");
TeamDetail teamDetail=(TeamDetail)request.getAttribute("TEAMDETAIL");
%>
<div id="container">
	
    <div class="header">
    	<div class="header_title" style="margin-left:350px;">Project Information</div>
           <div style="float:left; width:100px; margin-top:15px; margin-left:150px; color:#FFFFFF;font-size:20px;">[<a  href="Logout" style="text-decoration:none;">Log out</a>]</div>
    </div><!--header end -->

	<div id="bottom" style="height:auto;">
    		
			        	
             	 <div style="height:30px;margin-left:10px;font-size: 20px;font-weight: bold;" >Project Description</div>
             	 <div style="width:inherit;height:auto;margin-left: 10px;"><pre><% 
                    							if(projectDetail!=null && projectDetail.getProjectdesc()!=null)
                        						{
                        							out.print(projectDetail.getProjectdesc());
                        						}%> </pre></div>
                        						
                
                 <div style="height:50px;margin-left:10px;font-size: 20px;font-weight: bold;margin-top: 20px;" >Project Technology:<% 
                    							if(projectDetail!=null && projectDetail.getProjecttechnology()!=null)
                        						{
                        							out.print(projectDetail.getProjecttechnology());
                        						}%> </div> 
                 
                 <div style="height:50px;margin-left:10px;font-size: 20px;font-weight: bold;" >Project Type:<% 
                    							if(projectDetail!=null && projectDetail.getProjecttype()!=null)
                        						{
                        							out.print(projectDetail.getProjecttype());
                        						}%> </div> 
                        						
                 <div style="height:20px;margin-left:10px;margin-bottom:20px;font-size:20px;font-weight: bold;" >Team Members:</div>
              
                  <div style="height:20px;margin-left:10px;"><%=teamDetail.getCreatedby() %></div>
                  <div style="height:20px;margin-left:10px;"><%=teamDetail.getMember1() %></div>
                  <div style="height:20px;margin-left:10px;"><%=teamDetail.getMember2() %></div>
                  <div style="height:20px;margin-left:10px;"><%=teamDetail.getMember3() %></div>
                 
                    							
       
     
    
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
