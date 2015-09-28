<%@page import="pojo.StudentDetail"%>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires", 0); 
if(session.getAttribute("ISLOGIN")==null)
	response.sendRedirect("error.jsp");

//to get student details
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Student Profile</title>
<link type="text/css" rel="stylesheet" href="css/common.css" />
<link type="text/css" rel="stylesheet" href="css/studentprofile.css" />
<script src="css/thumbnail_script/jquery.min.js" type="text/javascript"></script>
 <link rel="stylesheet" href="css/datepicker/style.css" />
<script src="css/jquery/jquery-1.9.1.js"></script>
<script src="css/jquery/jquery-ui-1.10.3.custom.js"></script>
<script>
$(function() {
$( "#datepicker" ).datepicker({
	 changeMonth: true,
	 changeYear: true,
	 yearRange: "1950:2025"

});
});
</script>
</head>

<body>
<%
StudentDetail studentDetail=(StudentDetail)(request.getAttribute("STUDENTDETAIL"));
%>
<div id="container">
		<div class="header">
        	<div class="header_title" style="margin-left:350px;">Student Profile</div>
           <div style="float:left; width:100px; margin-top:15px; margin-left:150px; color:#FFFFFF;font-size:20px;">[<a  href="Logout" style="text-decoration:none;">Log out</a>]</div>
        </div><!--header end -->
        

		<div id="bottom" style="margirn-top:20px; margin-top: 20px; margin-bottom: 20px;">
        
        		<div id="inner_bottom">
                		
                        
                        <div style="width:inherit;height:700px;">
                        <div id="left" style="height:inherit;width:25%;float:left;"></div>
                         <div id="right" style="height:inherit;width:75%;float:left;">
                         
                         	<form method="post" action="SaveStudentDetailServlet">
                            
                            	<div id="error" style="color:red;height:20px;" align="center"> </div><!--error-->
                         
                         		<div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   First Name       </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" type="text" name="fname"  
                    					value="<% 
                    						if(studentDetail!=null && studentDetail.getFirstname()!=null)
                    						{
                    							out.print(studentDetail.getFirstname());
                    						}
                    					
                    					%>" style="width:75%; margin-top:20px;" onfocus="" required />
                    				
                       					 <div id="error1" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
                                 <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   Middle Name     </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" type="text" name="mname" value="<% 
                    						if(studentDetail!=null && studentDetail.getMiddlename()!=null)
                    						{
                    							out.print(studentDetail.getMiddlename());
                    						}
                    					
                    					%>" style="width:75%; margin-top:20px;" required />
                       					 <div id="error2" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
                                  <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   Last Name         </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" type="text" name="lname" value="<% 
                    						if(studentDetail!=null && studentDetail.getLastname()!=null)
                    						{
                    							out.print(studentDetail.getLastname());
                    						}
                    					
                    					%>" style="width:75%; margin-top:20px;" required />
                       					 <div id="error3" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
                                  <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   Birthdate         </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<input class="textfield" id="datepicker" type="text" name="bdate"  value="<% 
                    						if(studentDetail!=null && studentDetail.getBirthdate()!=null)
                    						{
                    							out.print(studentDetail.getBirthdate());
                    						}
                    					
                    					%>" placeholder="MM/DD/YYYY" style="width:75%; margin-top:20px;" required/>
                       					 <div id="error4" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
                                 
                                 <div style="height:70px;width:100%;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   Gender          </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;"> 
                    					<input class=""  type="radio" name="gender" style=" margin-top:20px;" value="m" checked="checked" />Male
                                        <input class=""  type="radio" name="gender" style=" margin-left:50px; margin-top:25px;" value="f"/>Female
                       					 <div id="error5" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                				 
                				 
                                 
                                  <div style="height:70px;;width:100%;margin-bottom:10px;">
                 
                 						<div style="width:50%;height:inherit;float:left;clear:both;" align="left";>
                    					<pre class="label_style">   Address      </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;">
                    					<textarea  name="address"   rows="3" cols="30" required>
                    						<%
                    						if(studentDetail!=null && studentDetail.getAddress()!=null)
                    						{
                    							out.print(studentDetail.getAddress());
                    						}
                    					
                    						%>
                    					</textarea>
                       					 <div id="error7" align="center"  style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
                                  <div style="height:70px;width:100%;margin-top:10px;">
                 
                 						<div style="width:50%;height:inherit;float:left;" align="left";>
                    					<pre class="label_style">   Contact No      </pre>
                   						 </div>
                   						 <div style="width:50%;float:left;height:inherit;">
                    				(M)<input class="textfield" type="text" name="contact" value="<% 
                    						if(studentDetail!=null && studentDetail.getContactno()!=null)
                    						{
                    							out.print(studentDetail.getContactno());
                    						}
                    					
                    					%>" style="width:60%;margin-left:10px; margin-top:20px;" required/>
                        			 <div id="error8" align="center" style="color:red;font-size:20px;"></div><!--error -->
                   				 		</div> 
                 
                				 </div>
                                 
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
