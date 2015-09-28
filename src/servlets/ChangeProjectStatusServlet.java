package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utility.ConnectionUtil;
import utility.MessageConstant;
import utility.MyUtility;


public class ChangeProjectStatusServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ConnectionUtil util=new ConnectionUtil();
		MyUtility myUtil=new MyUtility();
		 try{
			
		 Connection connection=util.beginConnection();
		 HttpSession session=request.getSession();
		 String status=request.getParameter("status");
		 
		 String sql="update tbl_project SET status='"+status+"' where teamid='"+request.getParameter("teamid")+"'";
		 System.out.println(sql);
		 if(util.execute(sql)==1) {
			 MessageConstant.setStatus("ERROR");
	        	MessageConstant.setMessage("List updated Successfully"); 
	        	response.sendRedirect("admindash.jsp");
		 }
		 }catch(SQLException SQLE) {
	        	System.out.println("SQL Exception in processRequest() from ChangeProjectStatusServlet class" + SQLE);
	        	MessageConstant.setStatus("ERROR");
	        	MessageConstant.setMessage("Exception");
	        	response.sendRedirect("admindash.jsp");
	        } catch(Exception E) {
	        	System.out.println("Exception in processRequest() from ChangeProjectStatusServlet class" + E);	
	        	MessageConstant.setStatus("ERROR");
	        	MessageConstant.setMessage("Exception");
	        	response.sendRedirect("admindash.jsp");
	        }
	        finally{
	        	util.endConnection();
	        }
	
		
	}

}
