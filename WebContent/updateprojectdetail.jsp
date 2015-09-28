<%@page import="utility.MessageConstant"%>
<%@page import="pojo.ProjectDetail"%>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");
if(session.getAttribute("TEAMID")==null || session.getAttribute("TEAMID").equals(""))
{
	MessageConstant.setStatus("ERROR");
	MessageConstant.setMessage("First Register Your Team");
	response.sendRedirect("registerteam.jsp");
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Project Detail</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/studentprofile.css" />
</head>

<body>
<%
ProjectDetail projectDetail=(ProjectDetail)request.getAttribute("PROJECTDETAIL");
if(projectDetail.getStatus()!=null && projectDetail.getStatus().equalsIgnoreCase("Accept"))
{
	MessageConstant.setStatus("ERROR");
	MessageConstant.setMessage("You can't Update your Definition.Your Definition is already Submitted.");
	response.sendRedirect("studentdash.jsp");
}
%>
<div id="container">
		<div class="header">
        	<div class="header_title" style="margin-left:350px;">Project Detail</div>
           <div style="float:left; width:100px; margin-top:15px; margin-left:150px; color:#FFFFFF;font-size:20px;">[<a  href="Logout" style="text-decoration:none;">Log out</a>]</div>
        </div><!--header end -->
        

		<div id="bottom" style="margirn-top:20px; margin-top: 20px; margin-bottom: 20px;">
        
        		<div id="inner_bottom">
                		
                        
                        <div style="width:inherit;height:1000px;">
                        <div id="left" style="height:inherit;width:25%;float:left;"></div>
                         <div id="right" style="height:inherit;width:75%;float:left;">
                         
                         	<form method="post" action="SaveProjectDetailServlet">
                            
                            	<div id="error" style="color:red;height:20px;" align="center"> </div><!--error-->
                         		<fieldset>
                         		<legend>[Required]</legend>
                         		<div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left">
                    					<pre class="label_style">   Team ID       </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;margin-top:15px;">
                   						 <input type="hidden" name="teamid" value="<%=session.getAttribute("TEAMID") %>">
                    					<%=session.getAttribute("TEAMID") %></input>
                       					 <div id="error1" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
                                 <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left">
                    					<pre class="label_style">   Project Title     </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" type="text" name="projecttitle"  style="width:75%; margin-top:20px;" 
                    					value=" <% 
                    							if(projectDetail!=null && projectDetail.getProjecttitle()!=null)
                        						{
                        							out.print(projectDetail.getProjecttitle());
                        						}
                    					
                    					
                    					%>"
                    					 required />
                       					 <div id="error2" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
                             
                                  <div style="height:70px;;width:100%;margin-top:20px;">
                 
                 						<div style="width:50%;height:inherit;float:left;clear:both;" align="left">
                    					<pre class="label_style">   Project Description      </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<textarea  name="projectdescription"   rows="3" cols="30" required>
                    					<% 
                    							if(projectDetail!=null && projectDetail.getProjectdesc()!=null)
                        						{
                        							out.print(projectDetail.getProjectdesc());
                        						}
                    					
                    					
                    					%>
                    					
                    					</textarea>
                       					 <div id="error7" align="center" style="color:red;font-size:15px;">Max 200 words</div><!--error -->
                   				 		</div> 
                 
                				 </div>
                				 
                				  <div style="height:70px;;width:100%;margin-bottom:10px;margin-top:20px;">
                 
                 						<div style="width:50%;height:inherit;float:left;clear:both;" align="left">
                    					<pre class="label_style">   Project Technology      </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<textarea  name="projecttechnology"   rows="3" cols="30" required>
                    					<% 
                    							if(projectDetail!=null && projectDetail.getProjecttechnology()!=null)
                        						{
                        							out.print(projectDetail.getProjecttechnology());
                        						}
                    					
                    					
                    					%>
                    					</textarea>
                       					 <div id="error7" align="center" style="color:red;font-size:15px;">Type all technologies with comma</div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
                                   <div style="height:70px;width:100%;margin-top:50px;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left">
                    					<pre class="label_style">   Project Type      </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<select name="projecttype" style="margin-top: 25px;">
                    					<option value="UDP" >UDP(User Defined Project)</option>
                    					<option value="IDP" >IDP(Industry Defined Project)</option>              					
                    					</select>
                       					 <div id="error6" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                				 </fieldset>
                				 <div style="margin-top: 30px;"></div>
                				 <fieldset>
                				 <legend>[if applicable]</legend>
                				 
                				 <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left">
                    					<pre class="label_style">   Company Name     </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" type="text" name="companyname"  style="width:75%;margin-top:20px;" 
                    						value=" <% 
                    							if(projectDetail!=null && projectDetail.getCompanyname()!=null)
                        						{
                        							out.print(projectDetail.getCompanyname());
                        						}
                    					
                    					
                    					%>"
                    					/>
                       					 <div id="error2" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                				 
                				 <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left">
                    					<pre class="label_style">   External Guide Name    </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" type="text" name="guidename" 
                    						value=" <% 
                    							if(projectDetail!=null && projectDetail.getGuidename()!=null)
                        						{
                        							out.print(projectDetail.getGuidename());
                        						}
                    					
                    					
                    					%>"
                    					 style="width:75%; margin-top:20px;" />
                       					 <div id="error2" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                				 
                				 <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   External Guide Contact     </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" type="text" name="guidecontact" 
                    					value=" <% 
                    							if(projectDetail!=null && projectDetail.getGuidecontact()!=null)
                        						{
                        							out.print(projectDetail.getGuidecontact());
                        						}
                    					
                    					
                    					%>"
                    					 style="width:75%; margin-top:20px;"/>
                       					 <div id="error2" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                				 <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   External Guide Email:     </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" type="email" name="guideemail" 
                    					value=" <% 
                    							if(projectDetail!=null && projectDetail.getGuideemail()!=null)
                        						{
                        							out.print(projectDetail.getGuideemail());
                        						}
                    					
                    					
                    					%>"
                    					 style="width:75%; margin-top:20px;"/>
                       					 <div id="error2" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                				 
                				 </fieldset>
                				 
                				 <div style="height:70px;width:100%;margin-top:50px;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">     </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    				<input  type="submit" value="Submit" style="margin-left:10px; "  />
                                    <input  type="reset" value="Reset" style="margin-left:50px;"  />
                        		 		</div> 
                 
                				 </div>
                                 
                                 
                                 
						</form>
                         </div><!--right end-->
                        </div>
  
                </div ><!--inner bottom end -->
      
  </div>  <!---bottom-->      
        
        
        <div class="footer">
        <div id="bottom_menu">
				<a href="studentdash.jsp" style="padding-right:10px;padding-left:10px;">Go to Dashboard</a>
    			
          </div>
        </div>


</div><!--container end -->
</body>
</html>
