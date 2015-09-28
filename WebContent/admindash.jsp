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
<title>Admin dashboard</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/stdentdash.css" />
</head>


<body>
<div id="container">
		<div class="header">
        	<div class="header_title">Administration Dashboard</div>
        	 <div style="float:left; width:100px; margin-top:15px; margin-left:150px; color:#FFFFFF;font-size:20px;">[<a  href="Logout" style="text-decoration:none;">Log out</a>]</div>
        </div><!--header end -->
		<div class="bottom" style="height:auto;width:inherit;height:500px;background-color:white">
		<div class="label_style" style="width:inherit; height:auto; padding-left:20px;font-variant:small-caps">
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
			<div class="inner_bottom" style="width:50%;height:400px;margin-left:30%;margin-top:50px;margin-bottom:50px;background-color:white;border-radius:10px;font-size:25px;">
				
                
				
				<div align="center" class="title_style">Menu</div>
                     	
                     	<div >
           
          				<ul type="disc"> 
           			    <a href="ViewPendingDefinitionServlet?flag=pending"><li>View Pending Project Definitions</li></a>
                        <a href="ViewPendingDefinitionServlet?flag=approved"><li>View Approved Definitions</li></a>
                        <a href="ViewTeamServlet"><li>View My TeamList</li></a>
                        <a href="forum.jsp"><li>Question Forum</li></a>
                   		<a href="ViewPendingDefinitionServlet?flag=all"><li>View all Definitions</li></a>
                        </ul>
				       
			            </div>
			</div><!--inner bottom end -->
		</div><!-- bottom end -->


        <div class="footer">
        <div id="bottom_menu">
				VISHWAKARMA&nbsp&nbspGOVERNMENT&nbsp&nbspENGINEERING&nbsp&nbspCOLLEGE
    			
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
