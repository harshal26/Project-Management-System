package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.ConnectionUtil;
import utility.MessageConstant;
import utility.MyUtility;


public class SaveProjectDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ConnectionUtil util=new ConnectionUtil();
		MyUtility myUtil=new MyUtility();
		 try{
			
		 Connection connection=util.beginConnection();
		 HttpSession session=request.getSession();
		
		 
		 String teamId=request.getParameter("teamid");
		 String projectTitle=request.getParameter("projecttitle");
		 String projectDescription=request.getParameter("projectdescription");
		 String projectTechnology=request.getParameter("projecttechnology");
		 String projectType=request.getParameter("projecttype");
		 String companyName=request.getParameter("companyname");
		 String guideName=request.getParameter("guidename");
		 String guideContact=request.getParameter("guidecontact");
		 String guideEmail=request.getParameter("guideemail");
		 String date=myUtil.getCurrentDate();
		 
		 
		 String sql = "update tbl_project SET projecttitle='"+projectTitle+"',projectdesc='"+projectDescription+"',projecttechnology='"+projectTechnology+"',projecttype='"+projectType+"',companyname='"+companyName+"',guidename='"+guideName+"',guidecontact='"+guideContact+"',guideemail='"+guideEmail+"',creationdate='"+date+"',status='Pending' WHERE teamid='"+teamId+"'" ;
		 System.out.println(sql);
		 if(util.execute(sql)==1) {
	        	MessageConstant.setStatus("SUCCESS");
	        	MessageConstant.setMessage("Your Proct Definition has been Successfully submitted.");
	           	response.sendRedirect("studentdash.jsp");
     	}
		 
		 
		 }
		 catch(SQLException SQLE) {
	        	System.out.println("SQL Exception in processRequest() from SaveProjectDetailServlet class" + SQLE);
	        	MessageConstant.setStatus("ERROR");
	        	response.sendRedirect("studentdash.jsp");
	        } catch(Exception E) {
	        	System.out.println("Exception in processRequest() from SaveProjectDetailServlet class" + E);	
	        	MessageConstant.setStatus("ERROR");
	        	response.sendRedirect("studentdash.jsp");
	        }
	        finally{
	        	util.endConnection();
	        }
	
	
	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}
