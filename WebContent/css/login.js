

function checkEnrollment()
 {
	 var x=document.login.enrollment.value;
	 if (x==null || x=="")
	   {
	   document.getElementById("error1").innerHTML="Enrollment must be required.";
	   return false;
	   }
	 if (x.length!=12)
	 {
	 document.getElementById("error1").innerHTML="Enrollment must be 12 digits.";
	 return false;
	 }
	 var found=x.match("[0-9]*");
	 if(found==false)
	{
		 document.getElementById("error1").innerHTML="Only digits are allowed.";
		 return false;
	}
	 
 }
 





