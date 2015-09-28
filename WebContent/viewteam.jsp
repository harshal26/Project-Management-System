<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");
%>
<%@ page import="utility.MessageConstant" language="java" %>
<%@page import="pojo.TeamDetail"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>My Team</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/stdentdash.css" />
</head>

<%
	List<TeamDetail> teamList=(List<TeamDetail>)request.getAttribute("TeamList");
	int size=0;
	if(teamList!=null)
	{
	size=teamList.size();
	}
	else
	out.print(teamList);

%>


<body>
<div id="container">
		<div class="header">
        	<div class="header_title" style="margin-left: 350px;">My Team</div>
        	 <div style="float:left; width:100px; margin-top:15px; margin-left:150px; color:#FFFFFF;font-size:20px;">[<a  href="Logout" style="text-decoration:none;">Log out</a>]</div>
        </div><!--header end -->
        
		<div id="bottom" style="height:auto;background-color:white;height:500px;">
	
       	<div><h1>List of Team</div>
       		<div>
       		<ol>       		
       		<% 
       		int i;
       		for(i=0;i<size;i++) { 
       		
       		%>
       		<li><div style="float: left;width:30%;"><a href="ShowProjectDetailServlet?teamid=<%=teamList.get(i).getTeamid() %>"><%= teamList.get(i).getTeamid() %></a></div> 
       		<div style="float: left;width:50%;">Created By  &nbsp &nbsp &nbsp<%= teamList.get(i).getCreatedby()  %> &nbsp &nbsp &nbsp on &nbsp &nbsp &nbsp <%= teamList.get(i).getCreationdate()  %> </div>
       		
       		</li>
       	
       		<%}%>
       		
       		</ol>
       		
       		</div>
       			
       		
       		</div><!-- bottom end -->
       		


        <div class="footer">
        <div id="bottom_menu">
				<a href="admindash.jsp" style="padding-right:10px;padding-left:10px;">Go to Dashboard</a>
    			
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
