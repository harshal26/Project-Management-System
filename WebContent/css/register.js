var loginStatus=true;
 
 
 function recheckPassword()
 {
	 var x=document.register.password.value;
	 y=document.register.repassword.value;
	 if(y==null||y==""||x!=y)
	 {
		 document.getElementById("error3").innerHTML="Password does not match.";
		 loginStatus=false;
	 
	 }
	 
	 
 }
 
  
 
 function validateRegistration2()
 {
	 if(loginStatus==false)
	{
		 document.getElementById("error").innerHTML="Enter Valid Data.";
	}
   return loginStatus;
 }
 
 function validateRegistration()
 {
	 var loginStatus=true;
	 var x=document.register.enrollment.value;
	 if (x==null || x=="")
	   {
	   document.getElementById("error1").innerHTML="Enrollment must be required.";
	   loginStatus=false;
	   }
	 if (x.length!=12)
	 {
	 document.getElementById("error1").innerHTML="Enrollment must be 12 digits.";
	 loginStatus=false;
	 }
	 var found=x.match("[0-9]*");
	 if(found==false)
	{
		 document.getElementById("error1").innerHTML="Only digits are allowed.";
		 loginStatus=false;
	}
	
	 recheckPassword();
	 x=document.register.passout.value;
	 if (x.length!=4 || x.match("[0-9]*")==false)
	 {
	 document.getElementById("error7").innerHTML="Year must be 4 digits.";
	 loginStatus=false;
	 }
   return loginStatus;
 }
 

 function resetAll()
 {
	 document.getElementById("error1").innerHTML=""; 
	 document.getElementById("error2").innerHTML=""; 
	 document.getElementById("error3").innerHTML=""; 
	 document.getElementById("error").innerHTML=""; 
 }