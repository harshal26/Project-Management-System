
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");
%>
<%@ page import="utility.MessageConstant" language="java" %>
<%@page import="pojo.StudentDetail"%>
<%@page import="pojo.ProjectDetail"%>
<%@page import="pojo.FacultyDetail"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>View Profile</title>
<link rel="stylesheet" type="text/css"  href="css/viewprofile.css" />
<link rel="stylesheet" type="text/css" href="css/common.css" />
 <script src="css/register.js" type="text/javascript"></script>


</head>

<body>
<%
StudentDetail studentDetail=(StudentDetail)(request.getAttribute("STUDENTDETAIL"));
ProjectDetail projectDetail=(ProjectDetail)(request.getAttribute("PROJECTDETAIL"));
FacultyDetail facultyDetail=(FacultyDetail)(request.getAttribute("FACULTYDETAIL"));
%>



<div id="container">
	
    <div class="header">
    	<div class="header_title" style="margin-left:350px;">Student Profile</div>
           <div style="float:left; width:100px; margin-top:15px; margin-left:150px; color:#FFFFFF;font-size:20px;">[<a  href="Logout" style="text-decoration:none;">Log out</a>]</div>
    </div><!--header end -->

	<div id="bottom">
    		
	  <div id="left_bottom"> 
	  			  	
             	 <div align="center" class="title_style" style="height:50px;" >Student Detail</div>
             	 <div style="float:right; width:100px; margin-top:15px; margin-left:100px; color:#FFFFFF;"><a  href="UpdateStudentDetailServlet">[Update]</a></div>
             	  <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Name :<% 
                    						if(studentDetail.getFirstname()!=null)
                    						{
                    							out.print(studentDetail.getFirstname()+"  "+studentDetail.getMiddlename()+"  "+studentDetail.getLastname());
                    						}
                    					
                    					%></div>
             	  <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Branch:<% 
                    						if(studentDetail.getBranchcode()!=null)
                    						{
                    							out.print(studentDetail.getBranchcode());
                    						}
                    					
                    					%></div>
             	   <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Birthdate:<% 
                    						if(studentDetail.getBirthdate()!=null)
                    						{
                    							out.print(studentDetail.getBirthdate());
                    						}
                    					
                    					%></div>
             	   <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Passout Year:<% 
                    						if(studentDetail.getPassout()!=null)
                    						{
                    							out.print(studentDetail.getPassout());
                    						}
                    					
                    					%></div>
             	   <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Address:<% 
                    						if(studentDetail.getAddress()!=null)
                    						{
                    							out.print(studentDetail.getAddress());
                    						}
                    					
                    					%></div> 
             	    <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Contact No:<% 
                    						if(studentDetail.getContactno()!=null)
                    						{
                    							out.print(studentDetail.getContactno());
                    						}
                    					
                    					%></div>
             	     <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Email:<% 
                    						if(studentDetail.getEmail()!=null)
                    						{
                    							out.print(studentDetail.getEmail());
                    						}
                    					
                    					%></div>
             	      	   
            
              
     </div><!-- left_bottom end --> 
     
     
      <div id="right_bottom">   	
             	 <div align="center" class="title_style" style="height:50px;" >Project Detail</div>
             	 <%
             	 if(projectDetail.getStatus()!=null && projectDetail.getStatus().equals("Accept"))
             			 {
             	 %>
             	 <div style="float:right; width:100px; margin-top:15px; margin-left:100px; color:#FFFFFF;"></div>
             	  <%} 
             	 else{ %>
             	   <div style="float:right; width:100px; margin-top:20px; margin-left:100px; color:#FFFFFF;"><a  href="UpdateProjectDetailServlet">[Update]</a></div>
             	   <%} %>
             	  <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Team Id :<a href="ShowProjectDetailServlet?teamid=<%=session.getAttribute("TEAMID") %> "><%=session.getAttribute("TEAMID") %></a></div>
             	  <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Project Title:<% 
                    							if(projectDetail.getProjecttitle()!=null)
                        						{
                        							out.print(projectDetail.getProjecttitle());
                        						}
                    					
                    					
                    					%></div>
                    					
                    <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Project Status:<% 
                    						if(projectDetail.getStatus()!=null)
                    						{
                    							if(projectDetail.getStatus().equals("Deny"))
                        						{%>
                        							<font color="red">	
                        						<% }
                   								 if(projectDetail.getStatus().equals("Accept"))
												{%>
													<font color="green">	
												<% }
                    out.print(projectDetail.getStatus());
                        							
                        					}%>
                        							
                        					
                    					
                    					
                    </div>
             	   
             	   <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Project Technologies:<% 
                    							if(projectDetail.getProjecttechnology()!=null)
                        						{
                        							out.print(projectDetail.getProjecttechnology());
                        						}
                    					
                    					
                    					%></div>
             	   <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Project Type:<% 
                    							if(projectDetail.getProjecttype()!=null)
                        						{
                        							out.print(projectDetail.getProjecttype());
                        						}
                    					
                    					
                    					%></div> 
             	    <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Internal Faculty:<% 
                    							if(facultyDetail.getFirstname()!=null)
                        						{
                        							out.print(facultyDetail.getFirstname()+" "+facultyDetail.getLastname());
                        						}
                    					
                    					
                    					%>
             	    </div>
             	     <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Internal Faculty contact No:<% 
                    							if(facultyDetail.getMobileno()!=null)
                        						{
                        							out.print(facultyDetail.getMobileno());
                        						}
                    					
                    					
                    					%></div> 
             	        <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Internal Faculty Email:<% 
                    							if(facultyDetail.getEmail()!=null)
                        						{
                        							out.print(facultyDetail.getEmail());
                        						}          					
                    					
                    					%></div>   	   
            		 <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">Company Name:<%
            		 	
            		 	
            		 	if(projectDetail.getProjecttype()!=null && projectDetail.getProjecttype().equals("UDP"))
         		 	    {
         		 		out.print("N/A");
         		 	    }
            		 	else if(projectDetail.getCompanyname()!=null)
           		 	   {
           		 		out.print(projectDetail.getCompanyname());
           		 	   }
            		 	else
            		 	{
            		 		out.print("");
            		 	}
            		     		 %>
            		 
            		 
            		 </div>
            		  <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">External Guide:<%
            				  if(projectDetail.getProjecttype()!=null && projectDetail.getProjecttype().equals("UDP"))
               		 	    {
               		 		out.print("N/A");
               		 	    }
            				  else if(projectDetail.getGuidename()!=null)
            		 	{
            		 		out.print(projectDetail.getGuidename());
            		 	}
            		 	
            			else
            		 	{
            		 		out.print("");
            		 	}
                		     		 %>
            		     		 </div>
            		   <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">External Guide contact No:<%
            		 	
            				   if(projectDetail.getProjecttype()!=null && projectDetail.getProjecttype().equals("UDP"))
                		 	    {
                		 		out.print("N/A");
                		 	    }
            				   else if(projectDetail.getGuidecontact()!=null)
            		 	       {
            		 		    out.print(projectDetail.getGuidecontact());
            		 	       }
            		 	
            			else
            		 	{
            		 		out.print("");
            		 	}
                		     		 %>
            		     		 </div>
            		    <div style="clear:both;font-size: 20px;font-weight:bold;height: 50px;">External Guide Email:<%
            		 	
            		    		if(projectDetail.getProjecttype()!=null && projectDetail.getProjecttype().equals("UDP"))
                 		 	    {
                 		 		out.print("N/A");
                 		 	    }
            		    		else if(projectDetail.getGuideemail()!=null)
            		 	{
            		 		out.print(projectDetail.getGuideemail());
            		 	}
            		 	
            			else
            		 	{
            		 		out.print("");
            		 	}
                		     		 %>
            		     		 
            		 </div>    
              
     </div><!-- right_bottom end --> 
     
    
    </div><!--bottom end --> 
    
   <div class="footer">
   			<div id="bottom_menu">
				<a href="studentdash.jsp" style="padding-right:10px;padding-left:10px;">Go to Dashboard</a>
    			
          </div>
  </div><!--footer end -->
</div><!--container end -->
</body>


</html>

