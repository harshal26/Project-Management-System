package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.*;

import java.sql.*;


public class SaveStudentDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	 protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		 ConnectionUtil util=new ConnectionUtil();
		 try{
			
		 Connection connection=util.beginConnection();
		 HttpSession session=request.getSession();
		 PrintWriter out=response.getWriter();
		 String user=session.getAttribute("USERNAME").toString();
		 System.out.println(user);
		 String fname=request.getParameter("fname");
		 String mname=request.getParameter("mname");
		 String lname=request.getParameter("lname");
		 String bdate=request.getParameter("bdate");
		 String gender=request.getParameter("gender");
		 String address=request.getParameter("address");
		 String contact=request.getParameter("contact");
		
		// System.out.println(branch);
		 
		 String sql="update tbl_user SET firstname='"+fname+"',middlename='"+mname+"', lastname='"+lname+"', birthdate='"+bdate+"', address='"+address+"', contactno='"+contact+"',gender='"+gender+"'WHERE enrollment='"+user+"'";
		System.out.println(sql);
		 if(util.execute(sql)==1) {
	        	MessageConstant.setStatus("SUCCESS");
	        	MessageConstant.setMessage("Profile successfully updated!!!");
	          	response.sendRedirect("studentdash.jsp");
    	}
		 
		 
		 
		 
		 }
		
	        catch(SQLException SQLE) {
	        	System.out.println("SQL Exception in processRequest() from ProfileServlet class" + SQLE);
	        	MessageConstant.setStatus("ERROR");
	        	response.sendRedirect("studentprofile.jsp");
	        } catch(Exception E) {
	        	System.out.println("Exception in processRequest() fromProfileServlet class" + E);	
	        	MessageConstant.setStatus("ERROR");
	        	response.sendRedirect("studentprofile.jsp");
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
