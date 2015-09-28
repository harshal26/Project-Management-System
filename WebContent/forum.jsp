<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="pojo.ForumDetail"%>
<%@page import="java.util.*"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Question Forum</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
</head>
<%
	List<ForumDetail> forumDetailList=(List<ForumDetail>)request.getAttribute("ForumDetailList");
	int size=0;
	if(forumDetailList!=null)
	size=forumDetailList.size();
	

%>

<body>
<div id="container">
		<div class="header">
        	<div class="header_title">Question Forum</div>
        	  <div style="float:left; width:100px; margin-top:15px; margin-left:150px; color:#FFFFFF;font-size:20px;">[<a  href="Logout" style="text-decoration:none;">Log out</a>]</div>
		
        </div><!--header end -->
        
       	<div id="bottom" style="height:auto;background-color:white;">
       	<div><h1>Questions</h1><a href="#question">Ask your Question</a></div>
       		<div>
       		<ol>       		
       		<% 
       		int i;
       		for(i=0;i<size;i++) { 
       		
       		%>
       		<div><a href="viewForumServlet?id=<%= forumDetailList.get(i).getForamId() %>"><li><%= forumDetailList.get(i).getQuestion()  %></li></a></div>
       		
       		<%}%>
       		
       		</ol>
       		
       		</div>
       		<fieldset>
       		<div style="margin-left:250px;">
       		<h1>Submit Your Question Here :</h1>
       		<form action="SubmitQuestionServlet" method="post">
       			<textarea id="question" name="question" cols=50 style="margin-left:10px;" required></textarea>
       			<div style="margin-left:100px;margin-top:20px;"><input type="submit" value="Submit"></input></div>
			</form>
			</div>       	
       		</fieldset>
       		
       	</div><!--bottom end -->
        <div class="footer">
       <div id="bottom_menu">
				<a href="studentdash.jsp" style="padding-right:10px;padding-left:10px;">Go to Dashboard</a>
    			
          </div>
        </div>


</div><!--container end -->
</body>
</html>
